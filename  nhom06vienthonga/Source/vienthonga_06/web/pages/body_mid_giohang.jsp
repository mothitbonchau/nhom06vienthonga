<%-- 
    Document   : body_mid_giohang
    Created on : Oct 6, 2011, 1:30:18 PM
    Author     : HP
--%>

<%@page import="MODEL.POJO.Sieuthi"%>
<%@page import="MODEL.DAO.SieuThiDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/dathang_table.css" rel="stylesheet" type="text/css" />
<div id="body_mid" style="float:left; width:100%;">
    <%
        String tenDangNhap = (String)session.getAttribute("TenDangNhap");
    %>
    <!--Begin content-->
    <div id="content_giohang">
        <table width="100%" cellpadding="3" cellspacing="3" align="center">
            <tr>

            <td style="width:100%">
                <table cellpadding="3" cellspacing="3" border="0" class="dathang_table">
                    <tr>
                    <td colspan="3" class="TextTitle"><div align="left" "><strong>ĐẶT MUA ONLINE</strong></div></td>
                    </tr>
                    <tr>
                    
                    <td colspan="3">
                        Vui lòng điền đầy đủ & chính xác các thông tin bên dưới để chúng tôi phục vụ bạn tốt hơn.<% if(tenDangNhap == null){%> Đã có tài khoản? <a href="view?task=DangNhap">Đăng nhập tại đây!</a>    <% } %>               
                    </td>
                    
                    </tr>
                    <tr>
                    <td style="border-right:1px solid #d7d7d7; width:270px;" valign="top"> 




                        <div id="dialog_login" title="Đăng nhập" style="display:none;overflow:hidden;">

                            <table cellpadding="3" cellspacing="3" border="0" class="dathang_table" style="height:180px;">                
                                <tr>

                                <td colspan="2">
                                    Email            </td>
                                </tr>
                                <tr>
                                <td colspan="2">
                                <input name="txtLoginEmail1" type="text" id="txtLoginEmail1" style="width:200px;" /><span style="color:Red;">*</span>            </td>
                                </tr>

                                <tr>
                                <td colspan="2">
                                    Mật khẩu            </td>
                                </tr>
                                <tr>
                                <td colspan="2">
                                <input name="txtLoginPW1" type="password" id="txtLoginPW1" style="width:200px;" /><span style="color:Red;">*</span>            </td>
                                </tr>
                                <tr>
                                <td style="color:Red;" colspan="2">
                                <span id="lblStatus"></span>            </td>
                                </tr>
                                <tr>
                                <td>&nbsp;            </td>

                                <td style="text-align:center">                    
                                    <input type="submit" name="btLogin2" value="" onclick="javascript:dologin();" id="btLogin2" class="btOnePageLogin" />            </td>
                                </tr>
                            </table>
                        </div>                    

    
    <table cellpadding="3" cellspacing="3" border="0" class="dathang_table">
        <tr>
            <td colspan="2" class="TextTitleSmall">
                <img src="images/linhtinh/OnePageCheckOut_1.jpg" style="text-align:left; vertical-align:middle;" alt="" /> THÔNG TIN ĐẶT HÀNG          
            </td>
        </tr>
        
        <tr>
        <td colspan="2">
            Họ tên người đặt hàng <span style="color:Red;">*</span>           
        </td>
        </tr>
        <tr>
        <td colspan="2">
            <input name="txtHoTen" type="text" value="<%= session.getAttribute("TenNguoiDung") %>" id="txtHoTen" class="text" onblur="if(this.value=='') this.value='Họ và tên';" onfocus="if(this.value=='Họ và tên') this.value='';" style="width:250px;" />            
        </td>
        </tr>
        <tr>
        <td>
            CMND/Passport            </td>
        <td>            </td>
        </tr>
        <tr>

        <td>
            <input name="txtCMND" type="text" id="txtCMND" class="text" />            </td>
        <td>                    
        </td>
        </tr>
        <tr>
        <td>
            Email <span style="color:Red;">*</span>            </td>
        <td>
            Điện thoại <span style="color:Red;">*</span>            </td>
        </tr>
        <tr>

        <td>
            <input name="txtEmail" type="text" id="txtEmail" class="text" value="<%= session.getAttribute("Email") %>"/>            
        </td>
        <td>
            <input name="txtDienThoai" type="text" id="txtDienThoai" class="text" style="width:80px;" />          
        </td>
        </tr>
        <tr>
        <td colspan="2">
            Địa chỉ người đặt hàng <span style="color:Red;">*</span>        
        </td>
        </tr>
        <tr>
        <td colspan="2">
            <input name="txtDiaChi" type="text" id="txtDiaChi" class="text" style="width:250px;" />            </td>
        </tr>
        
        <tr>
        <td colspan="2">
        <input id="chkTaoTaiKhoan" type="checkbox" name="chkTaoTaiKhoan" /><label for="chkTaoTaiKhoan">Tạo tài khoản trên VienThongA.com</label>            </td>
        </tr>
        <tr>
            <td colspan="2" style="color:#b34040;">
                <input id="chkNguoiNhanHang" type="checkbox" name="chkNguoiNhanHang" checked="checked" onclick="javascript:thongtinnhanhang();" /><label for="chkNguoiNhanHang">NGƯỜI NHẬN HÀNG GIỐNG ĐẶT HÀNG</label>           
            </td>
        </tr>
    </table>                    
    </td>
<td style="border-right:0px solid #d7d7d7; width:290px;" valign="top"> 

    <div id="dialog1" title="Giao hàng nội thành" style="display:none;overflow:hidden;">
        <iframe src="html/phivanchuyen.html" style="width:500px; height:300px; border:0;" frameborder=0  SCROLLING=NO >	</iframe>
    </div>

    <div id="dialog2" title="Giao hàng nội thành" style="display:none;overflow:hidden;">
        <iframe src="html/phivanchuyen.html" style="width:500px; height:300px; border:0;" frameborder=0  SCROLLING=NO >	</iframe>
    </div>

    <div id="dialog3" title="Chuyển khoản ngân hàng" style="display:none;overflow:hidden;">
        <iframe src="html/thanhtoannganhang.html" style="width:700px; height:800px; border:0;" frameborder=0  SCROLLING=YES >	</iframe>
    </div>

    <div id="dialog4" title="Chuyển tiền qua bưu điện" style="display:none;overflow:hidden;">
        <iframe src="html/thanhtoanbuudien.html" style="width:700px; height:700px; border:0;" frameborder=0  SCROLLING=YES >	</iframe>
    </div>

    <div id="dialog5" title="Thanh toán khi giao nhận" style="display:none;overflow:hidden;">
        <iframe src="html/thanhtoantienmat.html" style="width:700px; height:300px; border:0;" frameborder=0  SCROLLING=YES >	</iframe>
    </div>


    <table cellpadding="3" cellspacing="3" border="0" class="dathang_table">
        <tr>
            <td colspan="2" class="TextTitleSmall">
                <img src="images/linhtinh/OnePageCheckOut_2.jpg" style="text-align:left; vertical-align:middle;" alt="" />HÌNH THỨC GIAO NHẬN            </td>
            </tr>
        <tr>
        <td colspan="2">
            <b>
                <span style="display:inline-block;border-width:0px;width:200px;"><label for="HinhThucGiaoNhan_rdoDenKhoOnline">Đến siêu thị nhận hàng</label></span>                </b><br />                     
        </td>            
        </tr>

        <tr>
        <td colspan="2">
            <b>
                <span class="DropDownList" style="display:inline-block;border-width:0px;width:200px;"><label for="HinhThucGiaoNhan_rdoGiaoHangTanNoi">Giao hàng tận nơi</label></span>                </b>
            <br />            
            <b>&nbsp;&nbsp;Nội thành:</b>&nbsp;từ 1 - 2 ngày 
            <p></p>
            <b>&nbsp;&nbsp;Tỉnh thành khác:</b>&nbsp;từ 3 - 4 ngày   </td>
        </tr>

        <tr>
        <td colspan="2" class="TextTitleSmall">
            <img src="images/linhtinh/OnePageCheckOut_3.jpg" style="text-align:left; vertical-align:middle;" alt="" />HÌNH THỨC THANH TOÁN            </td>
        </tr>


        <tr>
        <td colspan="2" style="text-align:left">
        <span class="DropDownList" style="display:inline-block;border-width:0px;width:200px;"><input id="HinhThucGiaoNhan_rdoChuyenKhoanNH" type="radio" name="HinhThucGiaoNhan$Group_GiaoNhan" value="rdoChuyenKhoanNH" checked="checked" /><label for="HinhThucGiaoNhan_rdoChuyenKhoanNH">Chuyển khoản ngân hàng</label></span>(<a href="javascript:showdialog('#dialog3',700,800,'Chuyển khoản ngân hàng');">xem</a>)            </td>
</tr>

<tr>
<td colspan="2" style="text-align:left">

<span class="DropDownList" style="display:inline-block;border-width:0px;width:240px;"><input id="HinhThucGiaoNhan_rdoThanhToanVNBC" type="radio" name="HinhThucGiaoNhan$Group_GiaoNhan" value="rdoThanhToanVNBC" /><label for="HinhThucGiaoNhan_rdoThanhToanVNBC">Thanh toán Online - VNBC (NH Đông Á)</label></span>            </td>
</tr>
<tr>
<td colspan="2" style="text-align:left">
<span class="DropDownList" style="display:inline-block;border-width:0px;width:200px;"><input id="HinhThucGiaoNhan_rdoThanhToanKhiGiaoNhan" type="radio" name="HinhThucGiaoNhan$Group_GiaoNhan" value="rdoThanhToanKhiGiaoNhan" /><label for="HinhThucGiaoNhan_rdoThanhToanKhiGiaoNhan">Thanh toán sau khi giao nhận</label></span>(<a href="javascript:showdialog('#dialog5',710,300,'Thanh toán khi giao nhận');">xem</a>)            </td>
</tr>
</table>                    </td>
<td style="width:auto;" valign="top"> 


    <div style="float:left;width:auto; border:3px solid #d7d7d7;">
        <table cellpadding="3" cellspacing="3" width="100%" class="dathang_table" style="background-color:#fffeee;">
            <tr>
            <td colspan="2" class="TextTitleSmall"> ĐƠN HÀNG CỦA BẠN </td>
            </tr>
            <tr>
                <td id="DonHangCuaBan_tdDetailOrder" colspan="2">
                    <div id="DonHangCuaBan_div2">
                        <table width="100%" border="0"  cellspacing="0" cellpadding="0" style="font-family:Arial,Helvetica,sans-serif;font-size:11px;">
                            <tr>
                                <%                                    
                                    if(tenDangNhap == null)
                                   {
                                %>
                                <td id="DonHangCuaBan_tdDetailOrder" colspan="2">
                                    <div class="orderNoItem" style="color:red;">Giỏ hàng của bạn hiện tại không có sản phẩm nào. Vui lòng chọn sản phẩm cần mua !</div>
                                </td>
                                <%
                                   }
                                    else
                                   {
                                %>
                                <td>
                                    <table class="chitiet_giohang" cellspacing="0" cellpadding="2" align="Center" rules="rows" border="0" id="DonHangCuaBan_DataGrid1" style="border-color:White;border-width:0px;font-size:11px;width:100%;border-collapse:collapse;">
                                        <tr style="color:Black;background-color:#CCCCCC;font-weight:bold;height:10px;">
                                            <td>Xóa</td>
                                            <td>Sản phẩm</td>
                                            <td>SL</td>
                                            <td>Thành tiền</td>

                                        <form id="testfrm" action="" method="post">
                                            <tr style="background-color:White;height:10px;">
                                                <td style="width:10px;"><input id="DonHangCuaBan_DataGrid1_ctl02_chkDel" onclick="test();" type="checkbox" name="chkDel" />   </td>
                                                <td><span id="DonHangCuaBan_DataGrid1_ctl02_lblProName" style="display:inline-block;width:167px;"> <%= request.getAttribute("TenSanPham") %> </span> </td>
                                                <td><input name="txtSL" type="text" value="1" maxlength="4" id="txtSL" style="width:50px;" />
                                                <span id="DonHangCuaBan_DataGrid1_ctl02_RequireTo" style="color:Red;"></span> </td>
                                <td><span id="lblTT" style="color:Red;"><%= request.getAttribute("ThanhTien") %></span> </td>
                                            </tr>
                                        </form>
                                    </table>
                                </td>
                                 <%
                                   }                                   
                                %>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <%                                    
                        if(tenDangNhap != null)
                       {
                    %>
                    <input type="image" name="btXoa" id="btXoa" src="images/linhtinh/OnePageCheckOut_Xoa.jpg" style="border-width:0px; height: 20px;" />
                    <input type="image" name="btCapNhat" id="btCapNhat" src="images/linhtinh/CapNhat.JPG" style="border-width:0px; height: 20px;" />  
                    <%                                    
                         }
                    %>
                </td>
            </tr>
            <tr id="DonHangCuaBan_tdBuyWhenNoItem" style="display:none;">
            <td>&nbsp;</td>
            <td align="left"><input type="image" name="btnBuyWhenNoItem" id="btnBuyWhenNoItem" src="images/linhtinh/OnePageCheckOut_tieptucmuahang.jpg" style="border-width:0px;" />
                <br />      </td>
            </tr>
            <tr>
            <td colspan="2" style="color:#003466;font-weight:bold;"> Tổng giá trị đơn hàng&nbsp;<span style="font-weight:bold;color:#cc3333;">29,498,000 VNĐ</span> </td>
            </tr>
            <tr>
            <td style="text-align:right; width:40%;" > Số Tiền giảm giá </td>
            <td><input name="txtVIPCard" type="text" id="DonHangCuaBan_txtVIPCard" class="text" />      </td>
            </tr>
            <tr>
            <td><span style="color:#003466;font-weight:bold;">Tổng Tiền :</span></td>
            <td>&nbsp;<span style="color:#003466;font-weight:bold;">&nbsp;<span style="font-weight:bold;color:#cc3333;">29,498,000 VNĐ</span></span> </td>
            </tr>


            <tr>
            <td colspan="2" style="text-align:left;">&nbsp;</td>
            </tr>


            <tr>
            <td valign="top" colspan="2">&nbsp;</td>
            </tr>
            <tr>
            <td colspan="2"><input id="DonHangCuaBan_chkAgree" type="checkbox" name="DonHangCuaBan$chkAgree" checked="checked" />
            <label for="chkAgree">Tôi đã đọc và đồng ý với</label>
            &nbsp;<a href="http://www.vienthonga.com/template/chinhsach.pdf" target="_blank">Quy định chính sách</a>&nbsp;của VienThongA.com </td>
            </tr>
            <tr>
            <td  colspan="2"><span id="DonHangCuaBan_lblStatus" style="color:Red;font-weight:bold;"></span> </td>
            </tr>
            <tr>
            <td colspan="2" style="text-align:center;"><input type="image" name="btnBuyWhenNoItem" id="btnBuyWhenNoItem" src="images/linhtinh/DM.JPG" style="border-width:0px; height: 40px;" />      </td>
            </tr>
        </table>
    </div>
    <div style="display:none;">

        <div id="DonHangCuaBan_div1"></div>
    </div>                    </td>
</tr>
</table>        
</td>

</tr>
</table>

</div>
</div>