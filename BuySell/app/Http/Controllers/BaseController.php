<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BaseController extends Controller
{

    protected array $data;
    public function __construct()
    {
        $this->data['categories'] = DB::table('categories')
            ->select('categories.*', DB::raw('COUNT(items.id_item) as items_count'))
            ->leftJoin('items', 'categories.id_category', '=', 'items.id_category')
            ->groupBy('categories.id_category', 'categories.category_name', 'categories.created_at', 'categories.updated_at')
            ->get();

        $this->data['item_states'] = DB::table('item_states')->get();
        $this->data['price_types'] = DB::table('price_types')->get();

        $this->data['allCountries'] = DB::table('countries')->get();

        $this->data['allUsers'] = DB::table('users')
            ->join('cities', 'users.id_city', 'cities.id_city')
            ->join('countries', 'cities.id_country', 'countries.id_country')
            ->get();
    }
    public function getData()
    {
        $cheap = DB::table('items')
            ->join('categories', 'items.id_category', '=', 'categories.id_category')
            ->join('price_types', 'items.price_type', '=', 'price_types.id_type')
            ->join('item_states', 'items.item_state', '=', 'item_states.id_item_state')
            ->join('users', 'users.id_user', '=', 'items.id_user')
            ->leftJoin(DB::raw('(SELECT MIN(for_id_item) as for_id_item, MIN(image) as image FROM images GROUP BY for_id_item) AS images'), function ($join) {
                $join->on('items.id_item', '=', 'images.for_id_item');
            })->take(10)->get();

        $new = DB::table('items')
            ->join('categories', 'items.id_category', '=', 'categories.id_category')
            ->join('price_types', 'items.price_type', '=', 'price_types.id_type')
            ->join('item_states', 'items.item_state', '=', 'item_states.id_item_state')
            ->join('users', 'users.id_user', '=', 'items.id_user')
            ->leftJoin(DB::raw('(SELECT MIN(for_id_item) as for_id_item, MIN(image) as image FROM images GROUP BY for_id_item) AS images'), function ($join) {
                $join->on('items.id_item', '=', 'images.for_id_item');
            })->take(15)->get();

        $this->data['cheapestItems'] = $cheap;
        $this->data['newest'] = $new;

        return view('pages.index')->with($this->data);

    }

    public function author()
    {
        return view('pages.author')->with($this->data);
    }
}
