<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Register Email</title>
</head>
<body>
<table>
    <tr>
        <td>Dear {{$name}}</td>
    </tr>
    <tr>
        <td>&nbsp;&nbsp;</td>
    </tr>
    <tr>
        <td>Please Click on below link to active your account: </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td><a href="{{url('confirm/'.$code)}}">Confirm Code</a></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Password: *****(as chosen bye you)</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>Thanks & Regards, </td>
    </tr>
    <tr>
        <td>E-com Website</td>
    </tr>

</table>
</body>
</html>
