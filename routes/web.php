<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

//Route::get('/', function () {
//    return view('welcome');
//});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');


Route::namespace('App\Http\Controllers\Front')->group(function () {
    Route::get('/', 'IndexController@index');
    // Category /listing Page Rote
    Route::match(['get', 'post'], '/products-filter', 'ProductController@filter');
    Route::get('/products/{url}', 'ProductController@products');
    Route::get('/product/{id}', 'ProductController@product');
    Route::get('/get-product-price', 'ProductController@getProductPrice');
    //check Pincode
    Route::post('/check-pincode', 'ProductController@checkPincode');

    // Check Subscriber Email
    Route::post('/check-subscriber-email', 'NewletterController@checkSubscriber');

    // Add Subscriber Email
    Route::post('/add-subscriber-email', 'NewletterController@addSubscriber');
    // add to cart Route
    Route::match(['post', 'get'], '/cart', 'ProductController@cart');

    // cart  page
    Route::match(['post', 'get'], '/add-cart', 'ProductController@addtocart');
    // Delete product form cart page
    Route::get('/cart/delete-product/{id}', 'ProductController@deleteCartProduct');
    //Update product quantity in cart
    Route::get('/cart/update-quantity/{id}/{quantity}', 'ProductController@updateCartQuantity');
    // Apply Coupon
    Route::post('/cart/apply-coupon', 'ProductController@applyCoupon');

    //Register / Login
    Route::get('/login-register', 'UsersController@userLoginRegister');
    Route::match(['get', 'post'], '/forgot-password', 'UsersController@forgotPassword');
    Route::post('/user-register', 'UsersController@register');
    // log in route
    Route::post('/user-login', 'UsersController@login');

    // User Register form Submit
    Route::get('/confirm/{code}', 'UsersController@confirmAccount');
    //Search Products
    Route::post('/search-products', 'ProductController@searchProducts');

    // user logout route
    Route::get('/user-logout', 'UsersController@logout');
    // Display Contact Us Page
    Route::match(['get', 'post'], '/page/contact', 'CmsController@contact');
    Route::match(['get', 'post'], '/page/{url}', 'CmsController@cmsPage');



    // All Routes after login
    Route::group(['middleware' => ['frontlogin']], function (){

        // user account page
        Route::match(['post', 'get'], '/account', 'UsersController@account');
        Route::post('/check-user-pwd', 'UsersController@checkUserPassword');
        Route::post('/update-user-pwd', 'UsersController@updatePassword');
        //Checkout page
        Route::match(['post', 'get'], '/checkout', 'ProductController@checkout');
        // Order Review Page
        Route::match(['post', 'get'], '/order-review', 'ProductController@orderReview');
        //Place Order
        Route::match(['post', 'get'], '/place-order', 'ProductController@placeOrder');
        // Thanks page
        Route::get('/thanks', 'ProductController@thanks');
        // Paypal page
        Route::get('/paypal', 'ProductController@paypal');
        //Users order page
        Route::get('/orders', 'ProductController@userOrders');
        //Users ordered product page
        Route::get('/orders/{id}', 'ProductController@userOrderDetails');
        // Route paypal thanks page
        Route::get('/paypal/thanks', 'ProductController@thanksPaypal');
        //Route paypal cancel page
        Route::get('/paypal/cancel', 'ProductController@cancelPaypal');
        //Wish list
        Route::match(['post', 'get'], '/wish-list', 'ProductController@wishList');
        // Delete Product form wish list
        Route::get('/wish-list/delete-product/{id}', 'ProductController@deleteWishListProduct');
    });



//    Route::match(['post', 'get'], '/login-register', 'UsersController@register');
    //Check if User already exists
    Route::match(['post', 'get'], '/check-email', 'UsersController@checkEmail');




});

Route::prefix('/admin')->namespace('App\Http\Controllers\Admin')->group(function (){
    Route::match(['post', 'get'],'/login',  'AdminController@login');
    Route::group(['middleware' => ['admin']],function (){
        Route::get('/dashboard',  'AdminController@dashboard');
        Route::get('/settings',  'AdminController@settings');
        Route::get('/logout',  'AdminController@logout');
        Route::post('/check-current-pwd', 'AdminController@checkCurrentPassword');
        Route::post('/update-pwd', 'AdminController@updateCurrentPassword');
        Route::match(['get', 'post'], '/update-admin-details', 'AdminController@updateAdminDetails');

        // Section Route
        Route::get('/sections', 'SectionController@sections');
        Route::get('/update-section-status', 'SectionController@updateSectionStatus');

        // Category Route
        Route::get('/categories', 'CategoryController@categories');
        Route::get('/update-category-status', 'CategoryController@updateCategoryStatus');
        Route::match(['get', 'post'],'/add-category', 'CategoryController@addCategory');
        Route::match(['get', 'post'],'/edit-category/{id}', 'CategoryController@editCategory');
        Route::get('delete-category/{id}', 'CategoryController@deleteCategory');

        // Product Route
        Route::match(['get', 'post'], '/add-product', 'ProductsController@addProduct');
        Route::match(['get', 'post'], '/edit-product/{id}', 'ProductsController@editProduct');
        Route::get('/view-products', 'ProductsController@viewProducts');
        Route::get('/export-products', 'ProductsController@exportProducts');
        Route::get('/update-product-status', 'ProductsController@updateProductStatus');
        Route::get('delete-product/{id}', 'ProductsController@deleteProduct');

        // Product Attribute Route
        Route::match(['get', 'post'], '/add-attribute/{id}', 'ProductsController@addAttribute');
        Route::get('/update-attribute-status', 'ProductsController@updateAttributeStatus');
        Route::get('delete-attribute/{id}', 'ProductsController@deleteAttribute');
        Route::post('/edit-attributes/{id}', 'ProductsController@editAttributes');

        // Product Alternative Image
        Route::match(['get', 'post'], '/add-images/{id}', 'ProductsController@addImages');
        Route::get('delete-image/{id}', 'ProductsController@deleteImage');

        // Coupon Right
        Route::match(['get', 'post'], '/add-coupon', 'CouponController@addCoupon');
        Route::match(['get', 'post'], '/view-coupon', 'CouponController@viewCoupon');
        Route::match(['get', 'post'], '/edit-coupon/{id}', 'CouponController@editCoupon');
        Route::get('/update-coupon-status', 'CouponController@updateCouponStatus');
        Route::get('delete-coupon/{id}', 'CouponController@deleteCoupon');

        // Banner route
        Route::match(['get', 'post'], '/add-banner', 'BannerController@addBanner');
        Route::match(['get', 'post'], '/edit-banner/{id}', 'BannerController@editBanner');
        Route::get('/view-banners', 'BannerController@viewBanner');
        Route::get('/update-banner-status', 'BannerController@updateBannerStatus');
        Route::get('delete-banner/{id}', 'BannerController@deleteBanner');

        // admin orders route
        Route::get('/view-orders', 'ProductsController@viewOrders');
        // Admin Users Charts  Route
        Route::get('/view-orders-charts', 'ProductsController@viewOrdersCharts');

        // Admin Order Details Route
        Route::get('/view-orders/{id}', 'ProductsController@viewOrdersDetails');
        // Admin Order Invoice
        Route::get('/view-order-invoice/{id}', 'ProductsController@viewOrdersInvoice');

        // Admin Order Invoice
        Route::get('/view-pdf-invoice/{id}', 'ProductsController@viewPdfInvoice');

        // update order status
        Route::post('/update-order-status', 'ProductsController@updateOrderStatus');

        // Admin Users Route
        Route::get('/view-users', 'UsersController@viewUsers');

        // Admin Users Charts  Route
        Route::get('/view-users-charts', 'UsersController@viewUsersCharts');

        // Admin Users Charts  Route
        Route::get('/view-users-countries-charts', 'UsersController@viewUsersCountriesCharts');



        // Admin Users Route
        Route::get('/export-users', 'UsersController@exportUsers');


        // Admin / Sub-admins Route
        Route::get('/view-admins', 'AdminController@viewAdmins');
        // Add Admin / Sub-admins Route
        Route::match(['get', 'post'],'/add-admin', 'AdminController@addAdmin');

        // Edit Admin / Sub-admins Route
        Route::match(['get', 'post'],'/edit-admin/{id}', 'AdminController@editAdmin');


        // Add CMS Route
        Route::match(['get','post'], '/add-cms-page', 'CmsController@addCmsPage');
        //Edit CMS Route
        Route::match(['get', 'post'], '/edit-cms-page/{id}', 'CmsController@editCmsPage');
        // View CMS page route
        Route::get('/view-cms-pages', 'CmsController@viewCmsPages');
        // Delete cms page route
        Route::get('/delete-cms/{id}', 'CmsController@deleteCmsPages');

        // currencies Routes
        // Ad Currency Route
        Route::match(['get', 'post'], '/add-currency', 'CurrencyController@addCurrency');
        // Edit currency route
        Route::match(['get', 'post'], '/edit-currency/{id}', 'CurrencyController@editCurrency');
        // Delete currency
        Route::get('/delete-currency/{id}', 'CurrencyController@deleteCurrency');
        
        // View Currency Route
        Route::get('/view-currencies', 'CurrencyController@viewCurrencies');
        // View Shipping Charge
        Route::get('/view-shipping', 'ShippingController@viewShipping');
        // Updated Shipping Charges
        Route::match(['get', 'post'], '/edit-shipping/{id}', 'ShippingController@editShipping');


        // view subscriber
        Route::get('/view-newsletter-subscriber', 'NewletterController@viewNewsletterSubscriber');
        // updated subscriber
        Route::get('/update-newsletter-status', 'NewletterController@updateNewsletter');
        // Delete Subscriber
        Route::get('/delete-newsletter/{id}', 'NewletterController@deleteNewsletter');
        // Export Newsletter Emails
        Route::get('/export-newsletter-emails', 'NewletterController@exportNewsletter');

    });

});





