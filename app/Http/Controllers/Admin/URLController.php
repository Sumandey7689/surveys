<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\admin\CommonDataModel;
use App\Models\admin\Projects;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Jenssegers\Agent\Agent;
use PhpParser\JsonDecoder;

class URLController extends Controller
{
    public function completeAction(Request $request, $clientId)
    {
        if (!$request->has('username')) {
            abort(404);
        }

        
        $clientInfo = DB::table('client')->where('client_id', $clientId)->first();
        $username = $request->get('username');
        $leadsInfo = DB::table('leads')->where('id', $username)->first();


        $userInfo = $this->getUserInfo($request);
        if (strtolower($userInfo['country']) != "india") {
            CommonDataModel::UpdateSingleTableData('leads', ['status' => 'Terminates', 'client_id' => $clientInfo->id], ['id' => $leadsInfo->id], $leadsInfo->id);
            return view('admin/url/terminates', []);
        }


        if (empty($clientInfo) || empty($leadsInfo)) {
            abort(404);
        }

        if ($leadsInfo->status == "Pending") {

            CommonDataModel::UpdateSingleTableData('leads', ['status' => 'Complete', 'client_id' => $clientInfo->id], ['id' => $leadsInfo->id], $leadsInfo->id);
            $vendorInfo = DB::table('vendor')->where('id', $leadsInfo->vendor_id)->first();

            $paymentInfo = DB::table('payments')
                ->join('projects', 'projects.id', '=', 'payments.project_id')
                ->where(['payments.vendor_id' => $vendorInfo->id, 'payments.project_id' => $vendorInfo->project_id])
                ->select('payments.*', 'projects.cost_per_complete as cpi')
                ->orderByDesc('payments.id')
                ->first();

            CommonDataModel::UpdateSingleTableData('payments', ['amount' => $paymentInfo->amount + $paymentInfo->cpi], ['vendor_id' => $vendorInfo->id, 'project_id' => $vendorInfo->project_id], $paymentInfo->id);
            CommonDataModel::UpdateSingleTableData('vendor', ['complete_count' => $vendorInfo->complete_count + 1], ['id' => $vendorInfo->id]);
        }
        return view('admin/url/complete', []);
    }

    public function terminateAction(Request $request, $clientId)
    {
        if (!$request->has('username')) {
            abort(404);
        }

        $clientInfo = DB::table('client')->where('client_id', $clientId)->first();
        $username = $request->get('username');
        $leadsInfo = DB::table('leads')->where('id', $username)->first();
        if (empty($clientInfo) || empty($leadsInfo)) {
            abort(404);
        }

        if ($leadsInfo->status == "Pending") {
            CommonDataModel::UpdateSingleTableData('leads', ['status' => 'Terminates', 'client_id' => $clientInfo->id], ['id' => $leadsInfo->id], $leadsInfo->id);
            $vendorInfo = DB::table('vendor')->where('id', $leadsInfo->vendor_id)->first();
            CommonDataModel::UpdateSingleTableData('vendor', ['terminates_count' => $vendorInfo->terminates_count + 1], ['id' => $vendorInfo->id]);
        }
        return view('admin/url/terminates', []);
    }

    public function quotafullAction(Request $request, $clientId)
    {
        if (!$request->has('username')) {
            abort(404);
        }

        $clientInfo = DB::table('client')->where('client_id', $clientId)->first();
        $username = $request->get('username');
        $leadsInfo = DB::table('leads')->where('id', $username)->first();
        if (empty($clientInfo) || empty($leadsInfo)) {
            abort(404);
        }

        if ($leadsInfo->status == "Pending") {
            CommonDataModel::UpdateSingleTableData('leads', ['status' => 'Quota Full', 'client_id' => $clientInfo->id], ['id' => $leadsInfo->id], $leadsInfo->id);
        }
        return view('admin/url/quotafull', []);
    }

    public function URLAction(Request $request, $vendorId, $projectId)
    {
        if (!$request->has('user')) {
            abort(404);
        }

        $userId = $request->get('user');
        $userInfo = $this->getUserInfo($request);

        if (strtolower($userInfo['country']) != "india") {
            return view('admin/url/terminates', []);
        }

        $projectsInfo = DB::table('projects')->where(['project_id' => $projectId, 'status' => 'Live'])->first();
        $vendorInfo = DB::table('vendor')->where(['id' => $vendorId, 'is_active' => 'Y'])->first();

        if (empty($projectsInfo) || empty($vendorInfo)) {
            return view('admin/url/inactive', []);
        }

        $isMaxQuotaReached = Projects::getEventCounts($projectsInfo->id);

        if ($isMaxQuotaReached->complete_count > $isMaxQuotaReached->max_limit) {
            return view('admin/url/quotafull', []);
        }

        $existingLeads = DB::table('leads')->where(['project_id' => $projectsInfo->id, 'uid' => $userId, 'vendor_id' => $vendorId])->orderByDesc('id')->first();
        if (empty($existingLeads) || json_decode($existingLeads->user_info)->ip_address != $userInfo['ip_address']) {
            $insertedLeadsId = CommonDataModel::insertSingleTableData('leads', ['project_id' => $projectsInfo->id, 'vendor_id' => $vendorInfo->id, 'uid' => $userId, 'user_info' => json_encode($userInfo), 'date' => now()]);
            DB::table('vendor')->where('id', $vendorId)->update(['clicks_count' => $vendorInfo->clicks_count + 1]);
        } else {
            $insertedLeadsId = $existingLeads->id;
        }

        $result['liveRedirectUrl'] = $projectsInfo->live_url . $insertedLeadsId;
        return view('admin/url/redirect', $result);
    }


    public function getUserInfo(Request $request)
    {
        $agent = new Agent();
        $ip = $request->ip();
        $apiKey = '0F6A60C1B4EB021FD703558A61067E37';
        $url = "https://api.ip2location.io/?key={$apiKey}&ip={$ip}";

        try {
            $response = Http::get($url);
            if ($response->successful()) {
                $data = $response->json();
                $userInfo = [
                    'user_agent' => [
                        'browser' => $agent->browser(),
                        'platform' => $agent->platform(),
                        'device' => $agent->device(),
                    ],
                    'ip_address' => $ip,
                    'country' => $data['country_name'],
                    'region' => $data['region_name'],
                    'city' => $data['city_name'],
                    'latitude' => $data['latitude'],
                    'longitude' => $data['longitude'],
                    'zip_code' => $data['zip_code'],
                    'time_zone' => $data['time_zone'],
                    'asn' => $data['asn'],
                    'as' => $data['as'],
                    'is_proxy' => $data['is_proxy'],
                ];
                return $userInfo;
            } else {
                return response()->json(['error' => 'Failed to retrieve geolocation information.']);
            }
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()]);
        }
    }
}
