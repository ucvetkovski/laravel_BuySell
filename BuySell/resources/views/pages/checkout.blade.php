@extends('layouts.layout')

@section('title')
    Checkout
@endsection

@section('content')
    <div class="row mb-5 me-5">
        <div class="col-md-6 offset-md-3 my-5">
            <form class="p-3">
                <div class="col mt-5 alert alert-danger" id="errorsDiv" role="alert">
                </div>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-center">Payment information</h4>
                </div>
                <div class="row mt-3">
                    <input type="hidden" id="user" name="user" value={{ session()->get('user')->id_user }} />
                    <input type="hidden" id="item" value="{{ $item }}" />
                    <div class="col-md-12 my-3 form-group"><label class="labels">Credit card information</label>
                        <label for="cardNumber"></label>
                        <input type="text" @if (isset($cardInfo) && $cardInfo != null) value="{{ $cardInfo->card_number }}" @endif
                            id="cardNumber" name="cardNumber" class="form-control" />
                    </div>
                    <div class="row form-group my-3">
                        <div class="col-md-6">
                            <label for="month">Expiry Month</label>
                            <input type="text" name="month" class="form-control" id="month" />
                        </div>
                        <div class="col-md-6">
                            <label for="month">Expiry Year</label>
                            <input type="text" name="year" class="form-control" id="year" />
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-6">
                            <label for="month">CVV2</label>
                            <input type="text" name="cvv" class="form-control" id="cvv" />
                        </div>
                    </div>
                    @if (!isset($cardInfo) && $cardInfo == null)
                        <div class="form-group my-3">
                            <div>
                                <label for="saveCardData">Would you like to save your card information for future
                                    purchases?</label>
                                <input type="checkbox" name="saveCard" id="saveCardData" />
                            </div>
                        </div>
                    @endif


                </div>
                <div class="d-flex mt-5 justify-content-center">
                    <div class="text-center"><button class="btn profile-button me-1" data-token="{{ csrf_token() }}"
                            id="purchaseBtn" type="button">Confirm purchase</button></div>
                </div>
            </form>
        </div>
    </div>
@endsection
