@extends('layouts.layout')

@section('title')
    User Profile
@endsection

@section('content')
    <div>
        <form class="form-control align-items-center mt-5 p-5" method="post" action="{{ route('saveEdit') }}">
            @if (session('messages'))
                <div class="col mt-5 alert alert-success" role="alert">
                    {{ session('messages') }}
                </div>
            @endif
            @include('partials.editData')
        </form>
    </div>
@endsection
