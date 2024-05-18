<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class URLController extends Controller
{
    public function completeAction(Request $request, $clientId) {
        $username = $request->get('username');

        echo $clientId . " " . $username;
    }

    public function terminateAction(Request $request, $clientId) {
        $username = $request->get('username');

        echo $clientId . " " . $username;
    }

    public function quotafullAction(Request $request, $clientId) {
        $username = $request->get('username');

        echo $clientId . " " . $username;
    }
}
