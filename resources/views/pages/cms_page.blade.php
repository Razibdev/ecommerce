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
                        <h2 class="title text-center">{{$cmsPageDetails->title}}</h2>
                        <p>{{$cmsPageDetails->description}}</p>
                    </div><!--features_items-->
                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')

@endpush
