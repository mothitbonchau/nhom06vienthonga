<%-- 
    Document   : body_mid_dangky
    Created on : Oct 1, 2011, 10:05:06 AM
    Author     : thien-anh
--%>

<script language="javascript">
    function TestDangKy()
    {
       //Kiểm tra tên đăng nhập
        myformobj = document.formDangKy
        if(myformobj.txtTenDangNhap.value == '')
        {
            var x = document.getElementById('txtTenDangNhapError')
            x.style.visibility = 'visible'
            var y = document.getElementById('txtTenDangNhapOk')
            y.style.visibility = 'hidden'
            window.alert('Tên đăng nhập trống !');
            myformobj.txtTenDangNhap.focus();
            return false;
        }
        var x= document.getElementById('txtTenDangNhapError')
        x.style.visibility = 'hidden'
        var y= document.getElementById('txtTenDangNhapOk')
        y.style.visibility = 'visible'
        
        //Kiểm tra Mật Khẩu không được trống
        if(myformobj.txtPass.value=='' )
        {
            var x =document.getElementById('txtPassError')
            x.style.visibility='visible'
            var y = document.getElementById('txtPassOk')
            y.style.visibility='hidden'
            window.alert('Mật khẩu trống !');
            myformobj.txtPass.focus();
            return false;
        }
        var x =document.getElementById('txtPassError')
        x.style.visibility='hidden'
        var y = document.getElementById('txtPassOk')
        y.style.visibility='visible'

        //Kiểm tra mật khẩu không được ít hơn 6 ký tự
        if(myformobj.txtPass.value.length<5)
        {
            var x =document.getElementById('txtPassError')
            x.style.visibility='visible'
            var y = document.getElementById('txtPassOk')
            y.style.visibility='hidden'
            window.alert('Nhập ít nhất 6 ký tự !');
            myformobj.txtPass.focus();
            return false;
        }
        var x =document.getElementById('txtPassError')
        x.style.visibility='hidden'
        var y = document.getElementById('txtPassOk')
        y.style.visibility='visible'

        //Kiểm tra Mật Khẩu Nhập Lại
        if(myformobj.txtAgainPass.value != myformobj.txtPass.value)
        {
            var x =document.getElementById('txtAgainPassError')
            x.style.visibility ='visible'
            var y = document.getElementById('txtAgainPassOk')
            y.style.visibility='hidden'
            window.alert('Mật khẩu gõ lại không đúng');
            myformobj.txtAgainPass.focus();
            return false;
        }
        var x =document.getElementById('txtAgainPassError')
        x.style.visibility='hidden'
        var y = document.getElementById('txtAgainPassOk')
        y.style.visibility='visible'
        
        //Kiểm tra Họ tên không được trống
        if(myformobj.txtName.value=='')
        {
            var x = document.getElementById('txtNameError')
            x.style.visibility='visible'
            var y = document.getElementById('txtNameOk')
            y.style.visibility='hidden'
            window.alert('Tên khách hàng trống.');
            myformobj.txtName.focus();
            return false;
        }

        var x= document.getElementById('txtNameError')
        x.style.visibility='hidden'
        var y=document.getElementById('txtNameOk')
        y.style.visibility='visible'

        
        //Kiểm tra Email không được trống
        if(myformobj.txtEmail.value=='')
        {
            var x = document.getElementById('txtEmailError')
            x.style.visibility='visible'
            var y = document.getElementById('txtEmailOk')
            y.style.visibility='hidden'
            window.alert('Email trống.');
            myformobj.txtEmail.focus();
            return false;
        }
        var x= document.getElementById('txtEmailError')
        x.style.visibility='hidden'
        var y=document.getElementById('txtEmailOk')
        y.style.visibility='visible'              

        //Kiểm tra CMND không được trống
        if(myformobj.txtCMND.value=='')
        {
            var x = document.getElementById('txtCMNDError')
            x.style.visibility='visible'
            var y = document.getElementById('txtCMNDOk')
            y.style.visibility='hidden'
            window.alert('CMND trống.');
            myformobj.txtCMND.focus();
            return false;
        }
        var x= document.getElementById('txtCMNDError')
        x.style.visibility='hidden'
        var y=document.getElementById('txtCMNDOk')
        y.style.visibility='visible'
        
        //Kiểm tra Địa Chỉ không được trống
        if(myformobj.txtDiaChi.value=='')
        {
            var x = document.getElementById('txtDiaChiError')
            x.style.visibility='visible'
            var y = document.getElementById('txtDiaChiOk')
            y.style.visibility='hidden'
            window.alert('Địa chỉ trống.');
            myformobj.txtDiaChi.focus();
            return false;
        }
        var x= document.getElementById('txtDiaChiError')
        x.style.visibility='hidden'
        var y=document.getElementById('txtDiaChiOk')
        y.style.visibility='visible'

        return true
    }
</script>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/maintabletitle.css" rel="stylesheet" type="text/css" />
<div id="body_mid" style="float:left; width:60%;">

    <form action="DangKy_Controller?Action=Luu" name="formDangKy" method="post" id="formDangKy" onsubmit='return TestDangKy()'>
        <table border="0" cellpadding="0" cellspacing="0" width="500px">
            <tbody>
                <tr>
                    <td height="42" class="maintabletitle">
                        <span class="titleSPChitiet" >ĐĂNG KÝ TÀI KHOẢN</span>
                    </td>
                </tr>
                <tr>
                    <td class="graytdborder">
                        <table border="0" cellpadding="0" cellspacing="0" class="card" style="background-color: #ffffff">
                            <tbody>
                                <tr>
                                    <td align="right" style="width: 202px; height: 19px"> </td>
                                    <td style="color: #ff0000; height: 19px"> </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 202px;">
                                        Tên Đăng Nhập
                                        <span class="style23" style="color: #ff0000">(*)     </span>
                                    </td>
                                    <td>
                                        <input name="txtTenDangNhap" type="text" id="txtTenDangNhap" style="width:213px;"/>
                                        <span id='txtTenDangNhapError' style='visibility:hidden' class='hidden'>&nbsp;&nbsp;<img src='images/linhtinh/error.jpg' width='16' height='16' /> </span>
                                        <span id="txtTenDangNhapOk" style="visibility: hidden" class="hidden">&nbsp;&nbsp;<image src="images/linhtinh/ok.jpg" width='16' height='16' /> </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 202px; height: 45px;">
                                        Mật khẩu 
                                        <span class="style23" style="color: #ff0000">(*)     </span>
                                    </td>
                                    <td style="height: 45px">
                                        <input name="txtPass" type="password" id="txtPass" style="width:213px;"/>
                                        <span id='txtPassError' style='visibility:hidden' class='hidden'>&nbsp;&nbsp;<img src='images/linhtinh/error.jpg' width='16' height='16' /> </span>
                                        <span id="txtPassOk" style="visibility: hidden" class="hidden">&nbsp;&nbsp;<image src="images/linhtinh/ok.jpg" width='16' height='16' /> </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 202px;">
                                        Nhập Lại Mật khẩu 
                                        <span class="style23" style="color: #ff0000">(*)     </span>
                                    </td>
                                    <td >
                                        <input name="txtAgainPass" type="password" id="txtAgainPass" style="width:213px;"/>
                                        <span id='txtAgainPassError' style='visibility:hidden' class='hidden'>&nbsp;&nbsp;<img src='images/linhtinh/error.jpg' width='16' height='16' /> </span>
                                        <span id="txtAgainPassOk" style="visibility: hidden" class="hidden">&nbsp;&nbsp;<image src="images/linhtinh/ok.jpg" width='16' height='16' /> </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 202px; height: 45px;">
                                        Họ tên  
                                        <span class="style23" style="color: #ff0000">(*)  </span>
                                    </td>
                                    <td>
                                        <input name="txtName" type="text" id="txtName" style="width:213px;"/>
                                        <span id='txtNameError' style='visibility:hidden' class='hidden'>&nbsp;&nbsp;<img src='images/linhtinh/error.jpg' width='16' height='16' /> </span>
                                        <span id="txtNameOk" style="visibility: hidden" class="hidden">&nbsp;&nbsp;<image src="images/linhtinh/ok.jpg" width='16' height='16' /> </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 202px;">
                                        Email
                                        <span class="style23" style="color: #ff0000"> (*)    </span>
                                    </td>
                                    <td>
                                        <input name="txtEmail" type="text" id="txtEmail" style="width:213px;"/>
                                        <span id='txtEmailError' style='visibility:hidden' class='hidden'>&nbsp;&nbsp;<img src='images/linhtinh/error.jpg' width='16' height='16' /> </span>
                                        <span id="txtEmailOk" style="visibility: hidden" class="hidden">&nbsp;&nbsp;<image src="images/linhtinh/ok.jpg" width='16' height='16' /> </span>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td align="right" style="width: 202px; height: 45px;">
                                        CMND
                                        <span class="style23" style="color: #ff0000">(*)     </span>
                                    </td>
                                    <td>
                                        <input name="txtCMND" type="text" id="txtCMND" style="width:213px;"/>
                                        <span id='txtCMNDError' style='visibility:hidden' class='hidden'>&nbsp;&nbsp;<img src='images/linhtinh/error.jpg' width='16' height='16' /> </span>
                                        <span id="txtCMNDOk" style="visibility: hidden" class="hidden">&nbsp;&nbsp;<image src="images/linhtinh/ok.jpg" width='16' height='16' /> </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right"> </td>
                                    <td>
                                        <span id="lblStatus"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 202px;"> Điện Thoại </td>
                                    <td>
                                        <input name="txtDienThoai" type="text" id="txtDienThoai" style="width:213px;"/>
                                        <span id='txtDienThoaiError' style='visibility:hidden' class='hidden'>&nbsp;&nbsp;<img src='images/linhtinh/error.jpg' width='16' height='16' /> </span>
                                        <span id="txtDienThoaiOk" style="visibility: hidden" class="hidden">&nbsp;&nbsp;<image src="images/linhtinh/ok.jpg" width='16' height='16' /> </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 202px; height: 45px;">
                                        Địa Chỉ
                                        <span class="style23" style="color: #ff0000">(*)     </span>
                                    </td>
                                    <td>
                                        <input name="txtDiaChi" type="text" id="txtDiaChi" style="width:213px;"/>
                                        <span id='txtDiaChiError' style='visibility:hidden' class='hidden'>&nbsp;&nbsp;<img src='images/linhtinh/error.jpg' width='16' height='16' /> </span>
                                        <span id="txtDiaChiOk" style="visibility: hidden" class="hidden">&nbsp;&nbsp;<image src="images/linhtinh/ok.jpg" width='16' height='16' /> </span>
                                    </td>
                                </tr>                      
                                <tr>
                                    <td align="right" style="width: 202px;">  </td>
                                    <td>
                                        <input type="image" name="btnDangKy" id="btnDangKy" src="images/linhtinh/dangky.gif" style="border-width:0px;height: 25px;"/>
                                        <input type="image" name="btnXoa" id="btnXoa" src="images/linhtinh/xoa_btn.gif" style="border-width:0px;height: 25px;"/>
                                    </td>
                                </tr>
                            </tbody> 
                        </table>
                    </td>
                </tr>        
            </tbody>
        </table>
    </form>
</div>
