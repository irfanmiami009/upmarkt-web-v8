<div class="container-fluid header navbar-expand-md">
    <div class="container">
        <div class="row">
            <div class="col-sm-3 col-2 d-xl-none d-lg-none d-sm-block">
                <!-- mobile menu -->
                <nav class="navbar navbar-expand-lg navbar-light">
                    <div class="navbar-sticky mobile-head">
                        <div class="navbar navbar-expand-md navbar-light">
                            <div class="container ">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample09">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="col-lg-3 col-xl-3 col-sm-5 d-lg-block d-xl-block d-sm-block col-5 align-self-center">
                <a href="{{route('home')}}">
                    <img 
                        src="{{asset("storage/app/public/company")."/".$web_config['web_logo']->value}}" 
                        alt="up markt" 
                    />
                </a>
            </div>
            <div class="col-lg-6 col-xl-6 align-self-center d-none d-lg-block d-xl-block">
                <div class="search_container">
                    <form action="{{route('products')}}" type="submit" class="search_form">
                        <div class="input-group">
                            <input class="form-control border-end-0 border appended-form-control search-bar-input" 
                                type="text" 
                                autocomplete="off"
                                placeholder="{{\App\CPU\translate('search')}}"
                                id="example-search-input"
                                name="name"
                            >
                            <span class="input-group-append">
                                <button class="btn btn-outline-secondary bg-red border-start-0 border ms-n3 input-group-append-overlay search_button" type="button">
                                    <i class="fa fa-search white"></i>
                                </button>
                            </span>
                        </div>
                        <input name="data_from" value="search" hidden>
                        <input name="page" value="1" hidden>
                        <diV class="card search-card"
                                style="position: absolute;background: white;z-index: 999;width: 100%;display: none">
                            <div class="card-body search-result-box"
                                    style="overflow:scroll; height:400px;overflow-x: hidden"></div>
                        </diV>
                    </form>
                </div>
            </div>
            <div class="col-lg-3 col-xl-3 col-sm-4 col-4 ml-auto headericon">
                <div id="cart_items">
                    @include('layouts.front-end.partials.cart')
                </div>
                <div>
                    <!-- <i class="fa fa-heart"></i> -->
                    <div class="navbar-tool dropdown">
                        <a class="navbar-tool-icon-box dropdown-toggle" href="{{route('wishlists')}}">
                            @if(session()->has('wish_list') && count(session('wish_list')) > 0)
                                <span class="navbar-tool-label">
                                    <span class="countWishlist">{{count(session('wish_list'))}}</span>
                                </span>
                           @endif
                            <i class="navbar-tool-icon fa fa-heart"></i>
                        </a>
                    </div>
                </div>
                <div>
                    <!-- <i class="fa fa-user"></i> -->
                    @if(auth('customer')->check())
                        <div class="dropdown">
                            <a class="navbar-tool" type="button" data-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">
                                <div class="navbar-tool-icon-box">
                                    <div class="navbar-tool-icon-box">
                                        <i class="fa fa-user fa-lg"></i>
                                        <!-- <img style="width: 40px;height: 40px"
                                             src="{{asset('storage/app/public/profile/'.auth('customer')->user()->image)}}"
                                             onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                             class="img-profile rounded-circle"> -->
                                    </div>
                                </div>
                                <!-- <div class="navbar-tool-text">
                                    <small>{{\App\CPU\translate('hello')}}, {{auth('customer')->user()->f_name}}</small>
                                    {{\App\CPU\translate('dashboard')}}
                                </div> -->
                            </a>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item"
                                   href="{{route('account-oder')}}"> {{ \App\CPU\translate('my_order')}} </a>
                                <a class="dropdown-item"
                                   href="{{route('user-account')}}"> {{ \App\CPU\translate('my_profile')}}</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item"
                                   href="{{route('customer.auth.logout')}}">{{ \App\CPU\translate('logout')}}</a>
                            </div>
                        </div>
                    @else
                        <div class="dropdown">
                            <a class="navbar-tool"
                               type="button" data-toggle="dropdown" aria-haspopup="true"
                               aria-expanded="false">
                                <div class="navbar-tool-icon-box">
                                    <div class="navbar-tool-icon-box">
                                        <i class="fa fa-user"></i>
                                    </div>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="{{route('customer.auth.login')}}">
                                    <i class="fa fa-sign-in {{Session::get('direction') === "rtl" ? 'ml-2' : 'mr-2'}}"></i> {{\App\CPU\translate('sing_in')}}
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="{{route('customer.auth.register')}}">
                                    <i class="fa fa-user-circle {{Session::get('direction') === "rtl" ? 'ml-2' : 'mr-2'}}"></i>{{\App\CPU\translate('sing_up')}}
                                </a>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <div class="collapse in" id="navbarsExample09">
                    <ul class="navbar-nav align-self-center">
                        <li class="nav-item">
                            <div class="search_container">
                                <form action="{{route('products')}}" type="submit" class="search_form">
                                    <div class="input-group">
                                        <input class="form-control border-end-0 border appended-form-control search-bar-input-mobile" 
                                            type="text" 
                                            autocomplete="off"
                                            placeholder="{{\App\CPU\translate('search')}}"
                                            id="example-search-input"
                                            name="name"
                                        >
                                        <span class="input-group-append">
                                            <button class="btn btn-outline-secondary bg-red border-start-0 border ms-n3 input-group-append-overlay search_button" type="button">
                                                <i class="fa fa-search white"></i>
                                            </button>
                                        </span>
                                    </div>
                                    <input name="data_from" value="search" hidden>
                                    <input name="page" value="1" hidden>
                                    <diV class="card search-card"
                                            style="position: absolute;background: white;z-index: 999;width: 100%;display: none">
                                        <div class="card-body search-result-box"
                                                style="overflow:scroll; height:400px;overflow-x: hidden"></div>
                                    </diV>
                                </form>
                            </div>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="{{route('home')}}">HOME <span class="sr-only">(current)</span></a>
                        </li>
                        @foreach($categories as $key=>$category)
                            <li class="nav-item dropdown">
                                <a class="nav-link caret" id="dropdown09" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="flag-icon flag-icon-us"> </span>{{$category['name']}}</a>
                                <div class="dropdown-menu" aria-labelledby="dropdown09">
                                    <div class="row">
                                        <div class="col-6">
                                            @foreach($category['childes'] as $subCategory)
                                                <a onclick="location.href='{{route('products',['id'=> $subCategory['id'],'data_from'=>'category','page'=>1])}}'" class="dropdown-item" href="#fr"><span class="flag-icon flag-icon-fr"> </span>{{$subCategory['name']}}</a>
                                            @endforeach
                                        </div>
                                        <div class="col-6">
                                            <img 
                                                src="{{asset("storage/app/public/category")."/".$category['icon']}}" 
                                                alt="up markt" 
                                            />
                                        </div>
                                    </div>
                                </div>
                            </li>
                        @endforeach
                        <li class="nav-item">
                            <a class="nav-link" href="#">ABOUT</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">CONTACT</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>