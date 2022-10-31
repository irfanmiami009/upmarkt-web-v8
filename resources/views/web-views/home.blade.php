@extends('layouts.front-end.app')
@section('title',\App\CPU\translate('Welcome To').' '.$web_config['name']->value)
@section('content')
<div class="container-fluid">
    @include('web-views.partials.home-top-slider')
</div>
<div class="container-fluid">
   <div class="container">
      <div class="row">
         <h2 class="page-heading">CATEGORIES</h2>
         <div class="col-sm category">
            <div class="categorysub">
               <img class="image-animate" src="{{asset('public/assets/frontend')}}/images/image1.jpg" alt="#" >
            </div>
            <div class="categorysub">dsd</div>
         </div>
         <div class="col-sm category">
            <img class="image-animate" src="{{asset('public/assets/frontend')}}/images/image2.jpg" alt="#" >
            <div class="middle">
               <div class="text">John Doe</div>
            </div>
         </div>
         <div class="col-sm category">
            <img class="image-animate" src="{{asset('public/assets/frontend')}}/images/image3.jpg" alt="#" >
            <div class="middle">
               <div class="text">John Doe</div>
            </div>
         </div>
      </div>
   </div>
</div>
<div class="container-fluid">
   <div class="container">
      <div class="row">
         <h2 class="page-heading">CATEGORIES</h2>
         <div class="col-sm-5">
            <div class="cat-img-container">
               <div class="caption">
                  <!-- <h3 class="cat-heading">Creative Comfortable Chair</h3> -->
                  <a class="cat-link" href="#">Shop Now</a>
               </div>
               <img class="img-partial-height image-animate" src="{{asset('public/assets/frontend')}}/images/image5.jpg" alt="#" >
            </div>
         </div>
         <div class="col-sm-7">
            <div class="cat-img-container">
               <div class="caption">
                  <h3 class="cat-heading">Creative Comfortable Chair</h3>
                  <a class="cat-link" href="#">Shop Now</a>
               </div>
               <img class="img-partial-height image-animate" src="{{asset('public/assets/frontend')}}/images/image4.jpg" alt="#" >
            </div>
         </div>
      </div>
   </div>
   <div class="container">
      <div class="row" style="margin-top:20px;">
         <div class="col-sm-7">
            <div class="cat-img-container">
               <div class="caption">
                  <!-- <h3 class="cat-heading">Creative Comfortable Chair</h3> -->
                  <a class="cat-link" href="#">Shop Now</a>
               </div>
               <img class="img-partial-height image-animate" src="{{asset('public/assets/frontend')}}/images/image18.jpg" alt="#" >
            </div>
         </div>
         <div class="col-sm-5">
            <div class="cat-img-container">
               <div class="caption">
                  <!-- <h3 class="cat-heading">Creative Comfortable Chair</h3> -->
                  <a class="cat-link" href="#">Shop Now</a>
               </div>
               <img class="img-partial-height image-animate" src="{{asset('public/assets/frontend')}}/images/image6.jpg" alt="#" >
            </div>
         </div>
      </div>
   </div>
</div>
<div class="container-fluid">
<div class="container newarrival">
   <div class="row">
   <h2 class="page-heading">New Arrival</h2>
    @foreach($latest_products as $product)
        <div class="col-sm-2">
            <a href="{{route('product',$product->slug)}}">
                <img src="{{\App\CPU\ProductManager::product_image_path('thumbnail')}}/{{$product['thumbnail']}}" alt="#" >
            </a>
        </div>
    @endforeach
      <!-- <div class="col-sm-2"><img src="{{asset('public/assets/frontend')}}/images/thumb1.jpg" alt="#" ></div>
      <div class="col-sm-2"><img src="{{asset('public/assets/frontend')}}/images/thumb2.jpg" alt="#" ></div>
      <div class="col-sm-2"><img src="{{asset('public/assets/frontend')}}/images/thumb3.jpg" alt="#" ></div>
      <div class="col-sm-2"><img src="{{asset('public/assets/frontend')}}/images/thumb4.jpg" alt="#" ></div>
      <div class="col-sm-2"><img src="{{asset('public/assets/frontend')}}/images/thumb5.jpg" alt="#" ></div>
      <div class="col-sm-2"><img src="{{asset('public/assets/frontend')}}/images/thumb6.jpg" alt="#" ></div> -->
   </div>
</div>
<div class="container-fluid">
<div class="container deal">
   <div class="row">
      <h2 class="page-heading">Deals</h2>
      <div class="col-sm-6">
         <div class="row"><img src="{{asset('public/assets/frontend')}}/images/image7.jpg" alt="#" ></div>
      </div>
      <div class="col-sm-6">
         <div class="row">
            <div class="col-sm-6"><img src="{{asset('public/assets/frontend')}}/images/image7.jpg" alt="#" ></div>
            <div class="col-sm-6"><img src="{{asset('public/assets/frontend')}}/images/image8.jpg" alt="#" ></div>
         </div>
         <div class="row">
            <div class="col-sm-6"><img src="{{asset('public/assets/frontend')}}/images/image9.jpg" alt="#" ></div>
            <div class="col-sm-6"><img src="{{asset('public/assets/frontend')}}/images/image10.jpg" alt="#" ></div>
         </div>
      </div>
   </div>
</div>
<div class="container-fluid">
   <div class="container deal">
      <div class="row">
         <div class="col-sm-4"><img style="margin-bottom:0" src="{{asset('public/assets/frontend')}}/images/image11.jpg" alt="#" ></div>
         <div class="col-sm-4"><img style="margin-bottom:0" src="{{asset('public/assets/frontend')}}/images/image12.jpg" alt="#" ></div>
         <div class="col-sm-4"><img style="margin-bottom:0" src="{{asset('public/assets/frontend')}}/images/image13.jpg" alt="#" ></div>
      </div>
   </div>
</div>
<div class="container-fluid">
   <div class="container deal">
      <div class="row">
         <h2 class="page-heading">PICK OF THE WEEK</h2>
         <div class="col-sm-6"><img style="margin-bottom:0" src="{{asset('public/assets/frontend')}}/images/image14.jpg" alt="#" ></div>
         <div class="col-sm-6"><img style="margin-bottom:0" src="{{asset('public/assets/frontend')}}/images/image15.jpg" alt="#" ></div>
      </div>
   </div>
</div>
<div class="container-fluid">
   <div class="container">
      <div class="row" style="margin-bottom:0">
         <h2 class="page-heading">DISCOUNTS OF THE WEEK</h2>
         <div class="col-sm-5">
            <img class="img-partial-height" src="{{asset('public/assets/frontend')}}/images/image16.jpg" alt="#" >
         </div>
         <div class="col-sm-7">
            <img class="img-partial-height" src="{{asset('public/assets/frontend')}}/images/image17.jpg" alt="#" >
         </div>
      </div>
   </div>
</div>
<div class="container-fluid">
   <div class="container deal">
      <div class="row">
         <h2 class="page-heading">Trending</h2>
         <div class="col-sm-4"><img style="margin-bottom:0" src="{{asset('public/assets/frontend')}}/images/trending1.jpg" alt="#" ></div>
         <div class="col-sm-4"><img style="margin-bottom:0" src="{{asset('public/assets/frontend')}}/images/trending2.jpg" alt="#" ></div>
         <div class="col-sm-4"><img style="margin-bottom:0" src="{{asset('public/assets/frontend')}}/images/trending3.jpg" alt="#" ></div>
      </div>
   </div>
</div>
<div class="container-fluid">
<div class="container newarrival">
   <div class="row">
      <h2 class="page-heading">Top Brands</h2>
      @foreach($brands as $brand)
        <div class="col-sm-2"><img src="{{asset("storage/app/public/brand/$brand->image")}}" alt="#" ></div>
      @endforeach
   </div>
</div>
<div class="container-fluid">
   <div class="container deal">
      <div class="row">
         <h2 class="page-heading">news</h2>
         <div class="col-md-4">
            <div class="thumbnail">
               <img src="{{asset('public/assets/frontend')}}/images/blog1.jpg" alt="Lights" >
               <div class="news-title">
                  <p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
               </div>
            </div>
         </div>
         <div class="col-md-4">
            <div class="thumbnail">
               <img src="{{asset('public/assets/frontend')}}/images/blog2.jpg" alt="Nature" >
               <div class="news-title">
                  <p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
               </div>
            </div>
         </div>
         <div class="col-md-4">
            <div class="thumbnail">
               <img src="{{asset('public/assets/frontend')}}/images/blog3.jpg" alt="#" >
               <div class="news-title">
                  <p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
@endsection