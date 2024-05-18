<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\LayoutController;
use App\Models\admin\LogTable;
use Illuminate\Support\Facades\Schema;

class DashboardController extends Controller
{
    public function index()
    {
        $data['title'] = [];
        $data['bodyView'] = view('admin/dashboard/dashboard_view', $data);
        return LayoutController::loadAdmin($data);
    }

    public function logActivity($table, $rowId)
    {
        $table = str_replace(' ', '', $table);
        $result["logData"] = LogTable::where(['table_name' => $table, 'row_id' => $rowId])->with('user')->get();
        $result["tableCol"] = Schema::getColumnListing($table);
        return view('admin/log', $result)->render();
    }
}
