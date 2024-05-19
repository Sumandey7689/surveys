<?php

use App\Http\Controllers\Admin\ClientController;
use App\Http\Controllers\admin\DashboardController;
use App\Http\Controllers\admin\MenuController;
use App\Http\Controllers\admin\UserController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\LoginController as AdminLoginController;
use App\Http\Controllers\Admin\ProjectController;
use App\Http\Controllers\Admin\URLController;
use App\Http\Controllers\Admin\VendorController;
use App\Models\Admin\Menu;
use Illuminate\Support\Facades\Schema;

// Admin Routing
Route::get('admin', [AdminLoginController::class, 'index']);
Route::post('admin/auth', [AdminLoginController::class, 'auth'])->name('admin.auth');
Route::get('admin/logout', [AdminLoginController::class, 'logout'])->name('admin.logout');

Route::prefix('admin')->middleware(['admin_auth'])->group(function () {
    if (Schema::hasTable('menus')) {
        $menus = Menu::all()->whereNotNull('controller');
        foreach ($menus as $list) {
            $controller = "App\Http\Controllers\Admin\\" . $list['controller'];
            Route::get($list['route'], [$controller, $list['method']]);
        }
    }

    Route::post('user/addedit/{id?}', [UserController::class, 'addEdit']);
    Route::post('user/addeditaction', [UserController::class, 'addEditAction']);
    Route::get('user/status/{status}/{id}', [UserController::class, 'status']);
    Route::post('user/getloginLogoutDetailByUserId', [UserController::class, 'getloginLogoutDetailByUserId']);
    Route::get('menupermission', [MenuController::class, 'index']);
    Route::post('menupermission/getUsersPermittedMenu', [MenuController::class, 'getUsersPermittedMenu']);
    Route::post('menupermission/assignMenu', [MenuController::class, 'assignMenu']);
    Route::post('user/change_password', [AdminLoginController::class, 'changePassword']);
    Route::post('menupermission/assignmenu', [MenuController::class, 'assignMenu']);
    Route::post('log/{table}/{rowid}', [DashboardController::class, 'logActivity']);
    
    Route::get('client/addedit/{id?}', [ClientController::class, 'addEdit']);
    Route::post('clientaddeditajax', [ClientController::class, 'addEditAction']);
    Route::get('client/view/{id}', [ClientController::class, 'view']);
    Route::post('client/status', [ClientController::class, 'status']);
    
    Route::get('project/addedit/{id?}', [ProjectController::class, 'addEdit']);
    Route::post('projectaddeditajax', [ProjectController::class, 'addEditAction']);
    Route::get('project/view/{id}', [ProjectController::class, 'view']);
    Route::post('project/status', [ProjectController::class, 'status']);
    Route::post('project/duplicate', [ProjectController::class, 'duplicate']);

    Route::get('vendor/addedit/{id?}', [VendorController::class, 'addEdit']);
    Route::post('vendoraddeditajax', [VendorController::class, 'addEditAction']);
    Route::get('vendor/view/{id}', [VendorController::class, 'view']);
    Route::post('vendor/status', [VendorController::class, 'status']);
});

Route::get('redirects/c/{client_id}/complete', [URLController::class, 'completeAction']);
Route::get('redirects/c/{client_id}/terminate', [URLController::class, 'terminateAction']);
Route::get('redirects/c/{client_id}/quotafull', [URLController::class, 'quotafullAction']);