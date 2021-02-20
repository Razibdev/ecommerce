<?php $url = url()->current();  ?>
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{url('/admin/dashboard')}}" class="brand-link">
        <img src="{{asset('admin/img/AdminLTELogo.png')}}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
             style="opacity: .8">
        <span class="brand-text font-weight-light">E-com Admin</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                <img src="{{asset('admin/img/user2-160x160.jpg')}}" class="img-circle elevation-2" alt="User Image">
            </div>
            <div class="info">
                <a href="#" class="d-block">{{ucwords(\Illuminate\Support\Facades\Auth::guard('admin')->user()->name)}}</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
                     with font-awesome or any other icon font library -->
                <li class="nav-item">
                    @if(Session::get('page') == 'dashboard')
                        <?php $active="active"; ?>
                    @else
                        <?php $active = ""; ?>
                    @endif
                    <a href="{{url('admin/dashboard')}}" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-th"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>

                @if(Session::get('page') == 'settings' || Session::get('page') == 'update-admin-details')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action='close'; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Settings
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @if(Session::get('page') == 'settings')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/settings')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Update Admin Password</p>
                            </a>
                        </li>
                            @if(Session::get('page') == 'update-admin-details')
                                <?php $active="active"; ?>
                            @else
                                <?php $active = ""; ?>
                            @endif
                        <li class="nav-item">
                            <a href="{{url('admin/update-admin-details')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Update Admin Details</p>
                            </a>
                        </li>
                    </ul>
                </li>


                @if(Session::get('page') == 'sections')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action='close'; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Catelogues
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @if(Session::get('page') == 'sections')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/sections')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Sections</p>
                            </a>
                        </li>

                    </ul>
                </li>

                @if(Session::get('adminDetails')['categories_full_access'] == 1)
                @if(Session::get('page') == 'add-category' || Session::get('page') == 'categories')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Categories
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                        @if(Session::get('page') == 'add-category')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/add-category')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Add Category</p>
                            </a>
                        </li>
                        @if(Session::get('page') == 'categories')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/categories')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>View Category</p>
                            </a>
                        </li>

                    </ul>
                </li>
                    @else

                    @if(Session::get('page') == 'add-category' || Session::get('page') == 'categories')
                        <?php $active="active"; $action='open'; ?>
                    @else
                        <?php $active = ""; $action=''; ?>
                    @endif

                    <li class="nav-item has-treeview menu-{{$action}}">
                        <a href="#" class="nav-link {{$active}}">
                            <i class="nav-icon fas fa-tachometer-alt"></i>
                            <p>
                                Categories
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            @if(Session::get('adminDetails')['categories_edit_access'] == 1)
                                @if(Session::get('page') == 'add-category')
                                    <?php $active="active"; ?>
                                @else
                                    <?php $active = ""; ?>
                                @endif
                                <li class="nav-item">
                                    <a href="{{url('/admin/add-category')}}" class="nav-link {{$active}}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Add Category</p>
                                    </a>
                                </li>
                            @endif
                            @if(Session::get('adminDetails')['categories_view_access'] == 1)
                                @if(Session::get('page') == 'categories')
                                    <?php $active="active"; ?>
                                @else
                                    <?php $active = ""; ?>
                                @endif
                                <li class="nav-item">
                                    <a href="{{url('/admin/categories')}}" class="nav-link {{$active}}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View Category</p>
                                    </a>
                                </li>
                            @endif
                        </ul>
                    </li>
                @endif


                @if(Session::get('adminDetails')['products_access'] == 1)
                @if(Session::get('page') == 'add_product' || Session::get('page') == 'product_view')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action='close'; ?>
                @endif


                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Products
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @if(Session::get('page') == 'add_product')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/add-product')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Add Product</p>
                            </a>
                        </li>

                            @if(Session::get('page') == 'product_view')
                                <?php $active="active"; ?>
                            @else
                                <?php $active = ""; ?>
                            @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/view-products')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Products</p>
                            </a>
                        </li>
                    </ul>
                </li>
            @endif


                @if(Session::get('page') == 'coupon' || Session::get('page') == 'coupons')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Coupon
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @if(Session::get('page') == 'coupon')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/add-coupon')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Add Coupon</p>
                            </a>
                        </li>

                        @if(Session::get('page') == 'coupons')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/view-coupon')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>View Coupon</p>
                            </a>
                        </li>
                    </ul>
                </li>
            @if(Session::get('adminDetails')['orders_access'] == 1)
                @if(Session::get('page') == 'view_orders' || Session::get('page') == 'orders_charts')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Orders
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                            @if(Session::get('page') == 'view_orders')
                                <?php $active="active"; ?>
                            @else
                                <?php $active = ""; ?>
                            @endif
                            <li class="nav-item">
                                <a href="{{url('/admin/view-orders')}}" class="nav-link {{$active}}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>View Orders</p>
                                </a>
                            </li>

                                @if(Session::get('page') == 'orders_charts')
                                    <?php $active="active"; ?>
                                @else
                                    <?php $active = ""; ?>
                                @endif
                                <li class="nav-item">
                                    <a href="{{url('/admin/view-orders-charts')}}" class="nav-link {{$active}}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>View Orders Charts</p>
                                    </a>
                                </li>
                    </ul>
                </li>
            @endif


                @if(Session::get('page') == 'coupon' || Session::get('page') == 'coupons')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Admins/Sub-Admins
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                        @if(Session::get('page') == 'add_admins')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/add-admin')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Add Admin/Sub-Admin</p>
                            </a>
                        </li>

                        @if(Session::get('page') == 'view_admins')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/view-admins')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Views Admins/Sub-Admins</p>
                            </a>
                        </li>
                    </ul>
                </li>

            @if(Session::get('adminDetails')['users_access'] == 1)
                @if(Session::get('page') == 'users' || Session::get('page') == 'users-charts')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Users
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                        @if(Session::get('page') == 'users')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/view-users')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>View Users</p>
                            </a>
                        </li>


                            @if(Session::get('page') == 'users-charts')
                                <?php $active="active"; ?>
                            @else
                                <?php $active = ""; ?>
                            @endif
                            <li class="nav-item">
                                <a href="{{url('/admin/view-users-charts')}}" class="nav-link {{$active}}">
                                    <i class="far fa-circle nav-icon"></i>
                                    <p>View Users Chart</p>
                                </a>
                            </li>
                    </ul>
                </li>
@endif



                @if(Session::get('page') == 'add_banner' || Session::get('page') == 'view_banner')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Banner
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @if(Session::get('page') == 'add_banner')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/add-banner')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Add Banner</p>
                            </a>
                        </li>

                        @if(Session::get('page') == 'view_banner')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/view-banners')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>View Banner</p>
                            </a>
                        </li>
                    </ul>
                </li>


                @if(Session::get('page') == 'add-cms' || Session::get('page') == 'view-cms-pages')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            CMS Pages
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @if(Session::get('page') == 'add-cms')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/add-cms-page')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Add CMS Page</p>
                            </a>
                        </li>

                        @if(Session::get('page') == 'view-cms-pages')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/view-cms-pages')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>View CMS Page</p>
                            </a>
                        </li>
                    </ul>
                </li>


                @if(Session::get('page') == 'add-cms' || Session::get('page') == 'view-cms-pages')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Currencies
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        @if(Session::get('page') == 'add-cms')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/add-currency')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Add Currency</p>
                            </a>
                        </li>

                        @if(Session::get('page') == 'view-cms-pages')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/view-currencies')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>View Currencies</p>
                            </a>
                        </li>
                    </ul>
                </li>




                @if(Session::get('page') == 'add-cms' || Session::get('page') == 'view-cms-pages')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Shipping
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                        @if(Session::get('page') == 'view-cms-pages')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/view-shipping')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>View Shipping</p>
                            </a>
                        </li>


                    </ul>
                </li>













                @if(Session::get('page') == 'add-subscriber' || Session::get('page') == 'view-subscriber')
                    <?php $active="active"; $action='open'; ?>
                @else
                    <?php $active = ""; $action=''; ?>
                @endif

                <li class="nav-item has-treeview menu-{{$action}}">
                    <a href="#" class="nav-link {{$active}}">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Newsletter Subscriber
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">

                        @if(Session::get('page') == 'view-subscriber')
                            <?php $active="active"; ?>
                        @else
                            <?php $active = ""; ?>
                        @endif
                        <li class="nav-item">
                            <a href="{{url('/admin/view-newsletter-subscriber')}}" class="nav-link {{$active}}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>View Newsletter Subscriber</p>
                            </a>
                        </li>


                    </ul>
                </li>






            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
