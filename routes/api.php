<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ItemDetailController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\VnpayController;
use GuzzleHttp\Middleware;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});



Route::prefix('home')->group(function () {
    Route::get('get_item_flash_sale', [HomeController::class, 'get_item_flash_sale']);
    Route::get('get_item_by_category/{id_category}/{isASC}', [HomeController::class, 'get_item_by_category']);
    Route::get('search_item/{name}/{id_categogy}/{isASC}', [HomeController::class, 'search_item']);
});

Route::prefix('item_detail')->group(function () {
    Route::get('/{id_item}', [ItemDetailController::class, 'item_detail']);
    Route::get('get_shop/{id_item}', [ItemDetailController::class, 'get_shop']);
    Route::get('get_rate/{id_item}', [ItemDetailController::class, 'get_rate']);
    Route::post('add_cart', [ItemDetailController::class, 'add_cart'])->middleware('api');
    Route::post('add_bill/{price}/{is_vnpay}', [ItemDetailController::class, 'add_bill']);
    Route::get('get_address/{id_user}', [ItemDetailController::class, 'get_address']);
});
Route::group([
    'prefix' => 'cart'
], function ($router) {
    Route::get('get_all_cart', [CartController::class, 'get_all_cart']);
    Route::delete('delete_cart/{id_cart}', [CartController::class, 'delete_cart']);
    Route::put('change_amount/{id_cart}/{is_tang}', [CartController::class, 'change_amount']);
});

Route::prefix('order')->group(function () {
    Route::get('address_default', [OrderController::class, 'address_default']);
    Route::get('add_address_history/{province}/{district}/{ward}/{is_default}/{place_detail}', [OrderController::class, 'add_address_history']);
    Route::get('get_address_history', [OrderController::class, 'get_address_history']);
    Route::get('set_address_default/{id}', [OrderController::class, 'set_address_default']);
    Route::post('add_bill', [OrderController::class, 'add_bill']);
    Route::get('get_order_all', [OrderController::class, 'get_order_all']);
    Route::get('update_received/{id_order}', [OrderController::class, 'update_received']);
    Route::get('get_bill_refresh/{id_bill}', [OrderController::class, 'get_bill_refresh']);
});
Route::prefix('vnpay')->group(function () {
    Route::post('get_url', [VnpayController::class, 'get_url']);
    Route::get('add_vnpay/{id_bill}/{id}/{bank_code}/{money}/{is_payment}', [VnpayController::class, 'add_vnpay']);
    Route::put('update_bill', [VnpayController::class, 'update_bill']);
    Route::get('get_vnpay/{id_bill}', [VnpayController::class, 'get_vnpay']);
});

Route::prefix('rate_item')->group(function () {
    Route::post('add_rate_item', [OrderController::class, 'add_rate_item']);
});

Route::prefix('shop')->group(function () {
    Route::post('login', [ShopController::class, 'login']);
    Route::get('get_order/{id_shop}', [ShopController::class, 'get_order']);
    Route::get('get_orde_data/{id_order}', [ShopController::class, 'get_orde_data']);
    Route::put('cofirm_order', [ShopController::class, 'cofirm_order']);
    Route::post('update_address', [ShopController::class, 'update_address']);
});


Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('logout', [AuthController::class, 'logout']);
    Route::post('refresh', [AuthController::class, 'refresh']);
    Route::post('me', [AuthController::class, 'me']);
    Route::post('register', [AuthController::class, 'register_account']);
});