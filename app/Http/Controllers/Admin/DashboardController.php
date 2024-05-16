<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\LayoutController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        $data['title'] = [];
        $data['bodyView'] = view('admin/dashboard/dashboard_view', $data);
        return LayoutController::loadAdmin($data);
    }
}
