<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Jenssegers\Agent\Agent;

class URLController extends Controller
{
    public function completeAction(Request $request, $clientId)
    {
        if (!$request->has('username')) {
            abort(404);
        }

        $username = $request->get('username');

        echo $clientId . " " . $username;
    }

    public function terminateAction(Request $request, $clientId)
    {
        if (!$request->has('username')) {
            abort(404);
        }

        $username = $request->get('username');

        echo $clientId . " " . $username;
    }

    public function quotafullAction(Request $request, $clientId)
    {
        if (!$request->has('username')) {
            abort(404);
        }

        $username = $request->get('username');

        echo $clientId . " " . $username;
    }

    public function URLAction(Request $request, $vendorId, $projectId)
    {
        if (!$request->has('user')) {
            abort(404);
        }

        $user = $request->get('user');
        $userInfo = $this->getUserInfo($request);
        return view('admin/redirect', []);
    }


    public function getUserInfo(Request $request)
    {
        $agent = new Agent();
        $userAgent = $request->userAgent();

        $agent->setUserAgent($userAgent);

        $userInfo = [
            'user_agent' => [
                'browser' => $agent->browser(),
                'platform' => $agent->platform(),
                'device' => $agent->device(),
            ],
            'ip_address' => $request->ip(),
        ];

        return $userInfo;
    }
}
