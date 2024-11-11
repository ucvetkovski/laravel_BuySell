@extends('layouts.layout')

@section('title')
    Author
@endsection

@section('content')
    <div class="container row m-5">
        <div class=" col-md-9">
            <h2>About author</h2>
            <div>
                <p>Hello! I am Uroš. Final year student at ICT College majoring in web engineering. </p>
                <p>Known for my charisma, uniquenes, nerve and talent. </p>
                <p>Passionate about video editing, video games and writing.</p>
            </div>
        </div>
        <div class=" col-md-3">
            <img src="{{ asset('ja.JPG') }}" alt='author'>
            <p class="my-2">Index number: <strong>38/21</strong></p>
        </div>
    </div>
@endsection
