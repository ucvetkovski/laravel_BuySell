@extends('layouts.admin_layout')

@section('title')
    Users
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
                <div class="table-responsive">
                    <table id='tableUsers' class="table table-striped text-nowrap mb-0 align-middle">
                        <thead class="text-dark fs-4">
                            <tr>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">#User</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Full Name</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">City</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Country</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Phone Number</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Email</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Edit</h6>
                                </th>
                                <th class="border-bottom-0">
                                    <h6 class="fw-semibold mb-0">Delete</h6>
                                </th>
                            </tr>
                        </thead>
                        <tbody id='usersResultDiv'>
                        </tbody>
                    </table>
                </div>
                <form class="form-control align-items-center mt-5 p-5" method="post" action="{{ route('saveEdit') }}"
                    id="userResult">
                </form>
            </div>
        </div>
    </div>
@endsection
