<?php

namespace App\Http\Controllers;

use App\Models\AddressHistoryModel;
use App\Models\BillModel;
use App\Models\CartModel;
use App\Models\OrderModel;
use App\Models\RateItemModel;
use App\Models\StatusTransportModel;
use App\Models\User;
use Carbon\Carbon;
use Exception;
use Faker\Provider\ar_EG\Address;
use GuzzleHttp\Psr7\Response;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;

use function PHPUnit\Framework\isEmpty;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login']]);
    }
    public function address_default()
    {
        $id_user = auth()->user()->id;
        $default = User::with([
            'address_history' => function ($address) {
                $address->where('default', 1);
            }
        ])->find($id_user);
        return Response()->json(['default' => $default->address_history]);
    }

    public function add_address_history($province, $district, $ward, $is_default, $place_detail)
    {
        $user = auth()->user();
        try {
            $address1 = AddressHistoryModel::create([
                'id_user' => $user->id,
                'province' => $province,
                'district' => $district,
                'town' => $ward,
                'place_detail' => $place_detail,
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'default' => $is_default
            ]);
            if (boolval($is_default)) {
                AddressHistoryModel::where('default', 1)->where('id', '<>', $address1->id)->update(['default' => 0]);
            }
            return Response()->json(['status' => true]);
        } catch (Exception $e) {
            return Response()->json(['status' => false, 'erorr' => $e]);
        }
    }
    public function get_address_history()
    {
        $id_user = auth()->user()->id;
        return Response()->json(['address' => AddressHistoryModel::where('id_user', $id_user)->get()]);
    }
    public function set_address_default($id)
    {
        AddressHistoryModel::where('default', 1)->where('id', '<>', $id)->update(['default' => 0]);
        AddressHistoryModel::find($id)->update(['default' => 1]);
    }
    public function add_bill(Request $request)
    {
        try {
            $bill = BillModel::create([
                'price' => $request->money,
                'is_vnpay' => $request->is_vnpay,
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                'id_address_receiver' => $request->id_address
            ]);
            $list_item = json_decode($request->list_json, true);
            //add order
            foreach ($list_item as $item) {
                $itemModel = json_decode($item, true);
                try {
                    OrderModel::create([
                        'id_user' => auth()->user()->id,
                        'id_item' => intval($itemModel['id']),
                        'id_bill' => $bill->id,
                        'amount' => $itemModel['amount'],
                        'money' => $itemModel['amount'] * $itemModel['price'],
                        'fls_percent' => $itemModel['flash_sale'] == null ? null : $itemModel['flash_sale']['percent'],
                        'created_at' => Carbon::now('Asia/Ho_Chi_Minh'),
                    ]);
                } catch (Exception $e) {
                    return Response()->json(['status' => false, 'erorr' => $e . 'ad oer']);
                }
            }
            //delete cart if is cart order . if is cart id cart = 0
            foreach ($list_item as $item) {
                $itemModel = json_decode($item, true);
                if ($itemModel['id_cart'] != 0) {
                    CartModel::find($itemModel['id_cart'])->delete();
                }
            }

            return Response()->json(['status' => true, 'id_bill' => $bill->id]);
        } catch (Exception $e) {
            return Response()->json(['status' => false, 'erorr' => $e]);
        }
    }

    public function get_order_all()
    {
        $user = auth()->user();
        $order = OrderModel::where('id_user', $user->id)->get();
        if ($order->isEmpty()) {
            return Response()->json(['empty' => true]);
        }
        try {
            $bill = BillModel::with(
                [
                    'order' => function ($order) use ($user) {
                        $order->where('id_user', $user->id)->with([
                            'item',
                            'status_transport'
                        ]);
                    },
                    'address_receive'
                ]
            )->orderByDesc('created_at')->get();

            return Response()->json(['status' => true, 'bill' => $bill, 'empty' => false]);
        } catch (Exception $e) {
            return Response()->json(['status' => false, 'erorr' => $e]);
        }
    }
    public function add_rate_item(Request $request)
    {

        $check = OrderModel::find($request->id_order)->update(['is_rate' => 1]);

        if ($check) {
            RateItemModel::create([
                'id_user' => auth()->user()->id,
                'id_item' => $request->id_item,
                'comment' => $request->comment,
                'rate_star' => $request->rate_num,
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh')
            ]);
            return Response()->json(['status' => true,]);
        } else {
            return Response()->json(['status' => false]);
        }
    }


    public function update_received($id_order)
    {
        try {
            $check = StatusTransportModel::create([
                'id_order' => $id_order,
                'place' => 'Đã nhận hàng',
                'created_at' => Carbon::now('Asia/Ho_Chi_Minh')
            ]);
            return Response()->json(['status' => true, 'status_address' => $check]);
        } catch (Exception $e) {
            return Response()->json(['status' => false, 'erorr' => $e]);
        }
    }

    public function get_bill_refresh($id_bill)
    {
        $user = auth()->user();
        try {
            $bill = BillModel::where('id', $id_bill)->with(
                [
                    'order' => function ($order) use ($user) {
                        $order->where('id_user', $user->id)->with([
                            'item',
                            'status_transport'
                        ]);
                    },
                    'address_receive'
                ]
            )->orderByDesc('created_at')->first();
            return Response()->json(['status' => true, 'bill' => $bill]);
        } catch (Exception $e) {
            return Response()->json(['status' => false, 'erorr' => $e]);
        }
    }
}
