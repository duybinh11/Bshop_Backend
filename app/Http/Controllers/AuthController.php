<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\User;
use GuzzleHttp\Psr7\Response;
use Illuminate\Auth\Events\Validated;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;

class AuthController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login', 'register_account']]);
    }


    public function login()
    {
        $credentials = request(['email', 'password']);

        if (!$token = auth()->attempt($credentials)) {
            return response()->json(['status' => false, 'error' => 'Unauthorized'], 401);
        }

        return $this->respondWithToken($token);
    }


    public function me()
    {
        return response()->json(['status' => true, 'user' => auth()->user()]);
    }


    public function logout()
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function refresh()
    {
        return $this->respondWithToken(auth()->refresh());
    }


    protected function respondWithToken($token)
    {
        return response()->json([
            'status' => true,
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
            'user' => auth()->user()
        ]);
    }
    public function register_account(Request $request)
    {
        try {
            $request->validate([
                'username' => 'required|unique:users,username',
                'address' => 'required',
                'email' => 'required|email|unique:users,email',
                'password' => 'required|min:6',
                'phone' => 'required|unique:users,phone|min:9'
            ]);

            $user = User::create([
                'username' => $request->username,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'phone' => $request->phone,
                'address' => $request->address,
            ]);

            return Response()->json(['status' => true, 'user' => $user]);
        } catch (ValidationException $e) {
            $errors = $e->validator->errors();
            return Response()->json(['status' => false, 'erorr' => $errors]);
        }
    }
}
