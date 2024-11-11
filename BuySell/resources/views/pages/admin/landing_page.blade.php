@extends('layouts.admin_layout')
@section('title')
    Admin
@endsection

<body>

    @section('content')
        <div class="container-fluid">
            <!--  Row 1 -->
            <div class="row">
                <div class="col-lg-4 d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-4">
                            <div class="mb-4">
                                <h5 class="card-title fw-semibold">Recent Sales</h5>
                            </div>
                            <ul class="timeline-widget mb-0 position-relative mb-n5">
                                @foreach ($transactions as $transaction)
                                    <li class="timeline-item d-flex position-relative overflow-hidden">
                                        <div class="timeline-time text-dark flex-shrink-0 text-end">
                                            {{ date('d-M-y H:i', strtotime($transaction->created_at)) }}</div>
                                        <div class="timeline-badge-wrap d-flex flex-column align-items-center">
                                            <span
                                                class="timeline-badge border-2 border border-primary flex-shrink-0 my-8"></span>
                                            <span class="timeline-badge-border d-block flex-shrink-0"></span>
                                        </div>
                                        <div class="timeline-desc fs-3 text-dark mt-n1">
                                            <strong>{{ $transaction->buyer_surname }}
                                                {{ $transaction->buyer_name }}</strong> bought
                                            "{{ $transaction->item_name }}" from
                                            <strong>{{ $transaction->seller_surname }}
                                                {{ $transaction->seller_name }}</strong> for
                                            ${{ $transaction->item_price }}
                                        </div>
                                    </li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 d-flex align-items-stretch">
                    <div class="card w-100">
                        <div class="card-body p-4">
                            <h5 class="card-title fw-semibold mb-4">Recent Transactions</h5>
                            <div class="table-responsive">
                                <table class="table text-nowrap mb-0 align-middle">
                                    <thead class="text-dark fs-4">
                                        <tr>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">#Transaction</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Seller</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Buyer</h6>
                                            </th>
                                            <th class="border-bottom-0">
                                                <h6 class="fw-semibold mb-0">Transfered</h6>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($transactions as $transaction)
                                            <tr>
                                                <td class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-0">{{ $transaction->id_transaction }}</h6>
                                                </td>
                                                <td class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-1">{{ $transaction->seller_name }}</h6>
                                                    <span class="fw-normal">{{ $transaction->seller_username }}</span>
                                                </td>
                                                <td class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-1">{{ $transaction->buyer_name }}</h6>
                                                    <span class="fw-normal">{{ $transaction->buyer_username }}</span>
                                                </td>
                                                <td class="border-bottom-0">
                                                    <h6 class="fw-semibold mb-0 fs-4">${{ $transaction->item_price }}</h6>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 d-flex align-items-strech">
                    <div class="card w-100">
                        <div class="card-body">
                            <div class="d-sm-flex d-block align-items-center justify-content-between mb-9">
                                <div class="mb-3 mb-sm-0">
                                    <h5 class="card-title fw-semibold">Activity Overview</h5>
                                </div>
                            </div>
                            <div id="logData"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Yearly Breakup -->
                            <div class="card overflow-hidden">
                                <div class="card-body p-4">
                                    <h5 class="card-title mb-9 fw-semibold">User Breakup</h5>
                                    <div class="row align-items-center">
                                        <div class="col-8">
                                            <h4 class="fw-semibold mb-3">{{ count($users) }}</h4>
                                            <div class="d-flex align-items-center">
                                                <div class="me-4">
                                                    <span class="round-8 bg-sell rounded-circle me-2 d-inline-block"></span>
                                                    <span class="fs-2">Sellers</span>
                                                </div>
                                                <div>
                                                    <span class="round-8 bg-buy rounded-circle me-2 d-inline-block"></span>
                                                    <span class="fs-2">Buyers</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="d-flex justify-content-center">
                                                <div id="breakup"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    @endsection

</body>
