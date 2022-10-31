@extends('layouts.front-end.app')
@section('title',\App\CPU\translate('Welcome To').' '.$web_config['name']->value)
@push('css_or_js')
<link rel="stylesheet" href="{{asset('public/assets/front-end')}}/css/owl.carousel.min.css"/>
<link rel="stylesheet" href="{{asset('public/assets/front-end')}}/css/owl.theme.default.min.css"/>
<style type="text/css">
   .owl-nav{
      top: 40%;
      position: absolute;
      display: flex;
      justify-content: space-between;
      width: 100%;
   }
   .owl-prev{
      float: left;

   }
   .owl-next{
      float: right;
   }
   .feature-product .czi-arrow-left{
     color: {{$web_config['primary_color']}};
     /*background: {{$web_config['primary_color']}}10;*/
     padding: 5px;
     border-radius: 50%;
     margin-left: -80px;
     font-weight: bold;
     font-size: 2rem;
   }

   .feature-product .owl-nav{
     top: 30%;
     position: absolute;
     display: flex;
     justify-content: space-between;
     /* width: 100%; */
     z-index: -999;
   }
   .feature-product .czi-arrow-right{
     color: {{$web_config['primary_color']}};
     /*background: {{$web_config['primary_color']}}10;*/
     padding: 5px;
     border-radius: 50%;
     margin-right: -80px;
     font-weight: bold;
     font-size: 2rem;
   }
</style>
@endpush
@section('content')
<div class="container-fluid">
    @include('webviews.partials.home-top-slider')
</div>
@if($section_cat_1)
<div class="container">
    <div class="row">
       <h2 class="page-heading">CATEGORIES</h2>
       <div class="col-sm">
          <div class="categorysub cat-img-container">
             @if($cat_1_1)
             <img class="image-animate cat-vertical-image" src="{{asset('storage/app/public/poster')}}/{{$cat_1_1['photo']}}" alt="#" >
             @endif
            <div class="middle">
              @if($cat_1_1['url'])
              <a href="{{ $cat_1_1['url'] }}">
                <div class="text">Shop Now</div>
              </a>
              @elseif($cat_1_1['resource_type'] === 'category')
              <a href="{{route('products',['id'=> $cat_1_1['resource_id'],'data_from'=>'category','page'=>1])}}">
                <div class="text">Shop Now</div>
              </a>
              @endif
            </div>
          </div>
          <div class="categorysub cat-img-container">
            @if($cat_1_4)
             <img class="image-animate cat-vertical-image" src="{{asset('storage/app/public/poster')}}/{{$cat_1_4['photo']}}" alt="#" >
             @endif
            <div class="middle">
               @if($cat_1_4['url'])
              <a href="{{ $cat_1_1['url'] }}">
                <div class="text">Shop Now</div>
              </a>
              @elseif($cat_1_4['resource_type'] === 'category')
              <a href="{{route('products',['id'=> $cat_1_4['resource_id'],'data_from'=>'category','page'=>1])}}">
                <div class="text">Shop Now</div>
              </a>
              @endif
            </div>
          </div>
       </div>
       <div class="col-sm">
          <div class="category cat-img-container mb-4 mb-lg-0 mb-xl-0">
            @if($cat_1_2)
            <img class="image-animate" src="{{asset('storage/app/public/poster')}}/{{$cat_1_2['photo']}}" alt="#" >
            @endif
            <div class="middle">
               @if($cat_1_2['url'])
              <a href="{{ $cat_1_1['url'] }}">
                <div class="text">Shop Now</div>
              </a>
              @elseif($cat_1_2['resource_type'] === 'category')
              <a href="{{route('products',['id'=> $cat_1_2['resource_id'],'data_from'=>'category','page'=>1])}}">
                <div class="text">Shop Now</div>
              </a>
              @endif
            </div>
          </div>
       </div>
       <div class="col-sm">
         <div class="category cat-img-container">
              @if($cat_1_3)
                <img class="image-animate" src="{{asset('storage/app/public/poster')}}/{{$cat_1_3['photo']}}" alt="#" >
              @endif
                <div class="middle">
                   @if($cat_1_3['url'])
                  <a href="{{ $cat_1_3['url'] }}">
                    <div class="text">Shop Now</div>
                  </a>
                  @elseif($cat_1_3['resource_type'] === 'category')
                  <a href="{{route('products',['id'=> $cat_1_3['resource_id'],'data_from'=>'category','page'=>1])}}">
                    <div class="text">Shop Now</div>
                  </a>
                  @endif
                </div>
          </div>
       </div>
    </div>
</div>
@endif
@if($section_cat_2)
<div class="container">
    <div class="row">
       <h2 class="page-heading">CATEGORIES</h2>
       <div class="col-sm-5">
          <div class="category cat-img-container mb-4 mb-lg-0 mb-xl-0">
            @if($cat_2_1)
             <img class="img-partial-height image-animate" src="{{asset('storage/app/public/poster')}}/{{$cat_2_1['photo']}}" alt="#" >
            @endif
             <div class="middle">
                @if($cat_2_1['url'])
                  <a href="{{ $cat_1_3['url'] }}">
                    <div class="text">Shop Now</div>
                  </a>
                  @elseif($cat_2_1['resource_type'] === 'category')
                  <a href="{{route('products',['id'=> $cat_2_1['resource_id'],'data_from'=>'category','page'=>1])}}">
                    <div class="text">Shop Now</div>
                  </a>
                  @endif
             </div>
          </div>
       </div>
       <div class="col-sm-7">
          <div class="category cat-img-container">
            @if($cat_2_2)
             <img class="img-partial-height image-animate" src="{{asset('storage/app/public/poster')}}/{{$cat_2_2['photo']}}" alt="#" >
            @endif
             <div class="middle">
                  @if($cat_2_2['url'])
                  <a href="{{ $cat_1_3['url'] }}">
                    <div class="text">Shop Now</div>
                  </a>
                  @elseif($cat_2_2['resource_type'] === 'category')
                  <a href="{{route('products',['id'=> $cat_2_2['resource_id'],'data_from'=>'category','page'=>1])}}">
                    <div class="text">Shop Now</div>
                  </a>
                  @endif
             </div>
          </div>
       </div>
    </div>
</div>
<div class="container">
    <div class="row" style="margin-top:20px;">
       <div class="col-sm-7">
          <div class="category cat-img-container mb-4 mb-lg-0 mb-xl-0">
            @if($cat_2_3)
             <img class="img-partial-height image-animate" src="{{asset('storage/app/public/poster')}}/{{$cat_2_3['photo']}}" alt="#" >
            @endif
             <div class="middle">
                @if($cat_2_3['url'])
                  <a href="{{ $cat_2_3['url'] }}">
                    <div class="text">Shop Now</div>
                  </a>
                  @elseif($cat_2_3['resource_type'] === 'category')
                  <a href="{{route('products',['id'=> $cat_2_3['resource_id'],'data_from'=>'category','page'=>1])}}">
                    <div class="text">Shop Now</div>
                  </a>
                  @endif
             </div>
          </div>
       </div>
       <div class="col-sm-5">
          <div class="category cat-img-container">
            @if($cat_2_4)
             <img class="img-partial-height image-animate" src="{{asset('storage/app/public/poster')}}/{{$cat_2_4['photo']}}" alt="#" >
            @endif
             <div class="middle">
                  @if($cat_2_4['url'])
                  <a href="{{ $cat_2_4['url'] }}">
                    <div class="text">Shop Now</div>
                  </a>
                  @elseif($cat_2_4['resource_type'] === 'category')
                  <a href="{{route('products',['id'=> $cat_2_4['resource_id'],'data_from'=>'category','page'=>1])}}">
                    <div class="text">Shop Now</div>
                  </a>
                  @endif
             </div>
          </div>
       </div>
    </div>
</div>
@endif
@if($section_new_arrival)
<div class="container newarrival">
   <div class="row">
    <h2 class="page-heading">New Arrival</h2>
     <div class="feature-product">
        <div class="owl-carousel owl-theme mt-2" id="flash-deal-slider">
           @foreach($latest_products as $product)
               <div class="slider-image">
                    <a href="{{route('product',$product->slug)}}">
                        <img class="thumb-image" src="{{\App\CPU\ProductManager::product_image_path('thumbnail')}}/{{$product['thumbnail']}}" alt="#" >
                    </a>
                </div>
           @endforeach
       </div>
     </div>
   </div>
</div>
@endif
@if($section_deals)
<div class="container deal">
   <div class="row">
      <h2 class="page-heading">Deals</h2>
      <div class="col-sm-6">
         <div class="row">
          @if($deals_1)
            @if($deals_1['url'])
            <a href="{{ $deals_1['url'] }}">
              <img src="{{asset('storage/app/public/poster')}}/{{$deals_1['photo']}}" alt="#" >
            </a>
            @elseif($deals_1['resource_type'] === 'category')
            <a href="{{route('products',['id'=> $deals_1['resource_id'],'data_from'=>'category','page'=>1])}}">
              <img src="{{asset('storage/app/public/poster')}}/{{$deals_1['photo']}}" alt="#" >
            </a>
            @endif
            <!-- <img src="{{asset('storage/app/public/poster')}}/{{$deals_1['photo']}}" alt="#" > -->
          @endif
        </div>
      </div>
      <div class="col-sm-6">
         <div class="row">
            <div class="col-sm-6">
              @if($deals_2)
                  @if($deals_2['url'])
                  <a href="{{ $deals_2['url'] }}">
                    <img src="{{asset('storage/app/public/poster')}}/{{$deals_2['photo']}}" alt="#" >
                  </a>
                  @elseif($deals_2['resource_type'] === 'category')
                  <a href="{{route('products',['id'=> $deals_2['resource_id'],'data_from'=>'category','page'=>1])}}">
                    <img src="{{asset('storage/app/public/poster')}}/{{$deals_2['photo']}}" alt="#" >
                  </a>
                  @endif
              @endif
            </div>
            <div class="col-sm-6">
              @if($deals_3)
                  @if($deals_3['url'])
                  <a href="{{ $deals_3['url'] }}">
                    <img src="{{asset('storage/app/public/poster')}}/{{$deals_3['photo']}}" alt="#" >
                  </a>
                  @elseif($deals_3['resource_type'] === 'category')
                  <a href="{{route('products',['id'=> $deals_3['resource_id'],'data_from'=>'category','page'=>1])}}">
                    <img src="{{asset('storage/app/public/poster')}}/{{$deals_3['photo']}}" alt="#" >
                  </a>
                  @endif
                <!-- <img src="{{asset('storage/app/public/poster')}}/{{$deals_3['photo']}}" alt="#" > -->
              @endif
            </div>
         </div>
         <div class="row">
            <div class="col-sm-6">
              @if($deals_4)
                  @if($deals_4['url'])
                  <a href="{{ $deals_4['url'] }}">
                    <img src="{{asset('storage/app/public/poster')}}/{{$deals_4['photo']}}" alt="#" >
                  </a>
                  @elseif($deals_4['resource_type'] === 'category')
                  <a href="{{route('products',['id'=> $deals_4['resource_id'],'data_from'=>'category','page'=>1])}}">
                    <img src="{{asset('storage/app/public/poster')}}/{{$deals_4['photo']}}" alt="#" >
                  </a>
                  @endif
                <!-- <img src="{{asset('storage/app/public/poster')}}/{{$deals_4['photo']}}" alt="#" > -->
              @endif
            </div>
            <div class="col-sm-6">
              @if($deals_5)
                  @if($deals_5['url'])
                  <a href="{{ $deals_5['url'] }}">
                    <img src="{{asset('storage/app/public/poster')}}/{{$deals_5['photo']}}" alt="#" >
                  </a>
                  @elseif($deals_5['resource_type'] === 'category')
                  <a href="{{route('products',['id'=> $deals_5['resource_id'],'data_from'=>'category','page'=>1])}}">
                    <img src="{{asset('storage/app/public/poster')}}/{{$deals_5['photo']}}" alt="#" >
                  </a>
                  @endif
                <!-- <img src="{{asset('storage/app/public/poster')}}/{{$deals_5['photo']}}" alt="#" > -->
              @endif
            </div>
         </div>
      </div>
   </div>
</div>
<div class="container deal">
    <div class="row">
      <div class="col-sm-4 mb-4 mb-lg-0 mb-xl-0">
        @if($deals_6)
          @if($deals_6['url'])
          <a href="{{ $deals_6['url'] }}">
            <img src="{{asset('storage/app/public/poster')}}/{{$deals_6['photo']}}" alt="#" >
          </a>
          @elseif($deals_6['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $deals_6['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img src="{{asset('storage/app/public/poster')}}/{{$deals_6['photo']}}" alt="#" >
          </a>
          @endif
          <!-- <img style="margin-bottom:0" src="{{asset('storage/app/public/poster')}}/{{$deals_6['photo']}}" alt="#" > -->
        @endif
      </div>
       <div class="col-sm-4 mb-4 mb-lg-0 mb-xl-0">
        @if($deals_7)
          @if($deals_7['url'])
          <a href="{{ $deals_7['url'] }}">
            <img src="{{asset('storage/app/public/poster')}}/{{$deals_7['photo']}}" alt="#" >
          </a>
          @elseif($deals_7['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $deals_7['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img src="{{asset('storage/app/public/poster')}}/{{$deals_7['photo']}}" alt="#" >
          </a>
          @endif
          <!-- <img style="margin-bottom:0" src="{{asset('storage/app/public/poster')}}/{{$deals_7['photo']}}" alt="#" > -->
        @endif
      </div>
       <div class="col-sm-4 mb-4 mb-lg-0 mb-xl-0">
        @if($deals_8)
          @if($deals_8['url'])
          <a href="{{ $deals_8['url'] }}">
            <img src="{{asset('storage/app/public/poster')}}/{{$deals_8['photo']}}" alt="#" >
          </a>
          @elseif($deals_8['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $deals_8['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img src="{{asset('storage/app/public/poster')}}/{{$deals_8['photo']}}" alt="#" >
          </a>
          @endif
          <!-- <img style="margin-bottom:0" src="{{asset('storage/app/public/poster')}}/{{$deals_8['photo']}}" alt="#" > -->
        @endif
      </div>
    </div>
</div>
@endif
@if($section_pick_of_the_week)
<div class="container deal">
    <div class="row">
       <h2 class="page-heading">PICK OF THE WEEK</h2>
      <div class="col-sm-6 mb-4 mb-lg-0 mb-xl-0">
        @if($pick_of_the_week_1)
          @if($pick_of_the_week_1['url'])
          <a href="{{ $pick_of_the_week_1['url'] }}">
            <img src="{{asset('storage/app/public/poster')}}/{{$pick_of_the_week_1['photo']}}" alt="#" >
          </a>
          @elseif($pick_of_the_week_1['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $pick_of_the_week_1['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img src="{{asset('storage/app/public/poster')}}/{{$pick_of_the_week_1['photo']}}" alt="#" >
          </a>
          @endif
          <!-- <img style="margin-bottom:0" src="{{asset('storage/app/public/poster')}}/{{$pick_of_the_week_1['photo']}}" alt="#" > -->
        @endif
      </div>
      <div class="col-sm-6 mb-4 mb-lg-0 mb-xl-0">
        @if($pick_of_the_week_2)
          @if($pick_of_the_week_2['url'])
          <a href="{{ $pick_of_the_week_2['url'] }}">
            <img src="{{asset('storage/app/public/poster')}}/{{$pick_of_the_week_2['photo']}}" alt="#" >
          </a>
          @elseif($pick_of_the_week_2['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $pick_of_the_week_1['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img src="{{asset('storage/app/public/poster')}}/{{$pick_of_the_week_2['photo']}}" alt="#" >
          </a>
          @endif
          <!-- <img style="margin-bottom:0" src="{{asset('storage/app/public/poster')}}/{{$pick_of_the_week_2['photo']}}" alt="#" > -->
        @endif
      </div>
    </div>
</div>
@endif
@if($section_discount_of_the_week)
<div class="container">
  <div class="row" style="margin-bottom:0">
     <h2 class="page-heading">DISCOUNTS OF THE WEEK</h2>
     <div class="col-sm-5 mb-4 mb-lg-0 mb-xl-0">
      @if($discount_of_the_week_1)
          @if($discount_of_the_week_1['url'])
          <a href="{{ $discount_of_the_week_1['url'] }}">
            <img class="full-width-image" src="{{asset('storage/app/public/poster')}}/{{$discount_of_the_week_1['photo']}}" alt="#" >
          </a>
          @elseif($discount_of_the_week_1['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $discount_of_the_week_1['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img class="full-width-image" src="{{asset('storage/app/public/poster')}}/{{$discount_of_the_week_1['photo']}}" alt="#" >
          </a>
          @endif
        <!-- <img class="img-partial-height" src="{{asset('storage/app/public/poster')}}/{{$discount_of_the_week_1['photo']}}" alt="#" > -->
      @endif
     </div>
     <div class="col-sm-7">
      @if($discount_of_the_week_2)
          @if($discount_of_the_week_2['url'])
          <a href="{{ $discount_of_the_week_2['url'] }}">
            <img class="full-width-image" src="{{asset('storage/app/public/poster')}}/{{$discount_of_the_week_2['photo']}}" alt="#" >
          </a>
          @elseif($discount_of_the_week_2['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $discount_of_the_week_2['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img class="full-width-image" src="{{asset('storage/app/public/poster')}}/{{$discount_of_the_week_2['photo']}}" alt="#" >
          </a>
          @endif
        <!-- <img class="img-partial-height" src="{{asset('storage/app/public/poster')}}/{{$discount_of_the_week_2['photo']}}" alt="#" > -->
      @endif
     </div>
  </div>
</div>
@endif
@if($section_trending)
<div class="container deal">
  <div class="row">
    <h2 class="page-heading">Trending</h2>
    <div class="col-sm-4 mb-4 mb-lg-0 mb-xl-0">
      @if($trending_1)
          @if($trending_1['url'])
          <a href="{{ $trending_1['url'] }}">
            <img src="{{asset('storage/app/public/poster')}}/{{$trending_1['photo']}}" alt="#" >
          </a>
          @elseif($trending_1['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $trending_1['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img src="{{asset('storage/app/public/poster')}}/{{$trending_1['photo']}}" alt="#" >
          </a>
          @endif
        <!-- <img style="margin-bottom:0" src="{{asset('storage/app/public/poster')}}/{{$trending_1['photo']}}" alt="#" > -->
      @endif
    </div>
    <div class="col-sm-4 mb-4 mb-lg-0 mb-xl-0">
      @if($trending_2)
          @if($trending_2['url'])
          <a href="{{ $trending_2['url'] }}">
            <img src="{{asset('storage/app/public/poster')}}/{{$trending_2['photo']}}" alt="#" >
          </a>
          @elseif($trending_2['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $trending_2['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img src="{{asset('storage/app/public/poster')}}/{{$trending_2['photo']}}" alt="#" >
          </a>
          @endif
        <!-- <img style="margin-bottom:0" src="{{asset('storage/app/public/poster')}}/{{$trending_2['photo']}}" alt="#" > -->
      @endif
    </div>
    <div class="col-sm-4 mb-4 mb-lg-0 mb-xl-0">
      @if($trending_3)
          @if($trending_3['url'])
          <a href="{{ $trending_3['url'] }}">
            <img src="{{asset('storage/app/public/poster')}}/{{$trending_3['photo']}}" alt="#" >
          </a>
          @elseif($trending_3['resource_type'] === 'category')
          <a href="{{route('products',['id'=> $trending_3['resource_id'],'data_from'=>'category','page'=>1])}}">
            <img src="{{asset('storage/app/public/poster')}}/{{$trending_3['photo']}}" alt="#" >
          </a>
          @endif
        <!-- <img style="margin-bottom:0" src="{{asset('storage/app/public/poster')}}/{{$trending_3['photo']}}" alt="#" > -->
      @endif
    </div>
  </div>
</div>
@endif
@if($section_brands)
<div class="container newarrival">
   <div class="row">
      <!-- <h2 class="page-heading">Top Brands</h2> -->
      <div class="d-flex justify-content-between page-heading">
            <div class="" style="text-align: center;">
               <span class="for-feature-title" style="text-align: center;font-size: 2rem">TOP BRANDS</span>
            </div>
            <div class="align-self-center" style="margin-right: 4px;">
               <a class="text-capitalize view-all-text" href="{{route('brands')}}">
                  View all
                  <i class="czi-arrow-right-circle ml-1 mr-n1"></i>
               </a>
            </div>
         </div>
      <div class="feature-product">
         <div class="owl-carousel owl-theme mt-2" id="brand-deal-slider">
            @foreach($brands as $brand)
                <div class="slider-image">
                     <a href="{{route('products',['id'=> $brand['id'],'data_from'=>'brand','page'=>1])}}">
                         <img src="{{asset("storage/app/public/brand/$brand->image")}}" alt="#" >
                     </a>
                 </div>
            @endforeach
         </div>
      </div>
   </div>
</div>
@endif
@if($section_news)
<div class="container deal">
  <div class="row">
     <!-- <h2 class="page-heading">news</h2> -->
     <div class="d-flex justify-content-between page-heading">
        <div class="" style="text-align: center;">
           <span class="for-feature-title" style="text-align: center;font-size: 2rem">NEWS</span>
        </div>
        <div style="margin-right: 4px;display:none;">
           <a class="text-capitalize view-all-text margin-auto" href="">
              View all
              <i class="czi-arrow-right-circle ml-1 mr-n1"></i>
           </a>
        </div>
     </div>
     @foreach($newses as $news)
     <div class="col-md-4 mt-2">
        <div class="thumbnail">
           <img class="news-thumb-image" src="{{asset("storage/app/public/news_image/$news->image")}}" alt="Lights" >
           <div class="news-title">
            {!! $news['content'] !!}
           </div>
        </div>
     </div>
     @endforeach
  </div>
</div>
@endif
@endsection
@push('script')
{{-- Owl Carousel --}}
    <script src="{{asset('public/assets/front-end')}}/js/owl.carousel.min.js"></script>

    <script>
        $('#flash-deal-slider').owlCarousel({
            loop: true,
            autoplay: true,
            autoplayTimeout: 3000,
            margin: 20,
            nav: true,
            navText: ["<i class='czi-arrow-left'></i>", "<i class='czi-arrow-right'></i>"],
            dots: false,
            autoplayHoverPause: true,
            '{{session('direction')}}': true,
            // center: true,
            responsive: {
                //X-Small
                0: {
                    items: 2
                },
                360: {
                    items: 3
                },
                375: {
                    items: 3
                },
                540: {
                    items: 4
                },
                //Small
                576: {
                    items: 5
                },
                //Medium
                768: {
                    items: 7
                },
                //Large
                992: {
                    items: 6
                },
                //Extra large
                1200: {
                    items: 6
                },
                //Extra extra large
                1400: {
                    items: 6
                }
            }
        })
    </script>

    <script>
        $('#brand-deal-slider').owlCarousel({
            loop: false,
            autoplayTimeout: 3000,
            margin: 20,
            nav: true,
            '{{session('direction')}}': true,
            navText: ["<i class='czi-arrow-left'></i>","<i class='czi-arrow-right'></i>"],
            dots: false,
            autoplayHoverPause: true,
            // center: true,
            responsive: {
                //X-Small
                0: {
                    items: 2
                },
                360: {
                    items: 3
                },
                375: {
                    items: 3
                },
                540: {
                    items: 4
                },
                //Small
                576: {
                    items: 5
                },
                //Medium
                768: {
                    items: 7
                },
                //Large
                992: {
                    items: 6
                },
                //Extra large
                1200: {
                    items: 6
                },
                //Extra extra large
                1400: {
                    items: 6
                }
            }
        })
    </script>
@endpush