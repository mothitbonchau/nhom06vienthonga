<%-- 
    Document   : body_mid_giohang
    Created on : Oct 6, 2011, 1:30:18 PM
    Author     : HP
--%>

<%@page import="MODEL.DAO.GiamGiaDAO"%>
<%@page import="MODEL.POJO.Giamgia"%>
<%@page import="MODEL.DAO.NguoiDungDAO"%>
<%@page import="MODEL.POJO.Nguoidung"%>
<%@page import="MODEL.DAO.HinhThucThanhToanDAO"%>
<%@page import="MODEL.POJO.Hinhthucthanhtoan"%>
<%@page import="MODEL.DAO.SanPhamDAO"%>
<%@page import="MODEL.POJO.Giohang"%>
<%@page import="MODEL.DAO.GioHangDAO"%>
<%@page import="MODEL.POJO.Sieuthi"%>
<%@page import="MODEL.DAO.SieuThiDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/dathang_table.css" rel="stylesheet" type="text/css" />

<script language="javascript">
    function Test()
    {
        //Kiểm tra người nhận hàng giống người đặt hàng đã check chưa
        myformobj = document.formDatHang
        if(myformobj.chkNguoiNhanHang.checked == false)
            {
                window.alert("Bạn chưa check Người Nhận Hàng !");
                return false;
            }        
        //Kiểm tra đã chọn Tôi đồng ý chưa
        if(myformobj.chkAgree.checked == false )
            {
                window.alert("Bạn chưa check chọn đồng ý các điều khoản !");
                return false;
            }
        return true
    }
    
</script>


<div id="body_mid" style="float:left; width:100%;">
    <%
        String tenDangNhap = (String) session.getAttribute("TenDangNhap");
        String maNguoiDung = (String) session.getAttribute("MaNguoiDung");
        //Tính tổng tiền
        List<Giohang> listGioHang = GioHangDAO.LayListGioHangTheoMaNguoiDung(maNguoiDung);
        session.setAttribute("listGioHang", listGioHang);
        float TongTien = GioHangDAO.TongTienGioHang(maNguoiDung);
        Nguoidung nd = NguoiDungDAO.LayNguoiDungTheoMa(maNguoiDung);
        //Tính tiền giảm giá
        float TienGiamGia = 0;
        String msp;
        for (int i = 0; i < listGioHang.size(); i++) {
            msp = listGioHang.get(i).getSanpham().getMaSanPham();
            Giamgia gg = GiamGiaDAO.LayTienGiamGiaTheoMaSanPham(msp);
            if (gg != null) {
                TienGiamGia += gg.getGiaGiam();
            }
        }
        session.setAttribute("TienGiamGia", TienGiamGia);
        //Tính thành tiền
        float ThanhTien = TongTien - TienGiamGia;
        session.setAttribute("ThanhTien", ThanhTien);
    %>
    <!--Begin content-->
    <form id="formDatHang" name="formDatHang" method="post" action="process?task=GioHang" onsubmit="return Test()">
    <div id="content_giohang">
        <table width="100%" cellpadding="3" cellspacing="3" align="center">
            <tr>
            <td style="width:100%">
                <table cellpadding="3" cellspacing="3" border="0" class="dathang_table">
                    <tr>
                    <td colspan="3" class="TextTitle"><div align="left" ><strong>ĐẶT MUA ONLINE</strong></div></td>
                    </tr>
                    <tr>

                    <td colspan="3">
                        Vui lòng điền đầy đủ & chính xác các thông tin bên dưới để chúng tôi phục vụ bạn tốt hơn.<% if (tenDangNhap == null) {%> Đã có tài khoản? <a href="view?task=DangNhap">Đăng nhập tại đây!</a>    <% }%>               
                    </td>

                    </tr>
                    <tr>
                    <td style="border-right:1px solid #d7d7d7; width:270px;" valign="top"> 



                        
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
                                    <input name="txtHoTen" type="text" value="<%= nd.getTenNguoiDung()%>" id="txtHoTen" class="text" onblur="if(this.value=='') this.value='Họ và tên';" onfocus="if(this.value=='Họ và tên') this.value='';" style="width:250px;" />            
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
                                    <input name="txtEmail" type="text" id="txtEmail" class="text" value="<%= nd.getEmail()%>"/>            
                                </td>
                                <td>
                                    <input name="txtDienThoai" type="text" id="txtDienThoai" class="text" value="<%= nd.getDienThoai()%>" style="width:80px;" />          
                                </td>
                                </tr>
                                <tr>
                                <td colspan="2">
                                    Địa chỉ người đặt hàng <span style="color:Red;">*</span>        
                                </td>
                                </tr>
                                <tr>
                                <td colspan="2">
                                    <input name="txtDiaChi" type="text" id="txtDiaChi" class="text" value="<%= nd.getDiaChi()%>" style="width:250px;" />            </td>
                                </tr>

                                <tr>
                                <td colspan="2" style="color:#b34040;">
                                <input id="chkNguoiNhanHang" type="checkbox" name="chkNguoiNhanHang" checked="checked" onclick="" /><label for="chkNguoiNhanHang">NGƯỜI NHẬN HÀNG GIỐNG ĐẶT HÀNG</label>           
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

                            <%
                                List<Hinhthucthanhtoan> list = HinhThucThanhToanDAO.LayListHinhThucThanhToan();
                                for (int i = 0; i < list.size(); i++) {
                            %>
                            <tr>
                            <td colspan="2" style="text-align:left">
                            <span class="DropDownList" style="display:inline-block;border-width:0px;width:200px;"><input id="rdoHinhThucThanhToan" type="radio" name="rdoHinhThucThanhToan" checked="checked" value="<%= list.get(i).getMaHinhThucThanhToan()%>" /><label for="HinhThucGiaoNhan_rdoChuyenKhoanNH"><%= list.get(i).getTenHinhThucThanhToan()%></label></span>  </td>
                    </tr>
                    <%
                        }
                    %>

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
                                            if (tenDangNhap == null) {
                                        %>
                                    <td id="DonHangCuaBan_tdDetailOrder" colspan="2">
                                        <div class="orderNoItem" style="color:red;">Giỏ hàng của bạn hiện tại không có sản phẩm nào. Vui lòng chọn sản phẩm cần mua !</div>
                                    </td>
                                    <%                                } else {
                                    %>
                                    <td>
                                        <table class="chitiet_giohang" cellspacing="0" cellpadding="2" align="Center" rules="rows" border="0" id="DonHangCuaBan_DataGrid1" style="border-color:White;border-width:0px;font-size:11px;width:100%;border-collapse:collapse;">
                                            <tr style="color:Black;background-color:#CCCCCC;font-weight:bold;height:10px;">
                                            <td>Xóa</td>
                                            <td>Sản phẩm</td>
                                            <td>SL</td>
                                            <td>Thành tiền</td>
                                            </tr>

                                            <form id="testfrm" action="process?task=GioHang" method="post">                                         
                                                <%
                                                    for (int i = 0; i < listGioHang.size(); i++) {
                                                %>
                                                <tr style="background-color:White;height:10px;">
                                                <td style="width:10px;"><input id="chkDel"  type="checkbox" name="chkDel" value="<%= listGioHang.get(i).getMaGioHang()%>"/>   </td>
                                                <td><span id="lblTenSanPham" style="display:inline-block;width:167px;"><%= SanPhamDAO.LaySanPhamTheoMa(listGioHang.get(i).getSanpham().getMaSanPham()).getTenSanPham()%> </span> </td>
                                                <td><input name="txtSL" type="text" value="<%= listGioHang.get(i).getSoLuong()%>" maxlength="4" id="txtSL" style="width:50px;" />
                                                <span id="DonHangCuaBan_DataGrid1_ctl02_RequireTo" style="color:Red;"></span> </td>
                                                <td><span id="lblTT" style="color:Red;"><%= listGioHang.get(i).getThanhTien()%></span> </td>
                                                </tr>                                            
                                                <%
                                                    }
                                                %>                                         
                                                <%
                                                    if (tenDangNhap != null) {
                                                %>                                            
                                                <tr>
                                                <td colspan="4">                                                   
                                                    <input type="image" name="btXoa" value="Xoa" id="btXoa" src="images/linhtinh/OnePageCheckOut_Xoa.jpg" style="border-width:0px; height: 20px;" />
                                                    <!-- <input type="image" name="btCapNhat" value="CapNhat" id="btCapNhat" src="images/linhtinh/CapNhat.JPG" style="border-width:0px; height: 20px;" />      -->                                                                                                                                                   
                                                </td>
                                                </tr>                                            
                                                <%                                                    }
                                                %>                                            
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
                        </td>
                        </tr>
                        <tr id="DonHangCuaBan_tdBuyWhenNoItem" style="display:none;">
                        <td>&nbsp;</td>
                        <td align="left"><input type="image" name="btnBuyWhenNoItem" id="btnBuyWhenNoItem" src="images/linhtinh/OnePageCheckOut_tieptucmuahang.jpg" style="border-width:0px;" />
                            <br />      </td>
                        </tr>
                        <tr>
                        <td colspan="2" style="color:#003466;font-weight:bold;"> Tổng giá trị đơn hàng&nbsp;<span style="font-weight:bold;color:#cc3333;"> <%= TongTien%> VNĐ</span> </td>
                        </tr>
                        <tr>
                        <td style="text-align:right; width:40%;" > Số Tiền giảm giá </td>
                        <td><input name="txtVIPCard" type="text" id="DonHangCuaBan_txtVIPCard" class="text" value="<%= TienGiamGia%>" /> </td>
                        </tr>
                        <tr>
                        <td><span style="color:#003466;font-weight:bold;">Tổng Tiền :</span></td>
                        <td>&nbsp;<span style="color:#003466;font-weight:bold;">&nbsp;<span style="font-weight:bold;color:#cc3333;"><%= ThanhTien%> VNĐ</span></span> </td>
                        </tr>


                        <tr>
                        <td colspan="2" style="text-align:left;">&nbsp;</td>
                        </tr>


                        <tr>
                        <td valign="top" colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                        <td colspan="2"><input id="chkAgree" type="checkbox" name="chkAgree" checked="checked" />
                        <label for="chkAgree">Tôi đã đọc và đồng ý với</label>
                        &nbsp;<a href="http://www.vienthonga.com/template/chinhsach.pdf" target="_blank">Quy định chính sách</a>&nbsp;của VienThongA.com </td>
                        </tr>
                        <tr>
                        <td  colspan="2"><span id="DonHangCuaBan_lblStatus" style="color:Red;font-weight:bold;"></span> </td>
                        </tr>
                        <tr>
                        <td colspan="2" style="text-align:center;"><input type="image" name="btnDatMua" id="btnDatMua" value="DatMua" src="images/linhtinh/DM.JPG" style="border-width:0px; height: 40px;" />      </td>
                        </tr>
                    </table>      
                    </form>
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
                       