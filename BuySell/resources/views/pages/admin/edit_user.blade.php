@extends('layouts.admin_layout')
@section('title')
    Edit user
@endsection
@section('content')
    <div class="container-fluid">
        <div class="card">
            <div class="card-body">
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
                <form class="form-control align-items-center mt-5 p-5">
                    @csrf
                    <div class="form-group p-2">
                        <label for="name">User ID:</label>
                        <input class="form-control" type="text" id='userToEdit' />
                        <button class="form-control mt-3" type="button" data-token="{{ @csrf_token() }}"
                            id="searchUserBtn">Search</button>
                    </div>
                </form>
                <form class="form-control align-items-center mt-5 p-5" method="post" action="{{ route('saveEdit') }}"
                    id="userResult">
                </form>
                {{-- <form class="form-control align-items-center mt-5 p-5" method="post" action="{{ route('editUser') }}">
                    @csrf <!-- Include the CSRF token field -->
                    <div class="form-group p-2">
                        <label for="name">Name</label>
                        <input class="form-control" value="{{ old('name') }}" type="name" name="name" id="name"
                            required>
                    </div>
                    <div class="form-group p-2">
                        <label for="surname">Surname</label>
                        <input class="form-control" value="{{ old('surname') }}" type="text" name="surname"
                            id="surname" required>
                    </div>
                    <div class="form-group p-2">
                        <label for="email">Phone number</label>
                        <input class="form-control" value="{{ old('phone') }}" type="text" name="phone" id="phone"
                            required>
                    </div>

                    <div class="form-group p-2">
                        <label for="country">Country</label>
                        <select class="form-select p-2 col-md-6" id="country" data-token="{{ csrf_token() }}"
                            name="country">
                            <option selected disabled>Select a country</option>
                            @foreach ($allCountries as $country)
                                <option @if ($country->id_country == old('country')) selected='true' @endif
                                    value="{{ $country->id_country }}" id="{{ $country->country_name }}">
                                    {{ $country->country_name }}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="form-group p-2" id='city_div'>
                        <label for="city">City</label>
                        <select class="form-select p-2 col-md-6" id="city" name="city">
                        </select>
                    </div>

                    <div class="form-group p-2" id="address_div">
                        <label for="address">Address</label>
                        <input class="form-control p-2" type="text" id="address" name="address" />
                    </div>

                    <div class="form-group p-2">
                        <label for="username">Username</label>
                        <input class="form-control" value="{{ old('username') }}" type="text" name="username"
                            id="username" required>
                    </div>

                    <div class="form-group p-2">
                        <label for="email">Email</label>
                        <input class="form-control" value="{{ old('email') }}" type="email" name="email"
                            id="email" required>
                    </div>

                    <div class="form-group p-2">
                        <label for="password">Password</label>
                        <input class="form-control" type="password" name="password" id="password" required>
                    </div>

                    <div class="form-group p-2">
                        <label for="password">Repeat password</label>
                        <input class="form-control" type="password" name="password_confirmation" id="password_confirmation"
                            required>
                    </div>
                    <div class="form-group p-2 col-md-2">
                        <button class="form-control col-md-12" type="submit">Register</button>
                    </div>
                </form> --}}

            </div>
        </div>
    </div>
@endsection
