<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Http\Controllers\LayoutController;
use App\Models\admin\LogTable;
use App\Models\admin\Projects;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use SebastianBergmann\CodeCoverage\Report\Xml\Project;

class DashboardController extends Controller
{
    public function index()
    {
        $data['title'] = [];
        $data['totalVendors'] = DB::table('vendor')->where('is_active', 'Y')->count();
        $data['pendingPayments'] = DB::table('payments')
            ->whereNotIn('status', ['Rejected', 'Paid'])
            ->sum('amount');

        $data['pendingLeads'] = DB::table('leads')->whereNotIn('status', ['Complete', 'Terminates', 'Quota Full'])->count();
        $data['activeProjects'] = DB::table('projects')->whereNot('status', 'Pause')->count();
        $data['bodyView'] = view('admin/dashboard/dashboard_view', $data);

        $projectsChart = Projects::with('vendors')->get();
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
