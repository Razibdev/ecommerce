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
                        <h1>Catalogues</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Add Product</li>
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
                                <h3 class="card-title">Add Product</h3>
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
                            <form role="form" method="POST" action="{{url('admin/add-product')}}" enctype="multipart/form-data">
                                {{csrf_field()}}
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">

                                            <div class="form-group">
                                                <label for="category_name">Product Name</label>
                                                <input class="form-control" id="product_name" name="product_name" placeholder="Enter Product Name" >
                                            </div>

                                            <div class="form-group">
                                                <label>Category Level</label>
                                                <select class="select2bs4" required name="category_id" id="category_id"  data-placeholder="Select a State" style="width: 100%;">
                                                    <?php echo $categories_dropdown; ?>
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="category_name">Product Code</label>
                                                <input class="form-control" id="product_code" name="product_code" placeholder="Enter Product Code" >
                                            </div>

                                            <div class="form-group">
                                                <label for="category_name">Product Color</label>
                                                <input class="form-control" id="product_color" name="product_color" placeholder="Enter Product Color" >
                                            </div>

                                            <div class="form-group">
                                                <label for="weight">Product Weight</label>
                                                <input class="form-control" id="weight" name="weight" placeholder="Enter Product Weight" >
                                            </div>

                                            <div class="form-group">
                                                <label for="product_price">Product Price</label>
                                                <input type="text" class="form-control"  id="product_price" name="product_price" placeholder="Enter Product Price">
                                            </div>

                                            <div class="form-group">
                                                <label for="sleeve">Sleeve</label>
                                                <select name="sleeve" id="sleeve" class="form-control">
                                                    <option value="">Select Sleeve</option>
                                                    @foreach($sleeveArr as $sleeve)
                                                        <option value="{{$sleeve}}">{{$sleeve}}</option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="sleeve">Pattern</label>
                                                <select name="pattern" id="pattern" class="form-control">
                                                    <option value="">Select Pattern</option>
                                                    @foreach($patternArr as $pattern)
                                                        <option value="{{$pattern}}">{{$pattern}}</option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <div class="form-group">
                                                <label for="product_price">Material & Care</label>
                                                <textarea class="textarea" placeholder="Place some text here"
                                                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" rows="3" name="care" placeholder="Enter Product Description" ></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="category_description">Product Description</label>
                                                <textarea class="textarea" placeholder="Place some text here"
                                                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" name="product_description"></textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="category_image">Product Image</label><br>
                                                <input type="file"  id="product_image" name="product_image" style="margin-bottom: 10px;" >
                                                {{--@if(!empty($categoryData->category_image))--}}
                                                {{--<img src="{{asset('image/category_image/'.$categoryData->category_image)}}" width="50" height="50" alt="">--}}
                                                {{--@endif--}}
                                            </div>

                                            <div class="form-group">
                                                <label for="video">Product Video</label><br>
                                                <input type="file"  id="video" name="video" style="margin-bottom: 10px;" >
                                            </div>

                                            <div class="form-group">
                                                <label for="category_description">Feature Item</label>
                                                <input type="checkbox" name="feature_item" id="feature_item" value="1">
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

        $(function () {
            // Summernote
            $('.textarea').summernote()
        })
    </script>
@endpush
