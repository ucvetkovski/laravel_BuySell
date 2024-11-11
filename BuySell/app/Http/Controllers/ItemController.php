<?php

namespace App\Http\Controllers;

use Illuminate\Database\QueryException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
use Illuminate\Http\Testing\MimeType;
use Illuminate\Support\Facades\Validator;


class ItemController extends BaseController
{

    public function getAllItems()
    {
        return view('pages.items')->with($this->data);
    }

    public function getItem($id)
    {
        $item = DB::table('items')->where('items.id_item', '=', $id)
            ->join('categories', 'items.id_category', 'categories.id_category')
            ->join('price_types', 'items.price_type', 'price_types.id_type')
            ->join('item_states', 'items.item_state', 'item_states.id_item_state')
            ->join('users', 'items.id_user', 'users.id_user')
            ->join('cities', 'users.id_city', 'cities.id_city')
            ->join('countries', 'cities.id_country', 'countries.id_country')
            ->first();
        $this->data['item'] = $item;

        $this->data['itemImages'] = DB::table('images')->where('for_id_item', '=', $item->id_item)->get();
        return view('pages.itemPage')->with($this->data);
    }

    public function getNewItems()
    {
        $this->data['orderNew'] = 5;
        return view('pages.items')->with($this->data);
    }

    public function getItemsByCategory($id)
    {
        $category = DB::table('categories')->where('id_category', '=', $id)
            ->first();
        $this->data['selectedCategory'] = $category;
        return view('pages.items')->with($this->data);
    }

    public function search(Request $request)
    {
        $query = DB::table('items')
            ->join('categories', 'items.id_category', '=', 'categories.id_category')
            ->join('price_types', 'items.price_type', '=', 'price_types.id_type')
            ->join('item_states', 'items.item_state', '=', 'item_states.id_item_state')
            ->join('users', 'users.id_user', '=', 'items.id_user')
            ->leftJoin(DB::raw('(SELECT MIN(for_id_item) as for_id_item, MIN(image) as image FROM images GROUP BY for_id_item) AS images'), function ($join) {
                $join->on('items.id_item', '=', 'images.for_id_item');
            });




        if ($request->category != null && count($request->category) != 0) {
            $query->whereIn('items.id_category', $request->category);
        }
        if ($request->state != null && $request->state != 0) {
            $query->whereIn('id_item_state', $request->state);
        }
        if ($request->priceType != null && $request->priceType != 0) {
            $query->whereIn('id_type', $request->priceType);
        }
        if ($request->minPrice == null || $request->minPrice == '') {
            $minPrice = 0;
        } else {
            $minPrice = $request->minPrice;
        }
        if ($request->maxPrice == null || $request->maxPrice == '') {
            $get = DB::table('items')->select('item_price')->orderBy('item_price', 'desc')->first();
            $maxPrice = $get->item_price;

        } else {
            $maxPrice = $request->maxPrice;
        }
        if ($request->keyword != null && $request->keyword != '') {
            $query->where(function ($query) use ($request) {
                $query->where('item_name', 'LIKE', '%' . $request->keyword . '%')
                    ->orWhere('item_description', 'LIKE', '%' . $request->keyword . '%');
            });
        }


        if ($request->sortBy != null && $request->sortBy != 0) {
            if ($request->sortBy == 1) {
                $query->orderBy('items.item_price', 'asc');
            }
            if ($request->sortBy == 2) {
                $query->orderBy('items.item_price', 'desc');
            }
            if ($request->sortBy == 3) {
                $query->orderBy('items.item_name', 'asc');
            }
            if ($request->sortBy == 4) {
                $query->orderBy('items.item_name', 'desc');
            }
            if ($request->sortBy == 5) {
                $query->orderBy('items.created_at', 'desc');
            }
            if ($request->sortBy == 6) {
                $query->orderBy('items.created_at', 'asc');
            }
        }


        $items = $query->whereBetween('item_price', [$minPrice, $maxPrice])->get();


        $page = intval($request->page);
        $limit = 10;
        $totalPages = ceil(count($items) / $limit);
        $startLimit = ($page - 1) * $limit;

        $paginatedProducts = $query->whereBetween('item_price', [$minPrice, $maxPrice])->offset($startLimit)->limit($limit)->get();


        $currentPage = $page;

        $paginationView = '';


        if ($totalPages == 1)
            $paginationView .= View::make('components.pagination_btn', ['num' => 1, 'color' => 'primary']);
        if ($totalPages == 2) {
            $paginationView .= View::make('components.pagination_btn', ['num' => 1, 'color' => ($currentPage == 1) ? 'dark' : 'outline-secondary']);
            $paginationView .= View::make('components.pagination_btn', ['num' => 2, 'color' => ($currentPage == 2) ? 'dark' : 'outline-secondary']);
        }
        if ($totalPages > 2) {
            if ($page == 1) {
                $paginationView .= View::make('components.pagination_btn', ['num' => $currentPage, 'color' => 'dark']);
                $paginationView .= View::make('components.pagination_btn', ['num' => $currentPage + 1, 'color' => 'outline-secondary']);
                $paginationView .= View::make('components.pagination_btn', ['num' => $currentPage + 2, 'color' => 'outline-secondary']);
            } elseif ($page == $totalPages) {
                $paginationView .= View::make('components.pagination_btn', ['num' => $currentPage - 2, 'color' => 'outline-secondary']);
                $paginationView .= View::make('components.pagination_btn', ['num' => $currentPage - 1, 'color' => 'outline-secondary']);
                $paginationView .= View::make('components.pagination_btn', ['num' => $currentPage, 'color' => 'dark']);
            } else {
                $paginationView .= View::make('components.pagination_btn', ['num' => $currentPage - 1, 'color' => 'outline-secondary']);
                $paginationView .= View::make('components.pagination_btn', ['num' => $currentPage, 'color' => 'dark']);
                $paginationView .= View::make('components.pagination_btn', ['num' => $currentPage + 1, 'color' => 'outline-secondary']);
            }
        }


        $responseView = '';
        foreach ($paginatedProducts as $item) {
            $responseView .= View::make("partials.item_horizontal", ['item' => $item]);
        }

        if ($responseView == '') {
            $noItems = '<div><h3>There are no items for the entered criteria.</h3></div>';
            return response(['reply' => $noItems]);
        }

        // $categoryCounts = [];
        // foreach ($items as $item) {
        //     if (isset($categoryCounts[$item->id_category])) {
        //         $categoryCounts[$item->id_category]++;
        //     } else {
        //         $categoryCounts[$item->id_category] = 1;
        //     }
        // }
        // $catDiv = '';
        // $catDiv .= View::make('partials.categories_filter')->with(['categories' => $this->data['categories'], 'counter' => $categoryCounts]);

        return response(['reply' => $responseView, 'pagination' => $paginationView]);
    }

    public function showAddForm()
    {
        return view('pages.addItem')->with($this->data);
    }

    public function addItem(FormRequest $request)
    {


        $user = session()->get('user');

        $id = DB::table('items')->insertGetId([
            'item_name' => $request->name,
            'item_price' => $request->price,
            'id_category' => $request->category,
            'price_type' => $request->type,
            'item_state' => $request->state,
            'item_description' => $request->description,
            'id_user' => $user->id_user
        ]);

        if ($id != null && $id != 0) {
            if ($request->files != null) {
                foreach ($request->files as $array) {
                    foreach ($array as $file) {

                        $filename = uniqid() . $file->getClientOriginalName();
                        $file->move('upload/items/', $filename);

                        DB::table('images')->insert([
                            'for_id_item' => $id,
                            'image' => $filename
                        ]);
                    }

                }
            }
        }

        return response(['response' => '/newArrivals'], 201);
    }

    public function checkoutPage($id)
    {

        $this->data['item'] = $id;
        $this->data['cardInfo'] = DB::table('card_informations')->where('card_informations.id_user', '=', session()->get('user')->id_user)->first();
        return view('pages.checkout')->with($this->data);
    }

    public function checkout(Request $request)
    {


        $validator = Validator::make($request->all(), [
            'cardNumber' => 'required|string|digits:16',
            'month' => 'required|string|digits:2',
            'year' => 'required|digits:2',
            'cvv' => 'required|string|digits:3',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()], 406);
        }

        DB::transaction(function () use ($request) {

            $dataToCopy = DB::table('items')->where('id_item', '=', $request->item)->first();

            if ($dataToCopy) {
                DB::table('sales')->insert((array) $dataToCopy);
            }

            DB::table('items')->where('id_item', '=', $request->item)->delete();

            DB::table('transactions')->insert([
                "id_item" => $dataToCopy->id_item,
                "card" => $request->cardNumber,
                "id_buyer" => $request->buyer
            ]);

            if ($request->saveCardData == "true") {
                DB::table('card_informations')->insert([
                    "id_user" => $request->buyer,
                    "card_number" => $request->cardNumber
                ]);
            }
        });


        return response()->json(['success' => 'success'], 201);

    }
}
