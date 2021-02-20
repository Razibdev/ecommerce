<?php

use App\Models\Product;

?>


<form action="{{url('/products-filter')}}">{{csrf_field()}}

<div class="left-sidebar">
    <h2>Category</h2>
    <!--                        --><?php //echo $category_menu; ?>
    <div class="panel-group category-products" id="accordian"><!--category-productsr-->
        @foreach($categories as $cat)
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <a data-toggle="collapse" data-parent="#accordian" href="#{{$cat->id}}">
                            <span class="badge pull-right"><i class="fa fa-plus"></i></span>
                            {{$cat->category_name}}
                        </a>
                    </h4>
                </div>
                <div id="{{$cat->id}}" class="panel-collapse collapse">
                    <div class="panel-body">
                        <ul>
                            @foreach($cat->categories as $subcat)
                                <?php $productCount = Product::productCount($subcat->id); ?>
                                <li style="margin-bottom: 3px;"><a href="{{asset('products/'.$subcat->url)}}">{{$subcat->category_name}} </a> ({{$productCount}}) </li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </div>
        @endforeach

    </div><!--/category-products-->
    @if(!empty($url))
     <input type="hidden" name="url" value="{{$url}}">
    <h2>Colors</h2>
    <div class="panel-group category-products"><!--category-productsr-->
        @if(!empty($_GET['color']))
            <?php
            $colorArray = explode('-', $_GET['color']);
            ?>
        @endif

        @foreach($colorArr as $color)
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <input type="checkbox" name="colorFilter[]" onchange="javascript:this.form.submit();" @if(!empty($colorArray) && in_array($color, $colorArray)) checked @endif id="{{$color}}" value="{{$color}}">&nbsp; &nbsp; <label for="{{$color}}" style="color: #787672;">{{$color}}</label>
                    </h4>
                </div>
            </div>
        @endforeach
    </div>



    <h2>Sleeve</h2>
    <div class="panel-group category-products"><!--category-productsr-->
        @if(!empty($_GET['sleeve']))
            <?php
            $sleeveArray = explode('-', $_GET['sleeve']);
            ?>
        @endif

        @foreach($sleeveArr as $sleeve)
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title">
                        <input type="checkbox" name="sleeveFilter[]" onchange="javascript:this.form.submit();" @if(!empty($sleeveArray) && in_array($sleeve, $sleeveArray)) checked @endif id="{{$sleeve}}" value="{{$sleeve}}">&nbsp; &nbsp; <label for="{{$sleeve}}" style="color: #787672;">{{$sleeve}}</label>
                    </h4>
                </div>
            </div>
        @endforeach
    </div>

        <h2>Pattern</h2>
        <div class="panel-group category-products"><!--category-productsr-->
            @if(!empty($_GET['pattern']))
                <?php
                $patternArray = explode('-', $_GET['pattern']);
                ?>
            @endif

            @foreach($patternArr as $pattern)
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <input type="checkbox" name="patternFilter[]" onchange="javascript:this.form.submit();" @if(!empty($patternArray) && in_array($pattern, $patternArray)) checked @endif id="{{$pattern}}" value="{{$pattern}}">&nbsp; &nbsp; <label for="{{$pattern}}" style="color: #787672;">{{$pattern}}</label>
                        </h4>
                    </div>
                </div>
            @endforeach
        </div>

        <h2>Size</h2>
        <div class="panel-group category-products"><!--category-productsr-->
            @if(!empty($_GET['size']))
                <?php
                $sizeArray = explode('-', $_GET['size']);
                ?>
            @endif

            @foreach($sizeArr as $size)
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <input type="checkbox" name="sizeFilter[]" onchange="javascript:this.form.submit();" @if(!empty($sizeArray) && in_array($size, $sizeArray)) checked @endif id="{{$size}}" value="{{$size}}">&nbsp; &nbsp; <label for="{{$size}}" style="color: #787672;">{{$size}}</label>
                        </h4>
                    </div>
                </div>
            @endforeach
        </div>

    @endif
</div>
</form>

