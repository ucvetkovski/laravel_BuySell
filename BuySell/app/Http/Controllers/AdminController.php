<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\File;


class AdminController extends BaseController
{
    public function index()
    {


        $allTransactions = DB::table('transactions')
            ->join('sales', 'sales.id_item', 'transactions.id_item')
            ->join('users as buyers', 'buyers.id_user', 'transactions.id_buyer')
            ->join('users as sellers', 'sellers.id_user', 'sales.id_user')
            ->select(
                'transactions.*',
                'sales.*',
                'buyers.id_user as id_buyer',
                'buyers.name as buyer_name',
                'buyers.surname as buyer_surname',
                'buyers.username as buyer_username',
                'sellers.id_user as id_seller',
                'sellers.name as seller_name',
                'sellers.surname as seller_surname',
                'sellers.username as seller_username'
            )->orderBy('id_transaction', 'desc')
            ->take(5)->get();


        return view('pages.admin.landing_page')->with(['transactions' => $allTransactions, 'users' => $this->data['allUsers'], $this->data]);
    }

    public function showLog()
    {
        $logFile = storage_path('logs/log.log');
        $logContent = File::get($logFile);
        $reversedLogContent = implode("\n", array_reverse(explode("\n", $logContent)));

        return response()->json($reversedLogContent);
    }

    public function getData()
    {

        $allTransactions = DB::table('transactions')
            ->join('sales', 'sales.id_item', 'transactions.id_item')
            ->join('users as buyers', 'buyers.id_user', 'sales.id_user')
            ->select(
                'transactions.*',
                'sales.*',
                'buyers.id_user as id_buyer',
                'buyers.name as buyer_name',
                'buyers.surname as buyer_surname',
                'buyers.username as buyer_username'
            )
            ->orderBy('id_transaction', 'desc')
            ->get();

        $sellers = [];

        $this->data['items'] = DB::table('items')->get();



        foreach ($this->data['items'] as $user) {
            if (!in_array($user->id_user, $sellers)) {
                array_push($sellers, $user->id_user);
            }
        }

        $buyers = [];

        foreach ($this->data['allUsers'] as $user) {
            foreach ($allTransactions as $transaction) {
                if ($transaction->id_buyer == $user->id_user) {
                    if (!in_array($transaction->id_buyer, $buyers)) {
                        array_push($buyers, $transaction->id_buyer);
                    }
                }
            }
        }

        return response(['transactions' => $allTransactions, 'sellers' => count($sellers), 'buyers' => count($buyers), 'userCount' => count($this->data['allUsers'])]);
    }

    public function getTransactions()
    {
        $allTransactions = DB::table('transactions')
            ->join('sales', 'sales.id_item', 'transactions.id_item')
            ->join('users as buyers', 'buyers.id_user', 'transactions.id_buyer')
            ->join('users as sellers', 'sellers.id_user', 'sales.id_user')
            ->select(
                'transactions.*',
                'sales.*',
                'buyers.id_user as id_buyer',
                'buyers.name as buyer_name',
                'buyers.surname as buyer_surname',
                'buyers.username as buyer_username',
                'sellers.id_user as id_seller',
                'sellers.name as seller_name',
                'sellers.surname as seller_surname',
                'sellers.username as seller_username'
            )->orderBy('id_transaction', 'desc')
            ->get();

        return view('pages.admin.transactions')->with('transactions', $allTransactions);
    }

    public function getUsers()
    {
        $users = '';
        foreach ($this->data['allUsers'] as $user) {
            $users .= View::make('partials.admin_users', ['user' => $user]);
        }
        return response()->json(['users' => $users], 201);
    }

    public function showRegForm()
    {
        return view('pages.admin.register')->with($this->data);
    }

    public function showEditForm()
    {
        return view('pages.admin.edit_user')->with($this->data);
    }

    public function showUsers()
    {
        return view('pages.admin.users');
    }


    public function getUserData(Request $request)
    {

        foreach ($this->data['allUsers'] as $user) {
            if ($user->id_user == $request->id) {
                $this->data['user'] = $user;
                break;
            }
        }

        $userView = '';

        $userView .= View::make('partials.editData', $this->data);



        return response(['user' => $userView]);
    }

    public function saveChanges(FormRequest $request)
    {


        $user = DB::table('users')->where('id_user', '=', $request->id)->first();


        $dataToValidate = [
            'name' => 'required|string|max:255',
            'surname' => 'required|string|max:255',
            'phone' => 'required|string|max:255',
            'address' => 'required|string',
            'country' => 'required|exists:countries,id_country',
            'city' => 'required|int'
        ];

        if ($user->email != $request->email) {
            array_push($dataToValidate, ['email' => 'required|string|email|max:255|unique:users']);
        }

        if ($user->username != $request->username) {
            array_push($dataToValidate, ['username' => 'required|unique:users']);
        }

        $password = '';
        if ($request->password != '') {
            $password = $request->password;
            DB::table('users')
                ->where('id_user', '=', $request->id)
                ->update([
                    'name' => $request->name,
                    'surname' => $request->surname,
                    'username' => $request->username,
                    'email' => $request->email,
                    'phone_number' => $request->phone,
                    'address' => $request->address,
                    'id_city' => $request->city,
                    'password' => Hash::make($password),
                ]);
        } else {
            DB::table('users')
                ->where('id_user', '=', $request->id)
                ->update([
                    'name' => $request->name,
                    'surname' => $request->surname,
                    'username' => $request->username,
                    'email' => $request->email,
                    'phone_number' => $request->phone,
                    'address' => $request->address,
                    'id_city' => $request->city,
                ]);
        }



        if (session('user')) {
            return back()->with(['messages' => 'Changes saved successfully.']);
        }
    }
}


