<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;

class AuthController extends BaseController
{
    public function showLogin()
    {
        return view('pages.login')->with($this->data);
    }

    public function login(Request $request)
    {
        $credentials = $request->only('email', 'password');
        $user = DB::table('users')->where('username', '=', $credentials["email"])->orWhere('email', '=', $credentials["email"])->first();
        if ($user) {
            if (password_verify($credentials["password"], $user->password)) {
                $request->session()->put('user', $user);
                if ($user->id_role == 1) {
                    return redirect('/landing');
                }
                return redirect('/');
            }
        }
        return redirect()->back()->withErrors(['errors' => 'Invalid credentials.']);

    }

    public function logout()
    {
        session()->forget('user');
        return redirect('/');
    }


    public function showRegistration()
    {
        $allCountries = DB::table('countries')->get();
        $this->data['allCountries'] = $allCountries;
        return view('pages.register')->with($this->data);
    }

    public function getCities(Request $request)
    {
        $cities = DB::table('cities')->where('id_country', '=', $request->id)->get();
        return $cities;
    }

    public function register(FormRequest $request)
    {

        $request->validate([
            'name' => 'required|string|max:255',
            'surname' => 'required|string|max:255',
            'phone' => 'required|regex:/^([0-9\s\-\+\(\)]*)$/|min:10|max:255',
            'address' => 'required|string',
            'username' => 'required|unique:users',
            'country' => 'required|exists:countries,id_country',
            'city' => 'required|int',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8|confirmed',
        ]);


        DB::table('users')->insert([
            'name' => $request->name,
            'surname' => $request->surname,
            'phone_number' => $request->phone,
            'address' => $request->address,
            'id_city' => $request->city,
            'email' => $request->email,
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'id_role' => 2
        ]);

        if (session('user')) {
            return back()->with(['messages' => 'A user account has been created successfully.']);
        }

        return redirect('/login')->with(['messages' => 'Your account has been created successfully. You may log in now.']);



    }
}
