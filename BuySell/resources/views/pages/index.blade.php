@extends('layouts.layout')

@section('title')
    Home
@endsection

@section('content')
    <div class="container px-4 px-lg-5 mt-5 d-flex">
        <div class="col-md-3" id='categories'>
            <h3><strong>Categories</strong></h3>
            <div class="gx-4 gx-lg-5">
                <ul class="list-unstyled">
                    @foreach ($categories as $category)
                        <li class="m-2"><a class=""
                                href='{{ route('itemsByCategory', ['id' => $category->id_category]) }}'>{{ $category->category_name }}
                                ({{ $category->items_count }})
                            </a></li>
                    @endforeach
                </ul>
            </div>
        </div>
        <div class="col-md-8">
            <div>
                <h2 class="mb-2"><strong>Cheapest deals</strong></h2>
                <div class="col-md-12 multiple-items">
                    @foreach ($cheapestItems as $item)
                        @include('partials.item')
                    @endforeach
                </div>
            </div>
            <div class="my-5">
                <h2 class="mb-2"><strong>New additions</strong></h2>
                <div class="col-md-12 multiple-items">
                    @foreach ($newest as $item)
                        @include('partials.item')
                    @endforeach
                </div>
            </div>
        </div>

    </div>
@endsection
