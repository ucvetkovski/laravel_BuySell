        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="{{ route('index') }}"><img class="m-2" width="25%"
                        src="{{ asset('logo.png') }}">BuySell</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation"><span
                        class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarSupportedContent">
                    <div>
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                            <li class="nav-item"><a class="nav-link active" aria-current="page"
                                    href="{{ route('index') }}">Home</a></li>


                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="{{ route('allItems') }}">All Articles</a></li>
                                    <li>
                                        <hr class="dropdown-divider" />
                                    </li>
                                    <li><a class="dropdown-item" href="{{ route('newItems') }}">New Arrivals</a></li>
                                </ul>
                            </li>


                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-expanded="false">Categories</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    @foreach ($categories as $category)
                                        <li><a class="dropdown-item"
                                                href="{{ route('itemsByCategory', ['id' => $category->id_category]) }}">{{ $category->category_name }}
                                                ({{ $category->items_count }})
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            </li>

                            <li class="nav-item"><a class="nav-link" href="{{ route('author') }}">Author</a></li>
                        </ul>
                    </div>

                    <div>
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">

                            @if (!session()->has('user'))
                                <li class="nav-item"><a class="nav-link" aria-current="page"
                                        href="{{ route('registration') }}">Register</a>
                                </li>
                                <li class="nav-item"><a class="nav-link" aria-current="page"
                                        href="{{ route('login') }}">Login</a></li>
                            @else
                                <li class="nav-item"><a class="nav-link" aria-current="page"
                                        href="{{ route('addForm') }}">Post
                                        article</a></li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">My profile</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a class="dropdown-item" href="{{ route('profile') }}">My transactions
                                            </a>
                                        </li>
                                        <li><a class="dropdown-item" href="{{ route('editProfile') }}">Edit profile
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                                <li class="nav-item"><a href="{{ route('logout') }}" class="nav-link"
                                        aria-current="page">
                                        Logout
                                    </a></li>
                            @endif
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
