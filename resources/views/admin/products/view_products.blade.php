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
                        <h1>Products</h1>
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
                            <li class="breadcrumb-item active">Products</li>
                        </ol>
                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>
        <div>
            <a style="margin-left: 20px; margin-bottom: 10px;" href="{{url('/admin/export-products')}}" class="btn btn-primary btn-mini">Export</a>
        </div>
        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">

                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Products</h3>
                                <div class="text-right">
                                    <a href="{{url('admin/add-product')}}" class="btn btn-success pull-right">Add Product</a>

                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body">
                                <table id="product" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Category Name</th>
                                        <th>Product Image</th>
                                        <th>Product Name</th>
                                        <th>Product Code</th>
                                        <th>Product Color</th>
                                        <th>Product Price</th>
                                        <th>Feature Item</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($products as $product)

                                        <tr>
                                            <td>{{$product->id}}</td>
                                            <td>{{$product->category->category_name}}</td>

                                            <td>
                                                @if(!empty($product->image))
                                                <img src="{{asset('image/product_image/small/'.$product->image)}}" width="100" height="100" alt="">
                                                @endif
                                            </td>

                                            <td>{{ $product->product_name}}</td>
                                            <td>{{ $product->product_code}}</td>
                                            <td>{{ $product->product_color}}</td>
                                            <td>Tk {{ $product->price}}</td>
                                            <td>@if($product->feature_item == 1) Yes @else No @endif</td>
                                            <td> <input type="checkbox" class="js-switch" data-id="{{$product->id}}" name="status" {{$product->status == 1 ? 'checked' : ''}} /></td>
                                            <td>
                                                <div class="btn-group">
                                                <a title="Product attribute" href="{{url('/admin/add-attribute/'.$product->id)}}" class="btn btn-success btn-mini" ><i class="fa fa-plus-circle" aria-hidden="true"></i></a> &nbsp;
                                                    <a title="Product Alternative Images" href="{{url('/admin/add-images/'.$product->id)}}" class="btn btn-success btn-mini" ><i class="fas fa-image"></i></a> &nbsp;

                                                <a title="Product Details" data-toggle="modal" data-target="#ProductView-{{$product->id}}" href="#" class="btn btn-success btn-mini" ><i class="fa fa-eye" aria-hidden="true"></i></a>&nbsp;

                                                <a title="Edit Product" class="btn btn-success" href="{{url('/admin/edit-product/'.$product->id)}}"><i class="fas fa-edit"></i></a>
                                                <a title="Delete Product" href="javascript:void(0)" name="product" data-id="{{$product->id}}" class="btn btn-danger confirmDelete"><i class="fas fa-trash"></i></a>
                                                </div>
                                            </td>
                                        </tr>

                                        <!-- Modal -->
                                        <div class="modal fade" id="ProductView-{{$product->id}}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">{{ $product->product_name}} Full Details</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                       <p>Product ID: {{$product->id}}</p>
                                                        <p>Category Name: {{$product->category->category_name}}</p>
                                                        <p>Product Name: {{$product->product_name}}</p>
                                                        <p>Product Code: {{$product->product_code}}</p>
                                                        <p>Product Color: {{$product->product_color}}</p>
                                                        <p>Product Price: Tk {{$product->price}}</p>

                                                        <p>Fabric: </p>
                                                        <p>Material: </p>
                                                        <p>Product Description: {{$product->description}}</p>


                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    @endforeach
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>Product ID</th>
                                        <th>Category ID</th>
                                        <th>Product Image</th>
                                        <th>Product Name</th>
                                        <th>Product Code</th>
                                        <th>Product Color</th>
                                        <th>Product Price</th>
                                        <th>Feature Item</th>
                                        <th>Status</th>
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
            $("#product").DataTable();
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

