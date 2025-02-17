@extends('layouts.front_layout.front_design')
@push('css')

@endpush
@section('content')

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    @include('layouts.front_layout.front_sidebar')
                </div>

                <div class="col-sm-9 padding-right">
                    <div class="features_items"><!--features_items-->
                        <h2 class="title text-center">Contact Us</h2>
                        @if (count($errors) > 0)
                            <div class = "alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <div class="contact-form">
                            <div class="status alert alert-success" style="display: none"></div>
                            <form id="main-contact-form" action="{{url('/page/contact')}}" class="contact-form row" name="contact-form" method="post">{{csrf_field()}}
                                <div class="form-group col-md-6">
                                    <input type="text" name="name" class="form-control" placeholder="Name">
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="text" name="email" class="form-control" placeholder="Email">
                                </div>
                                <div class="form-group col-md-12">
                                    <input type="text" name="subject" class="form-control" placeholder="Subject">
                                </div>
                                <div class="form-group col-md-12">
                                    <textarea name="message" id="message" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
                                </div>
                                <div class="form-group col-md-12">
                                    <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
                                </div>
                            </form>
                        </div>
                    </div><!--features_items-->
                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')

@endpush
