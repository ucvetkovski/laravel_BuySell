@extends('layouts.layout')
@section('title')
    Login
@endsection

@section('content')
    <div class="container" id="login_container">

        <div class="col mb-5 p-5" id="login_div">
            @if ($errors->any())
                <div class="col mt-5 alert alert-danger" role="alert">
                    @foreach ($errors->all() as $error)
                        <p>{{ $error }}</p>
                    @endforeach
                </div>
            @endif
            @if (session('messages'))
                <div class="col mt-5 alert alert-success" role="alert">
                    {{ session('messages') }}
                </div>
            @endif
            <form class="form-control d-flex flex-column align-items-center mt-5 p-5" id="login_form" method="post"
                action="{{ route('login') }}">
                @csrf <!-- Include the CSRF token field -->

                <div class="form-group p-2">
                    <label for="email">Email</label>
                    <input class="form-control" type="text" name="email" id="email" required>
                </div>

                <div class="form-group my-3 p-2">
                    <label for="password">Password</label>
                    <input class="form-control" type="password" name="password" id="password" required>
                </div>
                <div class="form-group p-2 col-md-2">
                    <button class="form-control col-md-12" type="submit">Login</button>
                </div>
            </form>

        </div>
    </div>
@endsection
