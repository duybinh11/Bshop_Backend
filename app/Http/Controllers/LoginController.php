<?php

namespace App\Http\Controllers;

use App\Models\User;
use GuzzleHttp\Psr7\Response;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;

class LoginController extends Controller
{


   

    public function login(Request $request)
    {
        $user = Auth::attempt(['email' => $request->email, 'password' => ($request->password)]);
        if ($user) {
            $userData = Auth::user();
            return Response()->json(['status' => true, 'user' => $userData]);
        } else {
            return Response()->json(['status' => false]);
        }
    }

    public function login_token(Request $request)
    {
        $user = User::where('token', $request->token)->first();
        if ($user != null) {
            return Response()->json(['status' => true, 'user' => $user]);
        } else {
            return Response()->json(['status' => false]);
        }
    }


}
