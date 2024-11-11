@extends('layouts.layout')
@section('title')
    @if (isset($selectedCategory))
        {{ $selectedCategory->category_name }}
    @else
        {{ 'Search' }}
    @endif
@endsection
{{-- {{ dd(count($items)) }} --}}

@section('content')
    <div class="row mt-5">
        <div class="container d-flex align-items-center justify-content-around col-md-12">

            <div class="col-md-5 d-flex flex-wrap justify-content-center" id="usersSales">
                <div class="col-md-12">
                    <h3 class="text-center">Your sales</h3>
                </div>
                @if (isset($sales) && count($sales) != 0)
                    @foreach ($sales as $item)
                        @include('partials.profile_items')
                    @endforeach
                @else
                    <div class="col-md-12 text-center">Looks like you haven't had any sales yet..</div>
                @endif
            </div>

            <div class="col-md-5 d-flex flex-wrap justify-content-center" id="usersPurchases">
                <div class="col-md-12">
                    <h3 class="text-center">Your purchases</h3>
                </div>
                @if (isset($purchases) && count($purchases) != 0)
                    @foreach ($purchases as $item)
                        @include('partials.profile_items')
                    @endforeach
                @else
                    <div class="col-md-12 text-center">Looks like you haven't made any purchases yet..</div>
                @endif

            </div>

        </div>
        <div class="f-flex my-4 text-center" id="pagination">

        </div>
    </div>
@endsection
