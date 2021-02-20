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
                        <h1>Coupons</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Edit Coupon</li>
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
                                <h3 class="card-title">Edit Coupon</h3>
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
                            <form role="form" method="POST" action="{{url('admin/edit-coupon/'.$couponDetails->id)}}" name="edit_coupon" id="edit_coupon">
                                {{csrf_field()}}
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div class="form-group">
                                                <label for="category_name">Coupon Code</label>
                                                <input class="form-control" id="coupon_code" name="coupon_code" placeholder="Enter Coupon Code" minlength="5" maxlength="15" required value="{{$couponDetails->coupon_code}}" >
                                            </div>

                                            <div class="form-group">
                                                <label>Amount Type</label>
                                                <select class="select2bs4" name="amount_type" id="amount_type"  data-placeholder="Select a State" style="width: 100%;">
                                                    <option value="Percentage" @if($couponDetails->amount_type == 'Percentage') selected @endif>Percentage</option>
                                                    <option value="Fixed" @if($couponDetails->amount_type == 'Fixed') selected @endif>Fixed</option>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="category_name">Amount</label>
                                                <input type="number" min="0" class="form-control" id="amount" name="amount" placeholder="Enter Amount" required value="{{$couponDetails->amount}}">
                                            </div>

                                            <div class="form-group">
                                                <label for="category_name">Expiry Date</label>
                                                <input class="form-control" id="expiry_date" name="expiry_date" placeholder="Enter Expiry Date" value="{{$couponDetails->expiry_date}}">
                                            </div>

                                            <div class="form-group">
                                                <label for="category_name">Enable</label> &nbsp;
                                                <input type="checkbox" id="status" name="status" value="1" @if($couponDetails->status == 1)  checked @endif>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Edit Coupon</button>
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
