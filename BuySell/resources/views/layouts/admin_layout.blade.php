@include('fixed.head')

<body>
    @include('fixed.admin_head')

    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        @include('fixed.admin_nav')
        <div class="body-wrapper">
            @include('fixed.admin_header')

            <body>
                @yield('content')
            </body>

        </div>
    </div>
    @include('pages.admin.scripts')
</body>

</html>
