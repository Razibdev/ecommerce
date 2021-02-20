@extends('layouts.admin_layout.admin_layout')
@push('css')
    <link rel="stylesheet" href="{{asset('admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">

@endpush
@section('content')
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Catalogues</h1>
                        <div class="panel">
                            <div class="panel-body">
                                <div class="wait" id="wait">

                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Orders</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">View Orders</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="orders" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Order Date</th>
                                        <th>Customer Name</th>
                                        <th>Customer Email</th>
                                        <th>Ordered Products</th>
                                        <th>Order Amount</th>
                                        <th>Order Status</th>
                                        <th>Payment Method</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($orders as $order)

                                        <tr>
                                            <td>{{$order->id}}</td>
                                            <td>{{$order->created_at}}</td>

                                            <td>
                                                {{$order->name}}
                                            </td>

                                            <td>{{ $order->user_email}}</td>
                                            <td>
                                                @foreach($order->orders as $pro)
                                                    {{$pro->product_code}}
                                                    ({{$pro->product_qty}})<br>
                                                 @endforeach
                                            </td>
                                            <td>{{ $order->grand_total}}</td>
                                            <td>{{ $order->order_status}}</td>
                                            <td>{{ $order->payment_method}}</td>

                                            <td>

                                                    <a target="_blank" href="{{url('admin/view-orders/'.$order->id)}}" class="btn btn-success btn-mini">View Order Details</a>&nbsp;<br>
                                                @if($order->order_status == "Shipped" || $order->order_status == "Delivered" || $order->order_status == "Paid")
                                                <a target="_blank" href="{{url('admin/view-order-invoice/'.$order->id)}}" class="btn btn-warning btn-mini">View Order Invoice</a>&nbsp<br>
                                                <a target="_blank" href="{{url('admin/view-pdf-invoice/'.$order->id)}}" class="btn btn-primary btn-mini">View PDF Invoice</a>
                                                    @endif

                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Order Date</th>
                                        <th>Customer Name</th>
                                        <th>Customer Email</th>
                                        <th>Ordered Products</th>
                                        <th>Order Amount</th>
                                        <th>Order Status</th>
                                        <th>Payment Method</th>
                                        <th>Action</th>
                                    </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>

@endsection

@push('js')
    <script src="{{asset('admin/plugins/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{asset('admin/plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{asset('admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
    <script src="{{asset('admin/js/admin_script.js')}}"></script>

    <script>
        $(document).ready(function () {
            $("#orders").DataTable({"order": [[ 3, "desc" ]]});
        });

        $(document).ready(function(){
            $(document).on('change', '.js-switch', function () {

                let status = $(this).prop('checked') == true ? 1 : 0;
                let product_id = $(this).data('id');

                $.ajax({
                    dataType:'json',
                    type:"GET",
                    url: "{{url('admin/update-product-status')}}",
                    data:{'status': status, 'product_id' : product_id},
                    success:function(data){
                        // console.log(data.message);
                        toastr.options.closeButton = true;
                        toastr.options.progressBar = true;
                        toastr.options.showMethod = 'fadeIn';
                        toastr.options.hideMethod = 'fadeOut';

                        toastr.options.closeMethod = 'fadeOut';
                        toastr.options.closeDuration = 100;
                        toastr.success(data.message);

                    }
                })
            });
        });

        $(document).ready(function () {
            $(document).on('click', '.confirmDelete', function () {

                let name = $(this).attr('name');
                let id = $(this).data('id');
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                        window.location.href = "/admin/delete-"+name+"/"+id;
                    }
                });
            });
        });


    </script>
@endpush

