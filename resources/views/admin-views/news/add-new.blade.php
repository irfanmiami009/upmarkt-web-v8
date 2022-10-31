@extends('layouts.back-end.app')

@section('title', 'Add News')

@push('css_or_js')

@endpush

@section('content')
<div class="content container-fluid main-card rtl" style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{route('admin.dashboard.index')}}">{{\App\CPU\translate('Dashboard')}}</a>
            </li>
            <li class="breadcrumb-item" aria-current="page">Add News</li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h1 class="h3 mb-0 text-black-50">News {{\App\CPU\translate('Application')}}</h1>
                </div>
                <div class="card-body ">
                    <!-- Nested Row within Card Body -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="p-5">
                                <!-- <div class="text-center mb-2 ">
                                    <h3 class="" > News {{\App\CPU\translate('Application')}}</h3>
                                    <hr>
                                </div> -->
                                <form class="user" action="{{route('admin.news.add-new')}}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="status" value="approved">
                                    <!-- <h5 class="black">News {{\App\CPU\translate('Info')}} </h5> -->
                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-3 mb-sm-0 mt-4">
                                            <label class="input-label"
                                                   for="description">News Title</label>
                                            <input type="text" class="form-control form-control-user" id="news_title" name="news_title" value="{{old('news_title')}}" placeholder="News Title" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-3 mb-sm-0 mt-4">
                                            <label class="input-label"
                                                   for="news_content">News Content</label>
                                            <textarea name="news_content" class="editor textarea" cols="30"
                                                      rows="10" required>{{old('news_content')}}</textarea>
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="pb-1">
                                            <center>
                                                <img style="width: auto;border: 1px solid; border-radius: 10px; max-height:200px;" id="viewerLogo"
                                                    src="{{asset('public\assets\back-end\img\400x400\img2.jpg')}}" alt="banner image"/>
                                            </center>
                                        </div>
        
                                        <div class="form-group">
                                            <div class="custom-file" style="text-align: left">
                                                <input type="file" name="news_image" id="LogoUpload" class="custom-file-input"
                                                    accept=".jpg, .png, .jpeg, .gif, .bmp, .tif, .tiff|image/*">
                                                <label class="custom-file-label" for="LogoUpload">News image</label>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary btn-user btn-block">Create News</button>
                                </form>
                                <hr>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('script')
@if ($errors->any())
    <script>
        @foreach($errors->all() as $error)
        toastr.error('{{$error}}', Error, {
            CloseButton: true,
            ProgressBar: true
        });
        @endforeach
    </script>
@endif
<script>
    $('#inputCheckd').change(function () {
            // console.log('jell');
            if ($(this).is(':checked')) {
                $('#apply').removeAttr('disabled');
            } else {
                $('#apply').attr('disabled', 'disabled');
            }

        });

    $('#exampleInputPassword ,#exampleRepeatPassword').on('keyup',function () {
        var pass = $("#exampleInputPassword").val();
        var passRepeat = $("#exampleRepeatPassword").val();
        if (pass==passRepeat){
            $('.pass').hide();
        }
        else{
            $('.pass').show();
        }
    });
    $('#apply').on('click',function () {

        var image = $("#image-set").val();
        if (image=="")
        {
            $('.image').show();
            return false;
        }
        var pass = $("#exampleInputPassword").val();
        var passRepeat = $("#exampleRepeatPassword").val();
        if (pass!=passRepeat){
            $('.pass').show();
            return false;
        }


    });
    function Validate(file) {
        var x;
        var le = file.length;
        var poin = file.lastIndexOf(".");
        var accu1 = file.substring(poin, le);
        var accu = accu1.toLowerCase();
        if ((accu != '.png') && (accu != '.jpg') && (accu != '.jpeg')) {
            x = 1;
            return x;
        } else {
            x = 0;
            return x;
        }
    }

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#viewer').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#customFileUpload").change(function () {
        readURL(this);
    });

    function readlogoURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#viewerLogo').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    function readBannerURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#viewerBanner').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#LogoUpload").change(function () {
        readlogoURL(this);
    });
    $("#BannerUpload").change(function () {
        readBannerURL(this);
    });
</script>
{{--ck editor--}}
<script src="{{asset('/')}}vendor/ckeditor/ckeditor/ckeditor.js"></script>
<script src="{{asset('/')}}vendor/ckeditor/ckeditor/adapters/jquery.js"></script>
<script>
    $('.textarea').ckeditor({
        contentsLangDirection : '{{Session::get('direction')}}',
    });
</script>
{{--ck editor--}}
@endpush
