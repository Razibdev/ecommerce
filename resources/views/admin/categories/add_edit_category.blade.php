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
                            <li class="breadcrumb-item active">{{$title}}</li>
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
                                <h3 class="card-title">{{$title}}</h3>
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
                            <form role="form" method="POST" @if(empty($categoryData->id)) action="{{url('admin/add-edit-category')}}" @else  action="{{url('admin/add-edit-category/'.$categoryData->id)}}" @endif name="categoryForm" id="categoryForm" enctype="multipart/form-data">
                                {{csrf_field()}}
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="category_name">Category Name</label>
                                                <input class="form-control" id="category_name" name="category_name" placeholder="Enter Category Name" @if(!empty($categoryData->category_name)) value="{{$categoryData->category_name}}" @else value="{{old('category_name')}}" @endif >
                                            </div>

                                            <div id="appendCategoriesLevel">
                                                @include('admin.categories.append_categories_levell')
                                            </div>

                                            <!-- /.form-group -->

                                            <div class="form-group">
                                                <label for="category_discount">Category Discount</label>
                                                <input class="form-control"  name="category_discount" id="category_discount" placeholder="Enter Discount Here"  @if(!empty($categoryData->category_discount)) value="{{$categoryData->category_discount}}" @else value="{{old('category_discount')}}" @endif>
                                            </div>

                                            <div class="form-group">
                                                <label for="category_url">Category Url</label>
                                                <input type="text" class="form-control"  id="category_url" name="category_url" placeholder="Enter Category Url" @if(!empty($categoryData->url)) value="{{$categoryData->url}}"  @endif>
                                            </div>

                                            <div class="form-group">
                                                <label for="category_description">Category Description</label>
                                                <textarea class="form-control" rows="3" name="category_description" placeholder="Enter Category Description" > @if(!empty($categoryData->description)) {{$categoryData->description}} @else {{old('category_description')}} @endif </textarea>
                                            </div>
                                        </div>


                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Select Section</label>
                                                <select class="select2bs4" name="section_id" id="section_id"  data-placeholder="Select a State" style="width: 100%;">
                                                    <option selected disabled="">Select Section</option>
                                                    @foreach($getSections as $section)
                                                        <option value="{{$section->id}}" @if(!empty($categoryData->section_id) && $categoryData->section_id == $section->id) selected @endif>{{$section->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>


                                            <div class="form-group">
                                                <label for="meta_title">Meta Title</label>
                                                <input type="text" class="form-control"  id="meta_title" name="meta_title" placeholder="Enter Meta Title" @if(!empty($categoryData->meta_title)) value="{{$categoryData->meta_title}}" @else value="{{old('meta_title')}}" @endif>
                                            </div>
                                            <div class="form-group">
                                                <label for="meta_title">Meta Keywords</label>
                                                <input type="text" class="form-control"  id="meta_keywords" name="meta_keywords" placeholder="Enter Meta Keywords" @if(!empty($categoryData->meta_keywords)) value="{{$categoryData->meta_keywords}}" @else value="{{old('meta_keywords')}}" @endif>
                                            </div>

                                            <div class="form-group">
                                                <label for="meta_title">Meta Description</label>
                                                <textarea class="form-control" rows="3" name="meta_description" placeholder="Enter Meta Description">@if(!empty($categoryData->meta_description)) {{$categoryData->meta_description}} @else {{old('meta_description')}} @endif</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label for="category_image">Category Image</label><br>
                                                <input type="file"  id="category_image" name="category_image" style="margin-bottom: 10px;" >
                                                @if(!empty($categoryData->category_image))
                                                    <img src="{{asset('image/category_image/'.$categoryData->category_image)}}" width="50" height="50" alt="">
                                                @endif
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
