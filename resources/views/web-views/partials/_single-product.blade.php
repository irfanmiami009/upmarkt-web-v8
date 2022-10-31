@php($overallRating = \App\CPU\ProductManager::get_overall_rating($product->reviews))

<div class="product-card card {{$product['current_stock']==0?'stock-card':''}}"
     style="margin-bottom: 40px;display: flex; align-items: center; justify-content: center;border:unset;box-shadow: unset;">
    @if($product['current_stock']<=0)
        <label style="left: 29%!important; top: 29%!important;"
               class="badge badge-danger stock-out">{{\App\CPU\translate('stock_out')}}</label>
    @endif

    <div class="card-header inline_product clickable" style="cursor: pointer;padding: unset;">
        @if($product->discount > 0)
            <div class="d-flex" style="right: 0;top:0;position: absolute">
                    <span class="for-discoutn-value pr-1 pl-1">
                    @if ($product->discount_type == 'percent')
                            {{round($product->discount,2)}}%
                        @elseif($product->discount_type =='flat')
                            {{\App\CPU\Helpers::currency_converter($product->discount)}}
                        @endif
                        {{\App\CPU\translate('off')}}
                    </span>
            </div>
        @else
            <div class="d-flex justify-content-end for-dicount-div-null">
                <span class="for-discoutn-value-null"></span>
            </div>
        @endif
        <div class="d-flex d-block center-div element-center" style="cursor: pointer">
            <a href="{{route('product',$product->slug)}}">
                <img src="{{\App\CPU\ProductManager::product_image_path('thumbnail')}}/{{$product['thumbnail']}}"
                     onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                     style="width: 100%;">
            </a>
        </div>
    </div>

    <div class="card-body inline_product p-1 clickable"
         style="cursor: pointer; max-height:7.5rem;min-width: 100%;">
        <!-- <div class="rating-show">
            <span class="d-inline-block font-size-sm text-body">
                @for($inc=0;$inc<5;$inc++)
                    @if($inc<$overallRating[0])
                        <i class="sr-star czi-star-filled active"></i>
                    @else
                        <i class="sr-star czi-star"></i>
                    @endif
                @endfor
                <label class="badge-style">( {{$product->reviews_count}} )</label>
            </span>
        </div> -->
        <div style="position: relative;" class="product-title1">
            <a style="text-decoration: unset;" href="{{route('product',$product->slug)}}">
                <!-- {{ Str::limit($product['name'], 25) }} -->
                {{$product['name']}}
            </a>
        </div>
        <div class="justify-content-between">
            <div class="product-price">
                <span class="text-accent" style="color: #ed2024">
                    {{\App\CPU\Helpers::currency_converter(
                        $product->unit_price-(\App\CPU\Helpers::get_product_discount($product,$product->unit_price))
                    )}}
                </span>
                @if($product->discount > 0)
                    <strike style="font-size: 12px!important;color: grey!important;">
                        {{\App\CPU\Helpers::currency_converter($product->unit_price)}}
                    </strike>
                @endif
            </div>
        </div>
    </div>

    <div class="card-body card-body-hidden" style="padding-bottom: 5px!important;">
        <div class="text-center">
            @if(Request::is('product/*'))
                <a class="btn btn-primary btn-sm btn-block mb-2" href="{{route('product',$product->slug)}}">
                    <i class="czi-forward align-middle {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                    {{\App\CPU\translate('View')}}
                </a>
            @else
                <a class="btn btn-primary btn-sm btn-block mb-2" href="javascript:"
                   onclick="quickView('{{$product->id}}')">
                    <i class="czi-eye align-middle {{Session::get('direction') === "rtl" ? 'ml-1' : 'mr-1'}}"></i>
                    {{\App\CPU\translate('Quick')}}   {{\App\CPU\translate('View')}}
                </a>
            @endif
        </div>
    </div>
</div>
