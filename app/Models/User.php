<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Tymon\JWTAuth\Contracts\JWTSubject;

class User extends Authenticatable implements JWTSubject
{
    use HasApiTokens, HasFactory, Notifiable;
    protected $table = 'users';

    public $timestamps = false;
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }

    protected $fillable = [
        'username',
        'email',
        'password',
        'img',
        'phone',
        'address',
    ];
    protected $attributes = [
        'img' => null
    ];

    protected $hidden = [
        'password',
    ];

    protected $casts = [
        // 'password' => 'hashed',
    ];
    public function address_history()
    {
        return $this->hasOne(AddressHistoryModel::class, 'id_user', 'id');
    }

    public function cart()
    {
        return $this->hasMany(CartModel::class, 'id_user', 'id');
    }
    public function order()
    {
        return $this->hasMany(OrderModel::class, 'id_user', 'id');
    }
}
