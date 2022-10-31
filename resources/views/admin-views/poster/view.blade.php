@extends('layouts.back-end.app')
@section('title', 'Poster')
@push('css_or_js')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endpush

@section('content')
    <div class="content container-fluid">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a
                        href="{{route('admin.dashboard')}}">{{\App\CPU\translate('Dashboard')}}</a>
                </li>
                <li class="breadcrumb-item" aria-current="page">Poster</li>
            </ol>
        </nav>
        <!-- Page Heading -->
        <div class="row">
            <div class="col-md-12" id="banner-btn">
                <button id="main-banner-add" class="btn btn-primary"><i
                        class="tio-add-circle"></i> Add Poster</button>
            </div>
        </div>
        <!-- Content Row -->
        <div class="row pt-4" id="main-banner"
             style="display: none;text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Poster Form
                    </div>
                    <div class="card-body">
                        <form action="{{route('admin.poster.store')}}" method="post" enctype="multipart/form-data"
                              class="banner_form">
                            @csrf
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="hidden" id="id" name="id">
                                            <label for="name">Poster Url</label>
                                            <input type="text" name="url" class="form-control" id="url" required>
                                        </div>

                                        <div class="form-group">
                                            <label for="name">Poster Type</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    id="poster_type" 
                                                    name="poster_type" required>
                                                <option value="">Select Type</option>
                                                <option value="Categories 1">Categories 1</option>
                                                <option value="Categories 2">Categories 2</option>
                                                <option value="Deals">Deals</option>
                                                <option value="Pick of the week">Pick of the week</option>
                                                <option value="Discount of the week">Discount of the week</option>
                                                <option value="Trending">Trending</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="resource_id">{{\App\CPU\translate('resource_type')}}</label>
                                            <select style="width: 100%" onchange="display_data(this.value)"
                                                    class="js-example-responsive form-control"
                                                    name="resource_type" required>
                                                <option value="product">Product</option>
                                                <option value="category">Category</option>
                                                <option value="shop">Shop</option>
                                                <option value="brand">Brand</option>
                                            </select>
                                        </div>

                                        <div class="form-group" id="resource-product">
                                            <label for="product_id">{{\App\CPU\translate('product')}}</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    name="product_id">
                                                @foreach(\App\Model\Product::active()->get() as $product)
                                                    @if (\App\Model\Banner::where('resource_type','product')->where('resource_id',$product->id)->first()==null)
                                                        <option value="{{$product['id']}}">{{$product['name']}}</option>
                                                    @endif
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group" id="resource-category" style="display: none">
                                            <label for="name">{{\App\CPU\translate('category')}}</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    name="category_id">
                                                @foreach(\App\CPU\CategoryManager::parents() as $category)
                                                    <option value="{{$category['id']}}">{{$category['name']}}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group" id="resource-shop" style="display: none">
                                            <label for="shop_id">{{\App\CPU\translate('shop')}}</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    name="shop_id">
                                                @foreach(\App\Model\Shop::active()->get() as $shop)
                                                    <option value="{{$shop['id']}}">{{$shop['name']}}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group" id="resource-brand" style="display: none">
                                            <label for="brand_id">{{\App\CPU\translate('brand')}}</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    name="brand_id">
                                                @foreach(\App\Model\Brand::all() as $brand)
                                                    <option value="{{$brand['id']}}">{{$brand['name']}}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="name">Display Order</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    id="display_order" 
                                                    name="display_order" required>
                                            </select>
                                        </div>

                                        <label for="name">{{ \App\CPU\translate('Image')}}</label><span
                                            class="badge badge-soft-danger ratio-container"></span>
                                        <br>
                                        <div class="custom-file" style="text-align: left">
                                            <input type="file" name="poster_image" id="mbimageFileUploader"
                                                   class="custom-file-input"
                                                   accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                            <label class="custom-file-label"
                                                   for="mbimageFileUploader">{{\App\CPU\translate('choose')}} {{\App\CPU\translate('file')}}</label>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <center>
                                            <img
                                                style="width: auto;border: 1px solid; border-radius: 10px; max-width:400px;"
                                                id="mbImageviewer"
                                                src="{{asset('public\assets\back-end\img\400x400\img1.jpg')}}"
                                                alt="banner image"/>
                                        </center>
                                    </div>
                                </div>
                            </div>

                            <div class="card-footer">
                                <a class="btn btn-secondary text-white cancel">{{ \App\CPU\translate('Cancel')}}</a>
                                <button id="add" type="submit"
                                        class="btn btn-primary">{{ \App\CPU\translate('save')}}</button>
                                <a id="update" class="btn btn-primary"
                                   style="display: none; color: #fff;">{{ \App\CPU\translate('update')}}</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" style="margin-top: 20px" id="banner-table">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="flex-between row justify-content-between align-items-center flex-grow-1 mx-1">
                            <div class="flex-between">
                                <div><h5>Poster Table</h5></div>
                                <div class="mx-1"><h5 style="color: red;">({{ $posters->total() }})</h5></div>
                            </div>
                            <div style="width: 30vw">
                                <!-- Search -->
                                <form action="{{ url()->current() }}" method="GET">
                                    <div class="input-group input-group-merge input-group-flush">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text">
                                                <i class="tio-search"></i>
                                            </div>
                                        </div>
                                        <input id="datatableSearch_" type="search" name="search" class="form-control"
                                               placeholder="Search by Poster Type"
                                               aria-label="Search orders" value="{{ $search }}" required>
                                        <button type="submit"
                                                class="btn btn-primary">{{ \App\CPU\translate('Search')}}</button>
                                    </div>
                                </form>
                                <!-- End Search -->
                            </div>
                        </div>
                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <table id="columnSearchDatatable"
                                   style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                                   class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
                                <thead class="thead-light">
                                <tr>
                                    <th>{{\App\CPU\translate('sl')}}</th>
                                    <th>{{\App\CPU\translate('image')}}</th>
                                    <th>{{\App\CPU\translate('poster_type')}}</th>
                                    <th>Display Order</th>
                                    <th>{{\App\CPU\translate('published')}}</th>
                                    <th style="width: 50px">{{\App\CPU\translate('action')}}</th>
                                </tr>
                                </thead>
                                @foreach($posters as $key=>$poster)
                                    <tbody>

                                    <tr>
                                        <th scope="row">{{$posters->firstItem()+$key}}</th>
                                        <td>
                                            <img width="80"
                                                 onerror="this.src='{{asset('public/assets/front-end/img/image-place-holder.png')}}'"
                                                 src="{{asset('storage/app/public/poster')}}/{{$poster['photo']}}">
                                        </td>
                                        <td>{{$poster->poster_type}}</td>
                                        <td>{{$poster->display_orders}}</td>
                                        <td><label class="switch"><input type="checkbox" class="status"
                                                                         id="{{$poster->id}}" <?php if ($poster->published == 1) echo "checked" ?>><span
                                                    class="slider round"></span></label></td>

                                        <td>
                                            <div class="dropdown">
                                                <button class="btn btn-outline-secondary dropdown-toggle" type="button"
                                                        id="dropdownMenuButton" data-toggle="dropdown"
                                                        aria-haspopup="true"
                                                        aria-expanded="false">
                                                    <i class="tio-settings"></i>
                                                </button>
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <a class="dropdown-item" href="{{route('admin.poster.edit',[$poster['id']])}}" style="cursor: pointer;"> {{ \App\CPU\translate('Edit')}}</a>
                                                    <a class="dropdown-item delete" style="cursor: pointer;"
                                                       id="{{$poster['id']}}"> {{ \App\CPU\translate('Delete')}}</a>
                                                </div>
                                            </div>

                                        </td>
                                    </tr>

                                    </tbody>
                                @endforeach
                            </table>
                        </div>
                    </div>
                    <div class="card-footer">
                        {{$posters->links()}}
                    </div>
                    @if(count($posters)==0)
                        <div class="text-center p-4">
                            <img class="mb-3" src="{{asset('public/assets/back-end')}}/svg/illustrations/sorry.svg"
                                 alt="Image Description" style="width: 7rem;">
                            <p class="mb-0">{{ \App\CPU\translate('No_data_to_show')}}</p>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('script')
    <script>
        $(".js-example-theme-single").select2({
            theme: "classic"
        });

        $(".js-example-responsive").select2({
            // dir: "rtl",
            width: 'resolve'
        });

        function display_data(data) {

            $('#resource-product').hide()
            $('#resource-brand').hide()
            $('#resource-category').hide()
            $('#resource-shop').hide()

            if (data === 'product') {
                $('#resource-product').show()
            } else if (data === 'brand') {
                $('#resource-brand').show()
            } else if (data === 'category') {
                $('#resource-category').show()
            } else if (data === 'shop') {
                $('#resource-shop').show()
            }
        }
    </script>
    <script>
        function mbimagereadURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#mbImageviewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#mbimageFileUploader").change(function () {
            mbimagereadURL(this);
        });

        function fbimagereadURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#fbImageviewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#fbimageFileUploader").change(function () {
            fbimagereadURL(this);
        });

        function pbimagereadURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#pbImageviewer').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#pbimageFileUploader").change(function () {
            pbimagereadURL(this);
        });

    </script>
    <script>
        $('#main-banner-add').on('click', function () {
            $('#main-banner').show();
        });

        $('.cancel').on('click', function () {
            $('.banner_form').attr('action', "{{route('admin.poster.store')}}");
            $('#main-banner').hide();
        });
        // show image ratio
        $("#display_order").on('change', function() {
            var poster_type = $("#poster_type").val();
            var display_order = $(this).val();
            $(".ratio-container").text('');
            if(poster_type === 'Categories 1' && display_order === '1') {
                $(".ratio-container").text('Min : 416X284 (104:71)');
            }else if(poster_type === 'Categories 1' && display_order === '2'){
                $(".ratio-container").text('Min : 416X582 (208∶291)');
            }else if(poster_type === 'Categories 1' && display_order === '3'){
                $(".ratio-container").text('Min : 416X582 (208∶291)');
            }else if(poster_type === 'Categories 1' && display_order === '3'){
                $(".ratio-container").text('Min : 416X284 (104:71)');
            }else if(poster_type === 'Categories 2' && display_order === '1'){
                $(".ratio-container").text('Min : 526X300 (263∶150)');
            }else if(poster_type === 'Categories 2' && display_order === '2'){
                $(".ratio-container").text('Min : 746 × 300 (373∶150)');
            }else if(poster_type === 'Categories 2' && display_order === '3'){
                $(".ratio-container").text('Min : 746 × 300 (373∶150)');
            }else if(poster_type === 'Categories 2' && display_order === '4'){
                $(".ratio-container").text('Min : 526X300 (263∶150)');
            }else if(poster_type === 'Deals' && display_order === '1'){
                $(".ratio-container").text('Min : 636X636 (1:1)');
            }else if(poster_type === 'Deals' && display_order === '2'){
                $(".ratio-container").text('Min : 306X306 (1:1)');
            }else if(poster_type === 'Deals' && display_order === '3'){
                $(".ratio-container").text('Min : 306X306 (1:1)');
            }else if(poster_type === 'Deals' && display_order === '4'){
                $(".ratio-container").text('Min : 306X306 (1:1)');
            }else if(poster_type === 'Deals' && display_order === '5'){
                $(".ratio-container").text('Min : 306X306 (1:1)');
            }else if(poster_type === 'Deals' && display_order === '6'){
                $(".ratio-container").text('Min : 416X215 (416:215)');
            }else if(poster_type === 'Deals' && display_order === '7'){
                $(".ratio-container").text('Min : 416X215 (416:215)');
            }else if(poster_type === 'Deals' && display_order === '8'){
                $(".ratio-container").text('Min : 416X215 (416:215)');
            }else if(poster_type === 'Pick of the week' && display_order === '1'){
                $(".ratio-container").text('Min : 636X636 (1:1)');
            }else if(poster_type === 'Pick of the week' && display_order === '2'){
                $(".ratio-container").text('Min : 636X636 (1:1)');
            }else if(poster_type === 'Discount of the week' && display_order === '1'){
                $(".ratio-container").text('Min : 526 × 300 (263∶150)');
            }else if(poster_type === 'Discount of the week' && display_order === '2'){
                $(".ratio-container").text('Min : 526 × 300 (263∶150)');
            }else if(poster_type === 'Trending' && display_order === '1'){
                $(".ratio-container").text('Min : 416 × 416 (1:1)');
            }else if(poster_type === 'Trending' && display_order === '2'){
                $(".ratio-container").text('Min : 416 × 416 (1:1)');
            }else if(poster_type === 'Trending' && display_order === '3'){
                $(".ratio-container").text('Min : 416 × 416 (1:1)');
            }else {
                $(".ratio-container").text('');
            }
        })
        // show order
        $("#poster_type").on('change', function() {
            //alert(this.value);
            $("#display_order").html('');
            $(".ratio-container").text('');
            var poster_type = this.value;
            var option = '';
            if(poster_type === 'Categories 1') {
                option = '<option value="">Select Order</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>';
            }
            else if(poster_type === 'Categories 2') {
                option = '<option value="">Select Order</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option>';
            }
            else if(poster_type === 'Deals') {
                option = '<option value="">Select Order</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option>';
            }
            else if(poster_type === 'Pick of the week') {
                option = '<option value="">Select Order</option><option value="1">1</option><option value="2">2</option>';
            }
            else if(poster_type === 'Discount of the week') {
                option = '<option value="">Select Order</option><option value="1">1</option><option value="2">2</option>';
            }
            else if(poster_type === 'Trending') {
                option = '<option value="">Select Order</option><option value="1">1</option><option value="2">2</option><option value="3">3</option>';
            }
            
            $("#display_order").append(option);
        })

        $(document).on('change', '.status', function () {
            var id = $(this).attr("id");
            if ($(this).prop("checked") == true) {
                var status = 1;
            } else if ($(this).prop("checked") == false) {
                var status = 0;
            }

            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                }
            });
            $.ajax({
                url: "{{route('admin.poster.status')}}",
                method: 'POST',
                data: {
                    id: id,
                    status: status
                },
                success: function (data) {
                    if (data == 1) {
                        toastr.success('Poster published successfully');
                    } else {
                        toastr.success('Poster unpublished successfully');
                    }
                }
            });
        });

        $(document).on('click', '.delete', function () {
            var id = $(this).attr("id");
            Swal.fire({
                title: "Are you sure delete this poster?",
                text: "{{\App\CPU\translate('You_will_not_be_able_to_revert_this')}}!",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '{{\App\CPU\translate('Yes')}}, {{\App\CPU\translate('delete_it')}}!'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.poster.delete')}}",
                        method: 'POST',
                        data: {id: id},
                        success: function () {
                            toastr.success('Poster deleted successfully');
                            location.reload();
                        }
                    });
                }
            })
        });
    </script>
    <!-- Page level plugins -->
@endpush
