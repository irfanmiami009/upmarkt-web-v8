@php($main_banner=\App\Model\Banner::where('banner_type','Main Banner')->where('published',1)->orderBy('id','desc')->get())
<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">
      <!-- Indicators/dots -->
      <!--
         <div class="carousel-indicators">
             <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
             <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
             <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
         </div>
         -->
      <!-- The slideshow/carousel -->
      <div class="carousel-inner">
        @foreach($main_banner as $key=>$banner)
            <div class="carousel-item {{$key==0?'active':''}}">
                <!-- <img src="{{asset('public/assets/frontend')}}/images/banner1.jpg" alt="Los Angeles" class="d-block" style="width:100%"> -->
                <img src="{{asset('storage/app/public/banner')}}/{{$banner['photo']}}" alt="Los Angeles" class="d-block" style="width:100%">
                <div class="carousel-caption">
                  <h4>&nbsp Discovesdr our best furniture collection from home</h4>
                  <h3>Stylish furnsditure bring beauty</h3>
                  <p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                  <a href="#">shop now</a>
                </div>
            </div>
        @endforeach
            <!-- <div class="carousel-item">
                <img src="{{asset('public/assets/frontend')}}/images/banner2.jpg" alt="Chicago" class="d-block" style="width:100%">
                <div class="carousel-caption">
                <h4>&nbsp Discover our best furniture collection from home</h4>
                <h3>Stylish furniture bring beauty</h3>
                <p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                <a href="#">shop now</a>
                </div>
            </div>
            <div class="carousel-item">
                <img src="{{asset('public/assets/frontend')}}/images/banner3.jpg" alt="New York" class="d-block" style="width:100%">
                <div class="carousel-caption">
                <h4>&nbsp Discover our best furniture collection from home</h4>
                <h3>Stylish furniture bring beauty</h3>
                <p>All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet.</p>
                <a href="#">shop now</a>
                </div>
            </div> -->
      </div>
      <!-- Left and right controls/icons -->
      <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
      <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
      <span class="carousel-control-next-icon"></span>
      </button>
   </div>