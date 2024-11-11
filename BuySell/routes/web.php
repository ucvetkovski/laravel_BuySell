<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BaseController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [BaseController::class, 'getData'])->name('index');


Route::get('/login', [AuthController::class, 'showLogin'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::get('/register', [AuthController::class, 'showRegistration'])->name('registration');
Route::post('/register', [AuthController::class, 'register']);
Route::post('/getCities', [AuthController::class, 'getCities'])->name('cities');

Route::get('/item/{id}', [ItemController::class, 'getItem'])->name('itemPage');
Route::get('/items', [ItemController::class, 'getAllItems'])->name('allItems');
Route::get('/newArrivals', [ItemController::class, 'getNewItems'])->name('newItems');
Route::get('/search', [ItemController::class, 'search'])->name('search');
Route::get('/category/{id}', [ItemController::class, 'getItemsByCategory'])->name('itemsByCategory');

Route::get('/author', [BaseController::class, 'author'])->name('author');






Route::middleware('user')->group(function () {

    Route::get('/addItem', [ItemController::class, 'showAddForm'])->name('addForm');
    Route::post('/addItem', [ItemController::class, 'addItem'])->name('commitAdd');

    Route::get('/checkout/{id}', [ItemController::class, 'checkoutPage'])->name('checkoutPage');
    Route::post('/checkout', [ItemController::class, 'checkout']);

    Route::get('/profile', [UserController::class, 'getProfile'])->name('profile');

    Route::get('/editProfile', [UserController::class, 'editProfileForm'])->name('editProfile');
    Route::post('/commitEdit', [AdminController::class, 'saveChanges'])->name('saveEdit');



    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');
});


Route::middleware('admin')->group(function () {

    Route::get('/landing', [AdminController::class, 'index'])->name('admin');
    Route::get('/log', [AdminController::class, 'showLog']);
    Route::get('/transactions', [AdminController::class, 'getTransactions'])->name('transactions');
    Route::get('/users', [AdminController::class, 'getUsers']);
    Route::get('/allUsers', [AdminController::class, 'showUsers'])->name('users');
    Route::get('/addUser', [AdminController::class, 'showRegForm'])->name('addUser');
    Route::get('/getTransactionData', [AdminController::class, 'getData'])->name('dashboardData');

    Route::post('/getUserData', [AdminController::class, 'getUserData'])->name('getUserData');
    Route::get('/editUser', [AdminController::class, 'showEditForm'])->name('editUser');

    Route::post('/deleteUser', [UserController::class, 'deleteUser'])->name('deleteUser');


    // Route::post('/commitEdit', [AdminController::class, 'saveChanges'])->name('saveEdit');
});

