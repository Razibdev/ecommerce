@extends('layouts.admin_layout.admin_layout')

@push('css')
    <link rel="stylesheet" href="{{asset('admin/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css')}}">
    <link rel="stylesheet" href="{{asset('admin/plugins/datatables-responsive/css/responsive.bootstrap4.min.css')}}">

@endpush

@section('content')
    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Catalogues</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Add Product Images</li>
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
                    <div class="col-md-12">
                        <!-- general form elements -->
                        <div class="card card-primary">
                            <div class="card-header">
                                <h3 class="card-title">Add Product Images</h3>
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
                            <form role="form" method="POST" action="{{url('admin/add-images/'.$productDetails->id)}}" enctype="multipart/form-data">
                                {{csrf_field()}}
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            {{--<input type="text" style="display: none;" name="product_id" value="{{$productDetails->id}}">--}}
                                            <div class="form-group">
                                                <label for="category_name">Product Name: </label>
                                                <span for="category_name">{{$productDetails->product_name}}</span>
                                            </div>

                                            <div class="form-group">
                                                <label for="category_name">Product Code: </label>
                                                <span >{{$productDetails->product_code}}</span>
                                            </div>

                                            <div class="form-group">
                                                <label for="category_name">Product Color: </label>
                                                <span>{{$productDetails->product_color}}</span>

                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <img width="120" src="{{asset('image/product_image/small/'.$productDetails->image)}}" alt="">
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="field_wrapper">
                                                    <div>
                                                        <div class="form-group">
                                                            <label for="image">Alternative Image(s)</label><br>
                                                            <input type="file"  id="image" name="image[]" multiple style="margin-bottom: 10px;" >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer">
                                    <button type="submit" class="btn btn-primary">Add Images</button>
                                </div>
                            </form>
                        </div>
                        <!-- /.card -->

                        <form name="editImageForm" id="editImageForm" method="POST"  action="{{url('admin/edit-images/'.$productDetails->id)}}">{{csrf_field()}}

                            <div class="card">
                                <div class="card-header">
                                    <h3 class="card-title">Added Product Images</h3>
                                    <div class="panel">
                                        <div class="panel-body">
                                            <div class="wait" id="wait">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <table id="attributes" class="table table-bordered table-striped">
                                        <thead>
                                        <tr>
                                            <th>Image ID</th>
                                            <th>Product ID</th>
                                            <th>Image</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php $product_name = $productDetails->product_name ?>

                                        @foreach($productDetails->images as $image)
                                            <tr>
                                            <td>{{$image->id}}</td>
                                            <td>{{$product_name}}</td>
                                            <td><img width="150" height="150" src="{{asset('image/product_image/small/'.$image->image)}}" alt=""></td>
                                            <td><a title="Delete Product Image" href="javascript:void(0)" name="image" data-id="{{$image->id}}" class="btn btn-danger confirmDelete"><i class="fas fa-trash"></i></a></td>
                                            </tr>
                                        @endforeach

                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <th>Image ID</th>
                                            <th>Product ID</th>
                                            <th>Image</th>
                                            <th>Action</th>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </div>
                                <div class="card-footer">
                                    <button class="btn btn-primary" type="submit">Update Images</button>
                                </div>
                                <!-- /.card-body -->
                            </div>
                        </form>

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
    <script src="{{asset('admin/plugins/datatables/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('admin/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js')}}"></script>
    <script src="{{asset('admin/plugins/datatables-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{asset('admin/plugins/datatables-responsive/js/responsive.bootstrap4.min.js')}}"></script>
    <script src="{{asset('admin/js/admin_script.js')}}"></script>
    <script>
        $(document).ready(function () {
            $("#attributes").DataTable();
        });
    </script>
    <script>
        $(document).ready(function(){
            $('.js-switch').change(function(){
                let status = $(this).prop('checked') == true ? 1 : 0;
                let attribute_id = $(this).data('id');

                $.ajax({
                    dataType:'json',
                    type:"GET",
                    url: "{{url('admin/update-attribute-status')}}",
                    data:{'status': status, 'attribute_id' : attribute_id},
                    success:function(data){
                        console.log(data.message);
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
            $('.confirmDelete').click(function () {
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
