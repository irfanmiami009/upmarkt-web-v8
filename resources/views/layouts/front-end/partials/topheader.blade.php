<div class="topheader">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-xl-9 col-sm-12 col-12 top-header-menu">
                Free standard shipping on orders over $75.
            </div>
            <div class="col-lg-6 col-xl-3 col-sm-12 col-md-12 col-12">
                <div class="row">
                    <div class="col-lg-6 col-sm-6 col-md-6 col-6">
                        <a class="dropdown-item top-header-menu text-left" href="{{route('shop.apply')}}">
                            {{ \App\CPU\translate('Become a')}} {{ \App\CPU\translate('Seller')}}
                        </a>
                    </div>
                    <div class="col-lg-6 col-sm-6 col-md-6 col-6">
                        <a class="dropdown-item top-header-menu text-right" href="{{route('seller.auth.login')}}">
                            {{ \App\CPU\translate('Seller')}}  {{ \App\CPU\translate('login')}}
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>