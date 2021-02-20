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
                            <li class="breadcrumb-item active">Edit Category</li>
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
                                <h3 class="card-title">Edit Category</h3>
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
                            <form role="form" method="POST" action="{{url('admin/edit-category/'.$categoryDetails->id)}}">
                                {{csrf_field()}}
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="category_name">Category Name</label>
                                                <input class="form-control" id="category_name" name="category_name" placeholder="Enter Category Name" value="{{$categoryDetails->category_name}}" >
                                            </div>
                                            <div class="form-group">
                                                <label>Category Level</label>
                                                <select class="select2bs4" name="parent_id" id="parent_id"  data-placeholder="Select a State" style="width: 100%;">
                                                    <option value="0">Main Category</option>
                                                    @foreach($levels as $level)
                                                        <option value="{{$level->id}}" @if($level->id == $categoryDetails->parent_id) selected @endif> {{$level->category_name}} </option>
                                                    @endforeach
                                                </select>
                                            </div>


                                            <div class="form-group">
                                                <label for="category_url">Category Url</label>
                                                <input type="text" class="form-control"  id="category_url" name="category_url" placeholder="Enter Category Url" value="{{$categoryDetails->url}}">
                                            </div>

                                            <div class="form-group">
                                                <label for="category_description">Category Description</label>
                                                <textarea class="textarea" placeholder="Place some text here"
                                                          style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" rows="3" name="category_description" placeholder="Enter Category Description" >{{$categoryDetails->description}}</textarea>
                                            </div>

                                            <div class="form-group">
                                                <label for="meta_title">Meta Title</label>
                                                <input class="form-control" id="meta_title" name="meta_title" value="{{$categoryDetails->meta_title}}" placeholder="Enter Meta Title" >
                                            </div>

                                            <div class="form-group">
                                                <label for="meta_description">Meta Description</label>
                                                <input class="form-control" id="meta_description" name="meta_description" value="{{$categoryDetails->meta_description}}" placeholder="Enter Meta Description" >
                                            </div>

                                            <div class="form-group">
                                                <label for="meta_keywords">Meta Keywords</label>
                                                <input class="form-control" id="meta_keywords" name="meta_keywords" value="{{$categoryDetails->meta_keywords}}" placeholder="Enter Meta Keywords" >
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
