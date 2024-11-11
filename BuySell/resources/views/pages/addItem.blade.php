@extends('layouts.layout')

@section('title')
    Add Article
@endsection

@section('content')
    <div class="row mb-5 me-5">
        <div class="col-md-6 offset-md-3 my-5">
            <div class="alert alert-success text-center" id="successAdd" style="display:none">
            </div>
            <div class="alert alert-danger text-center" id="errorAdd" style="display:none">
            </div>
            <form class="p-3">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <h4 class="text-center">Add article</h4>
                </div>
                <div class="row mt-3">
                    <div class="col-md-12"><label class="labels">Article Name</label><input type="text"
                            class="form-control" id="addName" name="addName" placeholder="Article name"></div>
                    <div class="col-md-12 my-3"><label class="labels">Category</label>
                        <select id="addSelect" class="form-select">
                            <option selected disabled value='0'>Select a category</option>
                            @foreach ($categories as $category)
                                <option value="{{ $category->id_category }}">{{ $category->category_name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-12"><label class="labels">Condition</label>
                        <select id="addCondition" class="form-select">
                            <option selected disabled value='0'>Item is..</option>
                            @foreach ($item_states as $state)
                                <option value="{{ $state->id_item_state }}">{{ $state->state_name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-12 my-3"><label for="addPrice" class="labels">Price</label><input type="text"
                            class="form-control" id="addPrice" name="addPrice" placeholder="$"></div>


                    <div class="col-md-12">
                        <select id="addPriceSelect" class="form-select">
                            <option selected disabled value='0'>Price is..</option>
                            @foreach ($price_types as $type)
                                <option value="{{ $type->id_type }}">{{ $type->type_name }}</option>
                            @endforeach
                        </select>
                    </div>


                    <div class="col-md-12 my-3"><label class="labels">Description</label>
                        <textarea rows="4" class="form-control" id="description" name="description"></textarea>
                    </div>

                    <div class="col-md-12">
                        <label for="">Upload Images</label>
                        <input class="imagesUpload" id='image' multiple='multiple' type="file" name="image"
                            required class="course form-control">
                    </div>
                </div>
                <div class="d-flex mt-5 justify-content-center">
                    <div class="text-center"><button class="btn btn-success profile-button me-1" id="addItemBtn"
                            data-token="{{ csrf_token() }}" type="button">Confirm</button></div>
                </div>
            </form>
        </div>
    </div>
@endsection
