<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>
    <table width="700px">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><img src="{{asset('front/images/home/logo.png')}}" alt=""> </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Name: {{$name}}</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Thank you for Shopping with us. Your order Details are as below:- </td>
        </tr>
        <tr>
            <td>Order No {{$order_id}}</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td>
                <table width="95%" cellpadding="5" cellspacing="5" bgcolor="#f7f4f4">
                    <tr bgcolor="#cccccc">
                        <td>Product Name</td>
                        <td>Product Code</td>
                        <td>Size</td>
                        <td>Color</td>
                        <td>Quantity</td>
                        <td>Unit Price</td>
                    </tr>
                    @foreach($productDetails['orders'] as $product)
                        <tr>
                            <td>{{$product['product_name']}}</td>
                            <td>{{$product['product_code']}}</td>
                            <td>{{$product['product_size']}}</td>
                            <td>{{$product['product_color']}}</td>
                            <td>{{$product['product_qty']}}</td>
                            <td>$ {{$product['product_price']}}</td>
                        </tr>
                     @endforeach
                    <tr>
                        <td colspan="5" align="right" >Shipping Charges </td><td>$ {{$productDetails['shipping_charges']}}</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" >Coupon Discount </td><td> $ {{$productDetails['coupon_amount']}}</td>
                    </tr>
                    <tr>
                        <td colspan="5" align="right" >Grand Total </td><td>$ {{$productDetails['grand_total']}}</td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
        </tr>

        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td width="50%">
                            <table>
                                <tr>
                                    <td><strong>Bill To :-</strong></td>
                                </tr>
                                <tr>
                                    <td>{{$userDetails['name']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$userDetails['address']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$userDetails['city']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$userDetails['state']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$userDetails['country']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$userDetails['pincode']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$userDetails['mobile']}}</td>
                                </tr>

                            </table>
                        </td>
                        <td width="50%">
                            <table>
                                <tr>
                                    <td><strong>Ship To :-</strong></td>
                                </tr>
                                <tr>
                                    <td>{{$productDetails['name']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$productDetails['address']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$productDetails['city']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$productDetails['state']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$productDetails['country']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$productDetails['pincode']}}</td>
                                </tr>
                                <tr>
                                    <td>{{$productDetails['mobile']}}</td>
                                </tr>

                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>

        <tr>
            <td>&nbsp;</td>
        </tr>

        <tr><td>For any enquiries, you can contact us at <a href="mailto:info@ecom-website.com">info@ecom-website.com</a></td></tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Regards, <br> Team E-com</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
    </table>
</body>
</html>
