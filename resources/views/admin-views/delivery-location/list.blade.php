@extends('layouts.back-end.app')

@section('title', \App\CPU\translate('Delivery Location List'))

@push('css_or_js')

@endpush

@section('content')
    <div class="content container-fluid">

        <!-- Page Heading -->
        <div class="d-sm-flex align-items-center justify-content-between mb-2">
            <h1 class="h3 mb-0 text-black-50">Delivery Locations <span style="color: rgb(252, 59, 10);">({{ $delivery_locations->total() }})</span></h1>
        </div>

        <div class="row" style="margin-top: 20px">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <!-- Search -->
                        <form action="{{ url()->current() }}" method="GET">
                            <div class="input-group input-group-merge input-group-flush">
                                <div class="input-group-prepend">
                                    <div class="input-group-text">
                                        <i class="tio-search"></i>
                                    </div>
                                </div>
                                <input id="datatableSearch_" type="search" name="search" class="form-control"
                                    placeholder="{{ \App\CPU\translate('Search')}} {{ \App\CPU\translate('Brands')}}" aria-label="Search orders" value="{{ $search }}" required>
                                <button type="submit" class="btn btn-primary">{{ \App\CPU\translate('Search')}}</button>
                            </div>
                        </form>
                        <!-- End Search -->
                    </div>
                    <div class="card-body" style="padding: 0">
                        <div class="table-responsive">
                            <table style="text-align: {{Session::get('direction') === "rtl" ? 'right' : 'left'}};"
                                class="table table-borderless table-thead-bordered table-nowrap table-align-middle card-table">
                                <thead class="thead-light">
                                <tr>
                                    <th scope="col" style="width: 100px">
                                        #
                                    </th>
                                    <th scope="col">Pincode</th>
                                    <th scope="col">Location</th>
                                    <th scope="col">RL Location</th>
                                    <th scope="col">RM Control</th>
                                    <th scope="col">State</th>
                                    <th scope="col">Service Type</th>
                                    <th scope="col">Services</th>
                                </tr>
                                </thead>
                                <tbody>

                                @foreach($delivery_locations as $k=>$b)
                                    <tr>
                                        <td class="text-center">{{$delivery_locations->firstItem()+$k}}</td>
                                        <td>{{$b['Pincode']}}</td>
                                        <td>{{$b['Location']}}</td>
                                        <td>{{$b['RL Location']}}</td>
                                        <td>{{$b['RM Control']}}</td>
                                        <td>{{$b['State']}}</td>
                                        <td>{{$b['Service Type']}}</td>
                                        <td>{{$b['Services']}}</td>
                                    </tr>
                                @endforeach

                                </tbody>
                            </table>

                        </div>
                    </div>
                    <div class="card-footer">
                        {{$delivery_locations->links()}}
                    </div>
                    @if(count($delivery_locations)==0)
                        <div class="text-center p-4">
                            <img class="mb-3" src="{{asset('public/assets/back-end')}}/svg/illustrations/sorry.svg" alt="Image Description" style="width: 7rem;">
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
        $(document).on('click', '.delete', function () {
            var id = $(this).attr("id");
            Swal.fire({
                title: '{{ \App\CPU\translate('Are_you_sure_delete_this_brand')}}?',
                text: "{{ \App\CPU\translate('You_will_not_be_able_to_revert_this')}}!",
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '{{ \App\CPU\translate('Yes')}}, {{ \App\CPU\translate('delete_it')}}!'
            }).then((result) => {
                if (result.value) {
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                        }
                    });
                    $.ajax({
                        url: "{{route('admin.brand.delete')}}",
                        method: 'POST',
                        data: {id: id},
                        success: function () {
                            toastr.success('{{ \App\CPU\translate('Brand_deleted_successfully')}}');
                            location.reload();
                        }
                    });
                }
            })
        });
    </script>
@endpush
