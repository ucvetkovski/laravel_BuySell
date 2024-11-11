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
        <div class="col-md-2 offset-md-1  p-2" id="filtersDiv">
            <div>
                <form class="form">
                    <fieldset>
                        <legend>Filters</legend>
                        <div class="form-group">
                            <div><input class="form-control" type="text" id="keyword" placeholder="Search.." />
                            </div>
                        </div>
                        <div class="form-group my-4">
                            <select id="sort" class="form-select">
                                <option selected disabled value='0'>Order by..</option>
                                <option @if (isset($orderNew)) selected @endif value="5">Newest first
                                </option>
                                <option value="6">Oldest first</option>
                                <option value="1">Price (ASC)</option>
                                <option value="2">Price (DESC)</option>
                                <option value="3">Name (ASC)</option>
                                <option value="4">Name (DESC)</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <div class="form-group">
                                <label for="min_price">Min price</label>
                                <input type="number" class="form-control" id="min_price" />
                            </div>
                            <div class="form-group">
                                <label for="max_price">Max price</label>
                                <input type="number" class="form-control" id="max_price" />
                            </div>
                        </div>
                        <div class="form-group my-4">
                            <span><strong>Price</strong></span>

                            @foreach ($price_types as $type)
                                <div class="form-group">
                                    <label for="{{ $type->type_name }}">{{ $type->type_name }}</label>
                                    <input type="checkbox" class="type_filter" id="{{ $type->type_name }}"
                                        value="{{ $type->id_type }}" />
                                </div>
                            @endforeach
                        </div>
                        <div class="form-group my-4">
                            <span><strong>Condition</strong></span>

                            @foreach ($item_states as $state)
                                <div class="form-group">
                                    <label for="{{ $state->state_name }}">{{ $state->state_name }}</label>
                                    <input type="checkbox" class="state_filter" id="{{ $state->state_name }}"
                                        value="{{ $state->id_item_state }}" />
                                </div>
                            @endforeach
                        </div>
                        <div class="form-group my-4" id='categoriesFilterDiv'>
                            @include('partials.categories_filter')
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
        <div class="container col-md-8 d-flex align-items-center flex-column">

            <div class="col-md-11 d-flex flex-wrap justify-content-center" id="itemsDiv">

            </div>

        </div>
        <div class="f-flex my-4 text-center" id="pagination">

        </div>
    </div>
@endsection
