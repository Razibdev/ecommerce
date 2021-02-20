@extends('layouts.admin_layout.admin_layout')
@push('css')
    <link rel="stylesheet" href="{{asset('admin/plugins/select2/css/select2.min.css')}}">
    <link rel="stylesheet" href="{{asset('admin/plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css')}}">
@endpush
@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Shipping</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Edit Shipping</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>



        <!-- Main content -->
        <section class="content">

            <div class="container-fluid">
                <div class="row">
                    <!-- left column -->
                    <div class="col-md-6">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Edit Shipping</h3>
                            </div>
                            <!-- /.card-header -->
                            @if ($errors->any())
                                <div class="alert alert-danger" style="margin-top: 10px;">
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                        @endif
                        <!-- form start -->
                            <form role="form" method="POST" action="{{url('admin/edit-shipping/'.$shippingDetails->id)}}">
                                {{csrf_field()}}
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <input type="hidden" name="id" value="{{$shippingDetails->id}}">
                                            <div class="form-group">
                                                <label for="currency_code">Country</label>
                                                <input class="form-control" readonly value="{{$shippingDetails->country}}" >
                                            </div>

                                            <div class="form-group">
                                                <label for="shipping_charges0_500g">Shipping Charges(0-500g) </label>
                                                <input class="form-control" id="shipping_charges0_500g" value="{{$shippingDetails->shipping_charges0_500g}}" name="shipping_charges0_500g" placeholder="Enter shipping_charges0_500g" >
                                            </div>

                                            <div class="form-group">
                                                <label for="shipping_charges501_1000g">Shipping Charges(501-1000g) </label>
                                                <input class="form-control" id="shipping_charges501_1000g" value="{{$shippingDetails->shipping_charges501_1000g}}" name="shipping_charges501_1000g" placeholder="Enter shipping_charges501_1000g" >
                                            </div>

                                            <div class="form-group">
                                                <label for="shipping_charges1001_2000g">Shipping Charges(1001-2000g) </label>
                                                <input class="form-control" id="shipping_charges1001_2000g" value="{{$shippingDetails->shipping_charges1001_2000g}}" name="shipping_charges1001_2000g" placeholder="Enter shipping_charges1001_2000g" >
                                            </div>

                                            <div class="form-group">
                                                <label for="shipping_charges2001_3000g">Shipping Charges(2001-3000g) </label>
                                                <input class="form-control" id="shipping_charges2001_3000g" value="{{$shippingDetails->shipping_charges2001_3000g}}" name="shipping_charges2001_3000g" placeholder="Enter shipping_charges2001_3000g" >
                                            </div>

                                            
                                        </div>
                                    </div>

                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.card -->

                    </div>
                    <!--/.col (left) -->

                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
@endsection
@push('js')
    <script src="{{asset('admin/plugins/select2/js/select2.full.min.js')}}"></script>
    <script src="{{asset('admin/js/admin_script.js')}}"></script>

    <script>
        //Initialize Select2 Elements
        $('.select2').select2();

        //Initialize Select2 Elements
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        });
    </script>
@endpush
