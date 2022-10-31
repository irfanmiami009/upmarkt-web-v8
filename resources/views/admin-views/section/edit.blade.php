@extends('layouts.back-end.app')
@section('title', 'Section')
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
                <li class="breadcrumb-item" aria-current="page">Section</li>
            </ol>
        </nav>
        <!-- Content Row -->
        <div class="row pt-4" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        Section update form
                    </div>
                    <div class="card-body">
                        <form action="{{route('admin.section.update',[$section['id']])}}" method="post" enctype="multipart/form-data"
                              class="banner_form">
                            @csrf
                            @method('put')
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="hidden" id="id" name="id">
                                            <label for="name">Poster Url</label>
                                            <input type="text" name="url" class="form-control" value="{{$poster['url']}}">
                                        </div>

                                        <div class="form-group">
                                            <label for="name">Poster Type </label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    name="poster_type" required
                                                    id="poster_type" 
                                                    >
                                                <option value="Categories 1" {{$poster['poster_type']=='Categories 1'?'selected':''}}>Categories 1</option>
                                                <option value="Categories 2" {{$poster['poster_type']=='Categories 2'?'selected':''}}>Categories 2</option>
                                                <option value="Deals" {{$poster['poster_type']=='Deals'?'selected':''}}>Deals</option>
                                                <option value="Pick of the week" {{$poster['poster_type']=='Pick of the week'?'selected':''}}>Pick of the week</option>
                                                <option value="Discount of the week" {{$poster['poster_type']=='Discount of the week'?'selected':''}} >Discount of the week</option>
                                                <option value="Trending" {{$poster['poster_type']=='Trending'?'selected':''}}>Trending</option>
                                                <option value="Top Brands" {{$poster['poster_type']=='Top Brands'?'selected':''}}>Top Brands</option>
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="resource_id">{{\App\CPU\translate('resource_type')}}</label>
                                            <select style="width: 100%" onchange="display_data(this.value)"
                                                    class="js-example-responsive form-control"
                                                    name="resource_type" required>
                                                <option value="product" {{$poster['resource_type']=='product'?'selected':''}}>Product</option>
                                                <option value="category" {{$poster['resource_type']=='category'?'selected':''}}>Category</option>
                                                <option value="shop" {{$poster['resource_type']=='shop'?'selected':''}}>Shop</option>
                                                <option value="brand" {{$poster['resource_type']=='brand'?'selected':''}}>Brand</option>
                                            </select>
                                        </div>

                                        <div class="form-group" id="resource-product" style="display: {{$poster['resource_type']=='product'?'block':'none'}}">
                                            <label for="product_id">{{\App\CPU\translate('product')}}</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    name="product_id">
                                                @foreach(\App\Model\Product::active()->get() as $product)
                                                @if (\App\Model\Poster::where('resource_type','product')->where('resource_id',$product->id)->first()==null || $poster['resource_id']==$product['id']) 
                                                    <option value="{{$product['id']}}" {{$poster['resource_id']==$product['id']?'selected':''}}>{{$product['name']}}</option>
                                                @endif
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group" id="resource-category" style="display: {{$poster['resource_type']=='category'?'block':'none'}}">
                                            <label for="name">{{\App\CPU\translate('category')}}</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    name="category_id">
                                                @foreach(\App\CPU\CategoryManager::parents() as $category)
                                                    <option value="{{$category['id']}}" {{$poster['resource_id']==$category['id']?'selected':''}}>{{$category['name']}}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group" id="resource-shop" style="display: {{$poster['resource_type']=='shop'?'block':'none'}}">
                                            <label for="shop_id">{{\App\CPU\translate('shop')}}</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    name="shop_id">
                                                @foreach(\App\Model\Shop::active()->get() as $shop)
                                                    <option value="{{$shop['id']}}" {{$poster['resource_id']==$shop['id']?'selected':''}}>{{$shop['name']}}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group" id="resource-brand" style="display: {{$poster['resource_type']=='brand'?'block':'none'}}">
                                            <label for="brand_id">{{\App\CPU\translate('brand')}}</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    name="brand_id">
                                                @foreach(\App\Model\Brand::all() as $brand)
                                                    <option value="{{$brand['id']}}" {{$poster['resource_id']==$brand['id']?'selected':''}}>{{$poster['name']}}</option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <div class="form-group">
                                            <label for="name">Display Order</label>
                                            <select style="width: 100%"
                                                    class="js-example-responsive form-control"
                                                    id="display_order" 
                                                    name="display_order" required>
                                                    @if($poster['poster_type'] === 'Categories 1')
                                                        <option value="">Select One</option>
                                                        <option value="1" {{$poster['display_orders']==1?'selected':''}}>1</option>
                                                        <option value="2" {{$poster['display_orders']==2?'selected':''}}>2</option>
                                                        <option value="3" {{$poster['display_orders']==3?'selected':''}}>3</option>
                                                        <option value="4">4</option>
                                                    @elseif($poster['poster_type'] === 'Categories 2')
                                                        <option value="">Select One</option>
                                                        <option value="1" {{$poster['display_orders']==1?'selected':''}}>1</option>
                                                        <option value="2" {{$poster['display_orders']==2?'selected':''}}>2</option>
                                                        <option value="3" {{$poster['display_orders']==3?'selected':''}}>3</option>
                                                        <option value="4" {{$poster['display_orders']==4?'selected':''}}>4</option>
                                                    @elseif($poster['poster_type'] === 'Deals')
                                                        <option value="">Select One</option>
                                                        <option value="1" {{$poster['display_orders']==1?'selected':''}}>1</option>
                                                        <option value="2" {{$poster['display_orders']==2?'selected':''}}>2</option>
                                                        <option value="3" {{$poster['display_orders']==3?'selected':''}}>3</option>
                                                        <option value="4" {{$poster['display_orders']==4?'selected':''}}>4</option>
                                                        <option value="5" {{$poster['display_orders']==5?'selected':''}}>5</option>
                                                        <option value="6" {{$poster['display_orders']==6?'selected':''}}>6</option>
                                                        <option value="7" {{$poster['display_orders']==7?'selected':''}}>7</option>
                                                        <option value="8" {{$poster['display_orders']==8?'selected':''}}>8</option>
                                                    @elseif($poster['poster_type'] === 'Pick of the week')
                                                        <option value="">Select One</option>
                                                        <option value="1" {{$poster['display_orders']==1?'selected':''}}>1</option>
                                                        <option value="2" {{$poster['display_orders']==2?'selected':''}}>2</option>
                                                    @elseif($poster['poster_type'] === 'Discount of the week')
                                                        <option value="">Select One</option>
                                                        <option value="1" {{$poster['display_orders']==1?'selected':''}}>1</option>
                                                        <option value="2" {{$poster['display_orders']==2?'selected':''}}>2</option>
                                                    @elseif($poster['poster_type'] === 'Trending')
                                                        <option value="">Select One</option>
                                                        <option value="1" {{$poster['display_orders']==1?'selected':''}}>1</option>
                                                        <option value="2" {{$poster['display_orders']==2?'selected':''}}>2</option>
                                                        <option value="3" {{$poster['display_orders']==3?'selected':''}}>3</option>
                                                    @endif
                                                    <!-- <option value="{{$poster['display_orders']}}">{{$poster['display_orders']}}</option> -->
                                            </select>
                                        </div>

                                        <label for="name">{{ \App\CPU\translate('Image')}}</label><span
                                            class="badge badge-soft-danger">( {{\App\CPU\translate('ratio')}} 4:1 )</span>
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
                                                src="{{asset('storage/app/public/poster')}}/{{$poster['photo']}}"
                                                alt=""/>
                                        </center>
                                    </div>

                                    <div class="col-md-12 mt-3">
                                        <button type="submit" class="btn btn-primary">{{ \App\CPU\translate('update')}}</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
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
    </script>
@endpush
