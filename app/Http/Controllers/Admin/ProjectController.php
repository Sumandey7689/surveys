<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\LayoutController;
use App\Models\admin\CommonDataModel;
use App\Models\admin\SerialMaster;
use App\Rules\URLRules;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ProjectController extends Controller
{
    public function index()
    {
        $result["projectsList"] = DB::table('projects')
            ->join('client', 'client.id', '=', 'projects.client_id')
            ->select('projects.*', 'client.client_name')->get();

        $body['bodyView'] = view('admin/project/project_list_view', $result);
        return LayoutController::loadAdmin($body);
    }

    public function addEdit($id = "")
    {
        $data = LayoutController::addEditCommon($id, []);
        $data["editData"] = [];

        if ($id > 0) {
            $data["editData"] = DB::table('projects')->where('id', $id)->first();
        }

        $data["clientList"] = DB::table('client')->where(['is_active' => 'Y'])->get();
        $body['bodyView'] = view('admin/project/project_add_edit', $data);
        return LayoutController::loadAdmin($body);
    }

    public function addEditAction(Request $request)
    {
        $mode = $request->post('mode');
        $client_id = $request->post('client_id');
        $name = $request->post('name');
        $cpi = $request->post('cost_per_complete');
        $max_limit = $request->post('max_limit');
        $live_url = $request->post('live_url');
        $description = $request->post('description');

        $validator = Validator::make($request->all(), [
            'client_id' => 'required',
            'name' => 'required',
            'cost_per_complete' => 'required',
            'max_limit' => 'required',
            'live_url' => ['required', 'url', new URLRules],
            'description' => 'required',
        ], [
            'cost_per_complete' => 'CPI field required'
        ]);

        if ($validator->fails()) {
            $error = $validator->errors();
            return response()->json(['msg_status' => 0, 'errors' => $error]);
        } else {
            if ($mode == "Add") {

                $dataArray = [
                    'project_id' => SerialMaster::generateSerialNumber('PROJECT'),
                    'client_id' => $client_id,
                    'name' => $name,
                    'cost_per_complete' => $cpi,
                    'max_limit' => $max_limit,
                    'live_url' => $live_url,
                    'description' => $description,
                    'date' => now()
                ];

                $insertId = CommonDataModel::insertSingleTableData('projects', $dataArray);
                return response()->json(['msg_status' => 1, 'data' => $insertId]);
            } else {
                $id = $request->post('id');
                $dataArray = [
                    'name' => $name,
                    'cost_per_complete' => $cpi,
                    'max_limit' => $max_limit,
                    'live_url' => $live_url,
                    'description' => $description,
                    'date' => now()
                ];

                CommonDataModel::UpdateSingleTableData('projects', $dataArray, ['id' => $id], $id);
                return response()->json(['msg_status' => 1, 'data' => $id]);
            }
        }
    }

    public function view($id)
    {
        $result["projectsData"] = DB::table('projects')->join('client', 'client.id', '=', 'projects.client_id')->where('projects.id', $id)->select('projects.*', 'client.client_name', 'client.id as client_self_id')->first();
        $body['bodyView'] = view('admin/project/project_view', $result);
        return LayoutController::loadAdmin($body);
    }

    public function status(Request $request)
    {
        $id = $request->post('id');
        $status = DB::table('projects')->where(['id' => $id])->first();
        $updatedStatus = $status->status == "Live" ? "Pause" : "Live";

        CommonDataModel::UpdateSingleTableData('projects', ['status' => $updatedStatus], ['id' => $id], $id);
        return response()->json(['success' => true, 'status' => $updatedStatus, 'message' => 'Status updated successfully']);
    }

    public function duplicate(Request $request) {
        $id = $request->post('id');
        $projectData = DB::table('projects')->where(['id' => $id])->first();
        if ($projectData) {
            $projectDataArray = (array) $projectData;
            foreach ($projectDataArray as $key => $value) {
                if (is_string($value)) {
                    $projectDataArray[$key] = trim($value);
                }
            }
            unset($projectDataArray['id']);
            $projectDataArray['project_id'] = SerialMaster::generateSerialNumber('PROJECT');
            $insertedId = CommonDataModel::insertSingleTableData('projects', $projectDataArray);
            return response()->json(['status' => true, 'insertedid' => $insertedId]);
        }
        return response()->json(['status' => false]);
    }
}
