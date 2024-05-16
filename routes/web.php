<?php

use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Admin\MasterController;
use App\Http\Controllers\admin\MenuController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\Web\HomeController;
use App\Http\Controllers\Web\RegistrationController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\LoginController as AdminLoginController;
use App\Http\Controllers\Admin\DashboardController;
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

});