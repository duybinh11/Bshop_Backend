<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BillModel extends Model
{
    use HasFactory;
    protected $table = 'bill_item';
    public $timestamps = false;
    protected $attributes = [
        'is_payment' => 0,
    ];
    protected $fillable = [
        'is_payment',
        'id_address_receiver',
        'price',
        'is_vnpay',
        'time_pay',
        'created_at'
    ];
    protected $hidden = [
        'id_address_history',
        'id_user',
    ];
    public function order()
    {
        return $this->hasMany(OrderModel::class, 'id_bill', 'id');
    }
    public function address_receive()
    {
        return $this->belongsTo(AddressHistoryModel::class, 'id_address_receiver', 'id');
    }
    public function vnpay()
    {
        return $this->hasOne(VnPayModel::class, 'id_bill', 'id');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'id_user', 'id');
    }
}
