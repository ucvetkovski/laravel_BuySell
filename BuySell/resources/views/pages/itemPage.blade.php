@extends('layouts.layout')


@section('title')
    {{ $item->item_name }}
@endsection

@section('content')
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            @if (isset($itemImages) && $itemImages != null)
                <div class="col-md-4 single-item d-flex">
                    @foreach ($itemImages as $image)
                        <div class="col-md-12"><img class="itemPageImg" src=" {{ asset('upload/items/' . $image->image) }}"
                                alt="{{ $item->item_name }}" />
                        </div>
                    @endforeach

                </div>
            @endif
            <div class="col-md-8">

                <h1 class="display-5 fw-bolder">{{ $item->item_name }}</h1>
                <div class="fs-5 mb-5">
                    <span>${{ $item->item_price }}</span>
                </div>

                <div class="mb-5">
                    <div class="small mb-1"><span><strong>Category:</strong></span> <a
                            href="{{ route('itemsByCategory', ['id' => $item->id_category]) }}">{{ $item->category_name }}</a>
                    </div>
                    <div class="small mb-1"><span><strong>Price:</strong></span> {{ $item->type_name }}</div>
                    <div class="small mb-1"><span><strong>Condition:</strong></span> {{ $item->state_name }}</div>
                </div>

                <p class="lead">{{ $item->item_description }}</p>

                <div class="mb-3">
                    <div class="small mb-1"><span><strong>By user:</strong></span> {{ $item->username }}</div>
                    <div class="small mb-1"><span class="text-muted">{{ $item->city_name }}</span></div>
                    <div class="small mb-1"><span class="text-muted">{{ $item->country_name }}</span></div>
                </div>

                <div class="d-flex align-items-center">
                    @if (isset(session()->get('user')->id_user) && session()->get('user')->id_user != $item->id_user)
                        @if ($item->price_type == 1)
                            <a href="{{ route('checkoutPage', ['id' => $item->id_item]) }}">
                                <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                    <i class="bi-cart-fill me-1"></i>
                                    Purchase
                                </button>
                            </a>
                        @else
                            <div class="col">
                                <a href="{{ route('checkoutPage', ['id' => $item->id_item]) }}">
                                    <button class="btn btn-outline-dark flex-shrink-0" type="button">
                                        <i class="bi-cart-fill me-1"></i>
                                        Purchase
                                    </button>
                                </a>
                            </div>
                            <div class="col">
                                <div class="small mb-1"><span><strong>Contact seller:</strong></span></div>
                                <div class="small mb-1"><span>Phone: </span><a href="tel:{{ $item->phone_number }}">
                                        {{ $item->phone_number }}</a></div>
                                <div class="small mb-1"><span>Email: </span> <a
                                        href="mailto:{{ $item->email }}">{{ $item->email }}</a></div>
                            </div>
                        @endif
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection
