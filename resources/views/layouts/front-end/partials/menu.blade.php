<div class="menu d-none d-lg-block d-xl-block">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav m-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="{{route('home')}}">HOME <span class="sr-only">(current)</span></a>
                    </li>
                    @foreach($categories as $key=>$category)
                        <li class="nav-item dropdown">
                            <a class="nav-link caret" href="javascript:"
                                               onclick="location.href='{{route('products',['id'=> $category['id'],'data_from'=>'category','page'=>1])}}'" id="dropdown09" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="flag-icon flag-icon-us"> </span>{{$category['name']}}</a>
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
        </nav>
    </div>
</div>