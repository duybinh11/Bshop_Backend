<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class VnPayModel extends Model
{
    use HasFactory;
    protected $table = 'vnpay';
    public $timestamps = false;
    protected $fillable = [
        'id',
        'id_bill',
        'money',
        'bank_code',
        'is_payment',
        'created_at'
    ];
    // public function vnpay()
    // {
    //     return $this->hasOne(VnPayModel::class, 'id_bill', 'id');
    // }
}
