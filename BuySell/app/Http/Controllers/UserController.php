<?php

namespace App\Http\Controllers;

use Illuminate\Database\QueryException;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
use Illuminate\Http\Testing\MimeType;
use Illuminate\Support\Facades\Validator;

class UserController extends BaseController
{
    public function getProfile()
    {
        $user = session()->get('user');

        $this->data['sales'] = DB::table('transactions')
            ->join('sales', 'sales.id_item', 'transactions.id_item')
            ->join('price_types', 'sales.price_type', 'price_types.id_type')
            ->join('item_states', 'sales.item_state', 'item_states.id_item_state')
            ->join('users', 'sales.id_user', 'users.id_user')
            ->where('sales.id_user', '=', $user->id_user)
            ->leftJoin(DB::raw('(SELECT MIN(for_id_item) as for_id_item, MIN(image) as image FROM images GROUP BY for_id_item) AS images'), function ($join) {
                $join->on('sales.id_item', '=', 'images.for_id_item');
            })
            ->orderBy('sales.created_at', 'desc')
            ->get();

        $this->data['purchases'] = DB::table('transactions')
            ->join('sales', 'sales.id_item', 'transactions.id_item')
            ->join('price_types', 'sales.price_type', 'price_types.id_type')
            ->join('item_states', 'sales.item_state', 'item_states.id_item_state')
            ->join('users', 'sales.id_user', 'users.id_user')
            ->where('transactions.id_buyer', '=', $user->id_user)
            ->leftJoin(DB::raw('(SELECT MIN(for_id_item) as for_id_item, MIN(image) as image FROM images GROUP BY for_id_item) AS images'), function ($join) {
                $join->on('sales.id_item', '=', 'images.for_id_item');
            })
            ->orderBy('transactions.created_at', 'desc')
            ->get();

        return view('pages.profile')->with($this->data);
    }

    public function editProfileForm()
    {
        foreach ($this->data['allUsers'] as $user) {
            if ($user->id_user == session()->get('user')->id_user) {
                $this->data['user'] = $user;
            }
        }
        return view('pages.editUserProfile')->with($this->data);
    }

    public function deleteUser(Request $request)
    {

        DB::table('users')->where('id_user', '=', $request->id)->delete();

        return response(['response' => 'User deleted successfully.']);
    }
}
