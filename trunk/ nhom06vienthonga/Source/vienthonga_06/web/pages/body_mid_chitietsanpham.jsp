<%@page import="MODEL.POJO.Chitietlaptop"%>
<%@page import="MODEL.POJO.Chitietdienthoai"%>
<%@page import="MODEL.DAO.ThamSoDAO"%>
<%@page import="MODEL.POJO.Hinhanhsanpham"%>
<%@page import="MODEL.POJO.Sanpham"%>
<%@page import="MODEL.DAO.SanPhamDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Sanpham sp = (Sanpham) request.getAttribute("sanpham");
    Hinhanhsanpham hasp = (Hinhanhsanpham) sp.getHinhanhsanphams().toArray()[0];
    String path_lsp = "";
    String path_hang = "";
    Chitietdienthoai ctdt = null;
    if (sp.getChitietdienthoais().toArray().length > 0) {
        ctdt = (Chitietdienthoai) sp.getChitietdienthoais().toArray()[0];
    }
    Chitietlaptop ctlt = null;
    if (sp.getChitietlaptops().toArray().length > 0) {
        ctlt = (Chitietlaptop) sp.getChitietlaptops().toArray()[0];
    }
    if (sp.getLoaisanpham().getMaLoaiSanPham().equals("DT")) {
        path_lsp = "dien thoai/";
    } else {
        path_lsp = "laptop/";
    }
    path_hang = sp.getHang().getTenHang() + "/";
%>

<div id="body_mid" style="float:left; width:60%;">
    <table cellspacing="0" cellpadding="0" border="0" width="596">
        <tr>
        <td height="42" align="left" class="maintabletitlebg" >
            <h1><%= sp.getTenSanPham()%></h1>
        </td>
        </tr>
        <tr>
        <td class="graytdborder">
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tr>
                        <td width="33%" valign="top">


                            <table cellspacing="0" cellpadding="5" border="0" width="100%">
                                <tr>
                                <td align="center">
                                    <p>
                                        <br>
                                        <img height="190" alt="<%= sp.getTenSanPham()%>" src="<%= ThamSoDAO.LayDuongDanHinhAnh()%><%= path_lsp%><%= path_hang%><%= hasp.getDuongDan()%>" />
                                    </p>
                                </td>
                                </tr>
                                <tr>
                                <td valign="top" heigh="47">
                                    <table height="45" cellspacing="2" cellpadding="0" border="0" width="100%">

                                    </table>
                                    <br>
                                </td>
                                </tr>
                            </table>
                        </td> 
                        <td width="67%" valign="top" class="bodyChitiet">
                            <table cellspacing="0" cellpadding="10" border="0" width="100%" class="leftBorderTable">
                                <tr>
                                <td>
                                    <p>
                                <span class="titleChitiet"><%= sp.getTenSanPham()%></span><br>
                                Giá: <span class="detail_price"><strong><%= sp.getGiaBan().intValue()%> VNĐ</strong></span><br>
                                </p>                                 
                                <br>
                                <table cellspacing="0" cellpadding="0" border="0" width="100%">                                    
                                    <tr>
                                    <td align="left" width="100%" valign="middle">
                                    <span class="TextOK">Thân máy, Pin, Sạc, Tai Nghe, Sách hướng dẫn sử dụng</span>
                                    </td>
                                    </tr>
                                </table>


                                <p>
                                <span class="chitietChucNang">Thời gian bảo hành:</span> <%= sp.getThoiGianBaoHanh()%>
                                </p>

                                <div style="display: none;" id="VTA_LoadContent_ctl00_VTA_ThongTinTuVTA1_VTA_PhuKienKemTheo1_divPhukien">
                                    <p>
                                    <span class="chitietChucNang">Phụ kiện điện thoại: </span>
                                    <br>
                                    <br>

                                    </p>
                                </div>                

                        </td>
                        </tr>
                        <tr>
                        <td valign="top">

                            <script language="javascript">
                                function ShowPopup1()
                                {                      
                                    document.getElementById("CaoCaoPopup").style.zIndex = 100000;
                                    document.getElementById("CaoCaoPopup").style.display = "block";
                                    document.getElementById("CaoCaoPopup").style.top=450;
                                    document.getElementById("CaoCaoPopup").style.left=220;
                                }
                            </script>  
                            <table cellspacing="0" cellpadding="0" border="0" width="100%">

                                <tr>
                                <td colspan="3">
                                <span style="color: Red; font-weight: normal;" id="VTA_LoadContent_ctl00_VTA_ThongTinTuVTA1_ctl00_lblStatus"></span></td>
                        </tr>

                        <tr>

                        <td valign="top" style="width: 130px; text-align: center;">

                            <a href="process?task=datmua&MSP=<%= sp.getMaSanPham() %>">

                                <img alt="" style="border: 0px none;" src="images/linhtinh/dathang_but.gif" />
                            </a>
                        </td>  
                        <!--
                        <td valign="middle" style="height: 27px;">
                            <a href="javascript:ShowPopup1();">
                                <img border="0" id="IMG2" src="images/linhtinh/gioithieubanbut.gif" />
                            </a>
                        </td>
                        -->
                        </tr>
                    </table>


                    <script type="text/javascript">
                        function ShowPopup()
                        {                      
                            document.getElementById("CaoCaoPopup").style.zIndex = 100000;
                            document.getElementById("CaoCaoPopup").style.display = "block";
                        }
    
                        //Đóng popup
                        function ClosePopup()
                        {
                            document.getElementById("CaoCaoPopup").style.zIndex = -1;
                            document.getElementById("CaoCaoPopup").style.display = "none";
                        }
                        function checkemail(id)   
                        {
     
                            var email = document.getElementById(id);
                            if (email.value=="")
                            {           
                                alert("Vui lòng nhập địa chỉ email người nhận !");
                                email.focus();
                                return false;
                            }
                            else
                            {
                                var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
                                if (!filter.test(email.value)) 
                                {
                                    alert('Địa chỉ email người nhận không hợp lệ !');
                                    email.focus();
                                    return false;
                                }
                            }
                            return true;
                        }

                    </script>

                <style type="text/css">

                    #CaoCaoPopup
                    {
                        position: absolute;
                        left: 0px;
                        top: 0px;
                        width: 1000px;
                        height: 100%;	
                        display: none;
                        z-index: 9999;

                        text-align: center;
                        margin: auto;
                        vertical-align: middle;
                        /*
                        filter: alpha(opacity=70);
                        opacity: 0.9;
                        */
                    }

                    #CaoCaoPopupClose
                    {
                        font-weight: bold;
                        color: #ffcf00;
                        text-align: right;
                        cursor: pointer;
                        width: 10px;
                        margin-right:10px;
                    }

                    #CaoCaoPopupTitle
                    {
                        padding-left:10px;
                        padding-top:3px;
                        float:left;
                        height:20px;
                        color:#c81453;
                        font-weight:bold;
                        padding-right:25px;
                        font-size:14px;
                        border:0px solid red;
                    }

                    #content_popup
                    {
                        float:left;
                        width:100%; 
                        text-align:left;
                        padding-top:100px;
                        padding-left:300px;         
                        align:center;
                        color:black; 
                        /*
                         opacity: 80%;
                         filter: alpha(opacity=90);
                         opacity: 0.9;
                        */
                    }

                    #CaoCaoPopupClose
                    {
                        float: right;
                        /*padding-right:10px;*/
                        background-image:url('../App_Themes/BackGround/close_but.gif');
                        background-repeat:no-repeat;
                        width:25px;height:24px;
                        margin-top:0px;
                        background-repeat:no-repeat;
                        font-size:12px;

                    }      
                    .graytdborder {
                        border-right-width: 1px;
                        border-left-width: 1px;
                        border-right-style: solid;
                        border-left-style: solid;
                        border-right-color: #d7d7d7;
                        border-left-color: #d7d7d7;
                        background-color: #FFFFFF;
                        border-top-width: 1px;
                        border-top-style: solid;
                        border-top-color: #d7d7d7;
                    }
                    .HeadMenu
                    {
                        padding-left:13px;
                        font-size:12px;
                        font-weight:bold;   
                        font-family: Arial, Helvetica, sans-serif;
                        color: #21409a;
                        background-image:url('../App_Themes/BackGround/box_top.gif');
                        background-repeat:no-repeat; 
                        width:253px;
                        height:30px;
                    }
                    .stylehead
                    {
                        font-size:12px;
                        font-weight:bold;   
                        font-family: Arial, Helvetica, sans-serif;
                        color: #21409a;
                    }

                </style>

                <div id="CaoCaoPopup">
                    <div id="content_popup">

                        <table cellspacing="0" cellpadding="0" border="0" width="400">

                            <tr>

                            <td class="HeadMenu">
                                <table cellspacing="0" cellpadding="0" width="380">
                                    <tr>
                                    <td width="370" class="stylehead">
                                        <b>GIỚI THIỆU BẠN BÈ</b>  
                                    </td>
                                    <td align="right" width="20" style="padding-top: 2px;">
                                        <a style="text-decoration: none;" href="javascript:ClosePopup();">
                                            <img border="0" src="../App_Themes/BackGround/close_but.gif">
                                        </a> 	      	                        
                                    </td>
                                    </tr>
                                </table>  	                     
                            </td> 	                
                            </tr>
                            <tr>
                            <td style="height: 269px;" class="graytdborder">
                                <center>
                                    <table cellspacing="0" cellpadding="3" border="0" style="width: 373px; font-size: 12px; font-family: Arial;">

                                        <tr>
                                        <td style="height: 25px; width: 146px;">                       Tên người gửi</td>
                                        <td style="width: 249px;">
                                            <input type="text" style="width: 224px;" id="VTA_LoadContent_ctl00_VTA_ThongTinTuVTA1_ctl00_SendInviteMail1_txtSendName" name="VTA_LoadContent$ctl00$VTA_ThongTinTuVTA1$ctl00$SendInviteMail1$txtSendName"></td> 
                                        </tr>
                                        <tr>
                                        <td style="height: 23px; width: 146px;">
                                            Tên người nhận</td>
                                        <td style="height: 23px; width: 249px;">
                                            <input type="text" style="width: 224px;" id="VTA_LoadContent_ctl00_VTA_ThongTinTuVTA1_ctl00_SendInviteMail1_txtRevName" name="VTA_LoadContent$ctl00$VTA_ThongTinTuVTA1$ctl00$SendInviteMail1$txtRevName"></td>
                                        </tr>

                                        <tr>
                                        <td style="height: 23px; width: 146px;">
                                            Email người nhận
                                            (<span style="color: rgb(255, 0, 0);">*</span>)</td>
                                        <td style="height: 23px; width: 249px;">
                                            <input type="text" style="width: 224px;" id="VTA_LoadContent_ctl00_VTA_ThongTinTuVTA1_ctl00_SendInviteMail1_txtRevEmail" name="VTA_LoadContent$ctl00$VTA_ThongTinTuVTA1$ctl00$SendInviteMail1$txtRevEmail">
                                        </td>
                                        </tr>

                                        <tr>
                                        <td style="height: 23px; width: 146px;">
                                            Lời nhắn</td>
                                        <td style="width: 249px;">&nbsp;</td>
                                        </tr>
                                        <tr>
                                        <td colspan="2">
                                            <textarea style="height: 98px; width: 352px;" id="VTA_LoadContent_ctl00_VTA_ThongTinTuVTA1_ctl00_SendInviteMail1_txtContents" cols="20" rows="2" name="VTA_LoadContent$ctl00$VTA_ThongTinTuVTA1$ctl00$SendInviteMail1$txtContents"></textarea></td>
                                        </tr>


                                        <tr>
                                        <td align="center" style="height: 20px;" colspan="2">
                                            <input type="image" style="border-width: 0px;" onclick="return checkemail('VTA_LoadContent_ctl00_VTA_ThongTinTuVTA1_ctl00_SendInviteMail1_txtRevEmail');" src="../../../../App_Themes/BackGround/gui_btn.gif" id="VTA_LoadContent_ctl00_VTA_ThongTinTuVTA1_ctl00_SendInviteMail1_btSend" name="VTA_LoadContent$ctl00$VTA_ThongTinTuVTA1$ctl00$SendInviteMail1$btSend">        
                                        </td>
                                        </tr>    

                                    </table>       
                                </center>                                                        
                            </td>

                            </tr>

                            <tr>
                            <td valign="top"><img src="../App_Themes/BackGround/box_bottom.gif"></td>
                            </tr>  
                        </table>

                    </div>
                </div>


        </td>
        </tr>
    </table>
</td>
</tr>
</table></td>
</tr>
<tr>
<td>
    <%
        if (ctlt != null) {
            //chi tiết laptop
%>
    <div class="detail_tab_content" style="margin-left: 10px;">
        <table cellspacing="0" cellpadding="0" width="100%" style="border: 1px solid rgb(220, 220, 220);" class="bodyChitiet">
            <tr>
                <td style="border-bottom: 1px solid rgb(220, 220, 220);" colspan="2">&nbsp;</td>
            </tr>                      
            <tr>
            <td width="200" valign="middle" style="border: 0px solid rgb(220, 220, 220);">
            <span class="CellPaddingLeft chitietTinhNang"><strong>Thông tin chung</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%" style="border-bottom: 1px solid rgb(220, 220, 220);">

                    <tr>
                    <td width="40%" class="borderLRTop">Tên sản phẩm</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdTenSanPham"><%= sp.getTenSanPham()%></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Hãng sản xuất</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdHangSX"><%= sp.getHang().getTenHang()%></td>

                    </tr> 

                    <tr>
                    <td width="40%" class="borderLRTop">Cấu hình</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCauHinh">CPU: 2.1 GHz, RAM: 4GB, HDD: 500GB, CD/DVD: , Màn hình: 14.0 inch</td>

                    </tr>    

                    <tr>
                    <td width="40%" class="borderLRTop">Nhóm người dùng</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdNhomNguoiDung">Multimedia - Laptop giải trí đa phương tiện</td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Màu sắc</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdMauSac">Đen.</td>

                    </tr>    

                    <tr>
                    <td width="40%" class="borderLRTop">Kích thước/trọng lượng</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdKichThuocTrongLuong"><%= sp.getKichThuoc() %></td>

                    </tr>   
                    <tr>
                    <td width="40%" class="borderLRTop">Bảo hành</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdbaohanh"><%= sp.getThoiGianBaoHanh() %></td>

                    </tr>   

                </table>
            </td>
            </tr> 

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Bộ xử lý - CPU</strong></span></td>
            <td align="right" valign="top">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">                              
                    <tr>
                    <td width="40%" class="borderLRTop">Thông tin CPU</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdThongTinCPU">INTEL Core i3-2310M Sandy Bridge 2.1 GHz, 3MB L3 cache, 1333MHz FBS</td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Công nghệ CPU</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCongNgheCPU"><%= ctlt.getCongNgheCpu() %></td>

                    </tr>

                    <tr>
                    <td width="40%" style="height: 29px;" class="borderLRTop">Tốc độ CPU</td>
                    <td width="60%" style="height: 29px;" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdTocdoCPU"><%= ctlt.getTocDoCpu() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Bộ nhớ đệm (cache)</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdBoNhoDem"><%= ctlt.getBoNhoDem() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Front side Bus (FSB)</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdFSB"><%= ctlt.getFortSizeBus() %></td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Hãng sản xuất CPU</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdHangSXCPU"><%= ctlt.getHangCpu() %></td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Bo mạch chủ - Motherboard</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Thông tin Motherboard</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdThongTinMotherBoard"><%= ctlt.getThongTinMotherBoard() %></td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Front side Bus hỗ trợ</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdFSBMotherboardHoTro"><%= ctlt.getFortSizeBus() %></td>

                    </tr>
                    <tr>


                    </tr>
                </table>
            </td>
            </tr>   		     


            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Bộ nhớ chính - RAM</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Dung lượng RAM</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdDungLuongRAM"><%= ctlt.getDungLuongRam() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Công nghệ RAM</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCongNgheRAM"><%= ctlt.getCongNgheRam() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Bus RAM</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdBusRAM"><%= ctlt.getBusRam() %></td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Mức RAM tối đa</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdRAMToida"><%= ctlt.getMucRamToiDa() %></td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Ổ đĩa cứng - HDD</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Dung lượng</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdDungluongHDD"><%= ctlt.getDungLuongOcung() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Công nghệ</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCongNgheHDD"><%= ctlt.getCongNgheOcung() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Giao thức kết nối</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdGiaoThucKetNoiHDD"><%= ctlt.getGiaoThucKetNoi() %></td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Số vòng quay</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdSoVongQuayHDD"><%= ctlt.getSoVongQuay() %></td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Ổ đĩa quang - ODD</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Thông tin ổ đĩa</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdThongTinDiaQuang">DVDRW Supermulti</td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Chức năng</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdChucNangdiaquang">Đọc, ghi DVD.</td>

                    </tr>

                </table>
            </td>
            </tr>   		     


            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Màn hình - Monitor display</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Kích thước</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdKichThuocManHinh">14.0 inch</td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Chuẩn màn hình</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdChuanManHinh"><%= ctlt.getChuanManHinh() %></td>

                    </tr>                                                            

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Đồ họa - Graphic</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Card đồ họa</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCardDoHoa"><%= ctlt.getCardDoHoa() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Loại card</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdLoaiCardDohoa"><%= ctlt.getLoaiCard() %></td>

                    </tr>
                    <tr>
                    <td width="40%" style="display: none;" class="borderLRTop">Công nghệ card</td>
                    <td width="60%" style="display: none;" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdcongnghecarddohoa">-</td>

                    </tr>
                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Dung lượng card</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdDungluongcarddohoa"><%= ctlt.getDungLuongCard() %></td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Âm thanh - Audio</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Card âm thanh</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCardAmThanh"><%= ctlt.getCardAmThanh() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Chuẩn âm thanh</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdChuanAmThanh"><%= ctlt.getChuanAmThanh() %></td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Kết nối</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdKetNoiAmThanh"><%= ctlt.getKetNoi() %></td>

                    </tr>


                </table>
            </td>
            </tr>   		             

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Kết nối mạng - Network</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Modem (Dial up)</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdModemDial">Không hỗ trợ.</td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">LAN (ADSL)</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdLAN_ADSL">Integrated 10/100/1000 Gigabit Ethernet LAN</td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Wireless</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdWireless">802.11b/g/n Wireless LAN</td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Bluetooth/Camera</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Bluetooth</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdBluetooth"><%= ctlt.getBluetooth() %></td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Camera (Webcam)</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCamera"><%= ctlt.getCamera() %></td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Cổng giao tiếp</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">USB</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdUSB"><%= ctlt.getUsb() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Firewall (1394)</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdFireWall">Không hỗ trợ.</td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Video out</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdVideoOut"><%= ctlt.getVideoOut() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Card Reader</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCardReader"><%= ctlt.getCardReader() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">e-SATA</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdeSATA"><%= ctlt.getGiaoThucKetNoi() %></td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Hồng ngoại (IR)</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdHongNgoai_IR">Không hỗ trợ.</td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Khác</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCongGiaoTiepKhac">-</td>

                    </tr>

                </table>
            </td>
            </tr>   		             

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Nguồn điện</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Adapter</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdAdaptor">220v</td>

                    </tr>

                    <tr>
                    <td width="40%" class="borderLRTop">Công nghệ Pin</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCongNghePin">6-Cell Lithium-Ion</td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Thời gian sử dụng Pin</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdThoigiansudungPin"><%= ctlt.getThoiGianSuDungPin() %></td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Bảo mật</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Khe dùng gắn dây khóa máy</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdKheDungGangDayKhoaMay">Kensington</td>

                    </tr>
                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Hệ thống bảo mật nhận diện</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdHeThongBaoMatNhanDien">Đang cập nhật</td>

                    </tr>


                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Hệ điều hành - OS</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Thông tin hệ điều hành</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdThongTinHeDieuHanh">Free Dos</td>

                    </tr>

                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Các hệ điều hành hỗ trợ</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdCacLoaiHDH"><%= ctlt.getThongTinHeDieuHanh() %></td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Thiết kế</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Kích thước</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdKichThuoc">342 x 244 x 31.52/34.68 mm mm</td>

                    </tr>
                    <tr>
                    <td width="40%" class="borderLRTop">Trọng lượng</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdTrongLuong">2.2 kg</td>

                    </tr>
                    <tr>
                    <td width="40%" class="borderLRTop">Chất liệu</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdChatLieu">Đang cập nhật</td>

                    </tr>
                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Màu sắc</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdThietKeMauSac">Đen.</td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Đóng gói</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Laptop</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdLapTop">01 x 01 Dell Inspiron   14 - N4050 - I3-2310 -4500 -KXJXJ2</td>

                    </tr>
                    <tr>
                    <td width="40%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderLRTop">Accessories</td>
                    <td width="60%" style="border-bottom: 1px solid rgb(220, 220, 220);" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdAccessories">Adapter, Pin, Catalogue</td>

                    </tr>

                </table>
            </td>
            </tr>   		     

            <tr>
            <td width="200" valign="middle" style="border: 1px solid rgb(220, 220, 220);"><span class="CellPaddingLeft chitietTinhNang"><strong>Thông tin khác</strong></span></td>
            <td align="right">
                <table cellspacing="0" cellpadding="5" border="0" width="100%">

                    <tr>
                    <td width="40%" class="borderLRTop">Phần cứng</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdPhanCung">-</td>

                    </tr>
                    <tr>
                    <td width="40%" class="borderLRTop">Phần mềm</td>
                    <td width="60%" class="borderCellTop" id="VTA_LoadContent1_ctl00_VTA_Detaillaptopmain1_tdPhanMem">-</td>

                    </tr>

                </table>
            </td>
            </tr>   		     


        </table>
    </div>
    <%            } else {
        //chi tiết điện thoại
%>
    <div class="detail_tab_content" style="margin-left: 10px;">
        <a style="color: rgb(255, 255, 255);" id="Focus" href="#">&nbsp;</a>
        <div id="detail_1" style="">
            <table cellspacing="0" cellpadding="0" border="0" width="100%" class="bodyChitiet">
                <tr>
                <td width="130" valign="top"><span class="CellPaddingLeft chitietTinhNang"><strong>Tổng quan</strong></span></td>
                <td><table cellspacing="0" cellpadding="5" border="0" width="100%">
                        <tr>
                        <td class="borderLRTop">Mạng </td>
                        <td class="borderCellTop"><%= ctdt.getMang() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Màu sắc</td>
                        <td class="borderCellTop"><%= sp.getMauSac() %></td>
                        </tr>

                        <tr>
                        <td width="144" class="borderFull">Kích thước/Trọng lượng </td>
                        <td class="borderCellTopBottom"><%= sp.getKichThuoc() %></td>
                        </tr>
                    </table></td>
                </tr>
                <tr>
                <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                <td valign="top"><span class="CellPaddingLeft chitietTinhNang"><strong>Hiển thị </strong></span></td>
                <td><table cellspacing="0" cellpadding="5" border="0" width="100%">
                        <tr>
                        <td width="144" class="borderLRTop">Ngôn ngữ </td>
                        <td class="borderCellTop"><%= ctdt.getNgonNgu() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Loại màn hình </td>
                        <td class="borderCellTop"><%= ctdt.getLoaiManHinh() %></td>
                        </tr>
                        <tr>
                        <td class="borderFull">Kích thước hiển thị</td>
                        <td class="borderCellTopBottom"><%= ctdt.getKichThuocHienThi() %></td>
                        </tr>
                    </table></td>
                </tr>
                <tr>
                <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                <td valign="top"><span class="CellPaddingLeft chitietTinhNang"><strong>Đặc điểm</strong></span></td>
                <td><table cellspacing="0" cellpadding="5" border="0" width="100%">
                        <tr>
                        <td width="144" class="borderLRTop">Kiểu chuông </td>
                        <td class="borderCellTop"><%= ctdt.getKieuChuong() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Tin nhắn</td>
                        <td class="borderCellTop"><%= ctdt.getTinNhan() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Kết nối</td>
                        <td class="borderCellTop"><%= ctdt.getKetNoi() %></td>
                        </tr>
                        <tr>
                        <td class="borderFull">Camera</td>
                        <td class="borderCellTopBottom"><%= ctdt.getCamera() %></td>
                        </tr>
                    </table></td>
                </tr>
                <tr>
                <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                <td valign="top"><span class="CellPaddingLeft chitietTinhNang"><strong>Lưu trữ</strong></span></td>
                <td><table cellspacing="0" cellpadding="5" border="0" width="100%">
                        <tr>
                        <td width="144" class="borderLRTop">Danh bạ </td>
                        <td class="borderCellTop"><%= ctdt.getDanhBa() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Bộ nhớ trong </td>
                        <td class="borderCellTop"><%= ctdt.getBoNhoTrong() %></td>
                        </tr>
                        <tr>
                        <td class="borderFull">Thẻ nhớ</td>
                        <td class="borderCellTopBottom">
                            microSD ( Transflash) tối đa 32 GB
                        </td>
                        </tr>
                    </table></td>
                </tr>
                <tr>
                <td colspan="2">&nbsp;</td>
                </tr>

                <tr>
                <td valign="top"><span class="CellPaddingLeft chitietTinhNang"><strong>Thông tin khác</strong></span></td>
                <td><table cellspacing="0" cellpadding="5" border="0" width="100%">
                        <tr>
                        <td width="144" class="borderLRTop">Tải nhạc</td>
                        <td class="borderCellTop">-</td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Rung</td>
                        <td class="borderCellTop"><%= ctdt.getRung() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">GPRS</td>
                        <td class="borderCellTop"><%= ctdt.getGpgs() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">HSCSD</td>
                        <td class="borderCellTop">-</td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">EDGE</td>
                        <td class="borderCellTop">-</td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">3G</td>
                        <td class="borderCellTop"><%= ctdt.getM3g() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">WLAN</td>
                        <td class="borderCellTop"><%= ctdt.getWlan() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Hệ điều hành</td>
                        <td class="borderCellTop">Không</td>
                        </tr>

                        <tr>
                        <td class="borderLRTop">Đồng hồ</td>
                        <td class="borderCellTop"><%= ctdt.getDongHo() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Báo thức</td>
                        <td class="borderCellTop"><%= ctdt.getBaoThuc() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Đài FM</td>
                        <td class="borderCellTop"><%= ctdt.getDaiFm() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Trò chơi</td>
                        <td class="borderCellTop"><%= ctdt.getTroChoi() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Trình duyệt</td>
                        <td class="borderCellTop"><%= ctdt.getTrinhDuyet() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Java</td>
                        <td class="borderCellTop"><%= ctdt.getJaVa() %></td>
                        </tr>

                        <tr>
                        <td class="borderLRTop">Quay phim</td>
                        <td class="borderCellTop"><%= ctdt.getQuayPhim() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Ghi âm</td>
                        <td class="borderCellTop"><%= ctdt.getGhiAm() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Nghe nhạc</td>
                        <td class="borderCellTop"><%= ctdt.getNgheNhac() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Xem phim</td>
                        <td class="borderCellTop"><%= ctdt.getXemPhim() %></td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Ghi âm cuộc gọi</td>
                        <td class="borderCellTop">-</td>
                        </tr>
                        <tr>
                        <td class="borderFull">
                            Loa ngoài</td>
                        <td class="borderCellTopBottom"><%= ctdt.getLoaNgoai() %></td>
                        </tr>
                    </table></td>
                </tr>
                <tr>
                <td colspan="2">&nbsp;</td>
                </tr>

                <tr>
                <td valign="top"><span class="CellPaddingLeft chitietTinhNang"><strong>Pin</strong></span></td>
                <td><table cellspacing="0" cellpadding="5" border="0" width="100%">
                        <tr>
                        <td width="144" class="borderLRTop">Loại Pin </td>
                        <td class="borderCellTop">Li-Ion 1020 mAh (BL-5C)</td>
                        </tr>
                        <tr>
                        <td class="borderLRTop">Thời gian chờ </td>
                        <td class="borderCellTop">Lên đến 500 giờ</td>
                        </tr>
                        <tr>
                        <td class="borderFull">Thời gian đàm thoại</td>
                        <td class="borderCellTopBottom">Lên đến 5 giờ/ Nghe nhạc liên tục đến 37 giờ</td>
                        </tr>

                    </table></td>
                </tr>
                <tr>
                <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                <td valign="top"><span class="CellPaddingLeft chitietTinhNang"><strong>Mô tả</strong></span></td>
                <td valign="top"><table cellspacing="0" cellpadding="5" border="0" width="100%">
                        <tr>
                        <td class="borderTopLB">
                            Nokia C2-03 nắp trượt, màn hình cảm ứng với hai khe cắm sim.

                        </td>
                        </tr>
                    </table></td>
                </tr>
                <tr>
                <td colspan="2">&nbsp;</td>
                </tr>
            </table>


        </div>
        <div id="detail_2" style="display: none;">
            <table style="font-size: 12px; border: 0px none;"><tr><td>
                <span id="VTA_LoadContent_ctl00_litDescription"><font size="5" style="color: rgb(139, 0, 0);"><span style="font-weight: bold;">NOKIA C2-03 DUAL SIM</span></font><br><br><img hspace="0" border="0" align="bottom" vspace="0" src="http://admin.vienthonga.com/uploadedfile/C2-03-wall.jpg" alt=" "><br><br><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span style="font-weight: bold; color: rgb(178, 34, 34);">*** Tính năng 
                                            chính :</span><br style="font-weight: bold;"><br><span style="font-weight: bold;">- Băng tần :</span><br>&nbsp;Mạng 2G : </span></span></span></span>GSM 900 / 1800 - SIM 1<span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"></span><br>&nbsp;Mạng 2G : </span></span></span>GSM 900 / 1800 - SIM 2<br> <br><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><br><span style="font-weight: bold;">- Hiển thị : </span><br>+ Màn hình cảm ứng, TFT, 65.536 màu. Độ phân giải 240 x 320 pixels, rộng 2.6 inches </span><span id="VTA_LoadContent_ctl00_litDescription"></span><br>+ Photo Call( danh bạ hình ảnh)<br>+ 3 màn hình chính<br>+ Nhận diện chữ viết tay cho tiếng Trung<br>+ Hỗ trợ Flash Lite<br><span id="VTA_LoadContent_ctl00_litDescription"><br><span style="font-weight: bold;">-
                                            Bộ nhớ và Khả năng xử lý :</span><br>+ Bộ nhớ dùng chung<br>+ Khe cắm thẻ nhớ
                                        MicroSD tối đa 32 GB <br><br><br><span style="font-weight: bold;">- Kết nối :</span><br></span>GPRS (</span>Class 10 (4+1/3+2 slots), 32 - 48 kbps), <br>Bluetooth v2.1<br>USB : microUSB v2.0<br>Audio out (3.5 mm)<br><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><br><span style="font-weight: bold;">- Ứng dụng Công việc 
                                            và Giải trí :<br></span>+ 2 sim 2 sóng online<span style="font-weight: bold;"><br>+ </span></span></span></span></span>Đổi SIM không cần tắt máy<br><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span style="font-weight: bold;"></span>+ Trình duyệt </span></span>WAP 2.0/xHTML, HTML<span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"></span><br><span id="VTA_LoadContent_ctl00_litDescription"><span id="intelliTxt" name="intelliTxt">+ </span></span></span></span></span></span>SMS, MMS, Email, Push Email<span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><span id="intelliTxt" name="intelliTxt"></span><span id="intelliTxt" name="intelliTxt"><br>+ Máy ảnh số 2.0MP 1600 x 1200 pixels<br></span></span><span id="VTA_LoadContent_ctl00_litDescription">+ Máy nghe nhạc hỗ trợ các định dạng phổ biến nhất: </span></span> MP3/WAV/AAC+<span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"><br>+ </span></span>Stereo FM radio with RDS; FM recording<span id="VTA_LoadContent_ctl00_litDescription"><span id="VTA_LoadContent_ctl00_litDescription"></span><br>+ Khe cắm thẻ nhớ microSD tối đa 32 GB</span></span></span><span title="Nokia C2-00 : Tháo và Lắp SIM nóng" dir="ltr" class="" id="eow-title"><br></span></span><font size="5" style="font-weight: bold;"><br style="color: rgb(139, 0, 0);"><span style="color: rgb(139, 0, 0);">VIDEO QUẢNG CÁO NOKIA C2-03<br><br></span></font><iframe height="450" frameborder="0" width="560" allowfullscreen="" src="http://www.youtube.com/embed/JKti9mLEB4Q"></iframe></span>
                </td></tr></table> 
        </div>
        <div id="detail_3" style="display: none;">


            <br>
            <div class="minform">
                <table cellspacing="5"><tr><td>Chưa có nhận xét về sản phẩm này.</td></tr></table>
            </div>
            <br><br>
            <table cellspacing="0" cellpadding="3" border="0" width="100%" style="display: none;" class="minform">
                <tr>
                <td height="30" class="cellBgColor3 " colspan="2"><span class="titleChitiet"><span class="ThongTinTitle style17">Nhận xét của bạn về</span> <span class="style3"> </span></span></td>
                </tr>
            </table>
            <div style="display: none;" id="DivVietNhanXet">
                <table cellspacing="0" cellpadding="3" border="0" width="100%" class="minform">


                    <tr>
                    <td width="20%" class="TieuDeSanPham">Tiếng Việt : 
                    </td>
                    <td align="left" width="80%">
                        <input type="radio" name="switcher" value="OFF" checked="checked" onfocus="setTypingMode(0)">OFF
                        <input type="radio" name="switcher" value="TELEX" onfocus="setTypingMode(1)">Telex
                        <input type="radio" name="switcher" value="vnVni" onfocus="setTypingMode(2)">VNI
                    </td>
                    </tr>
                    <tr>
                    <td class="TieuDeSanPham">Họ tên :</td>
                    <td><input type="text" class="" size="50" onkeyup="telexingVietUC(this, event);" id="VTA_LoadContent_ctl00_VTA_ShowWriteNhanXet1_txtTieude" name="VTA_LoadContent$ctl00$VTA_ShowWriteNhanXet1$txtTieude">
                    </td>
                    </tr>
                    <tr>
                    <td class="TieuDeSanPham">Email</td>
                    <td><input type="text" size="50" id="VTA_LoadContent_ctl00_VTA_ShowWriteNhanXet1_txtEmail" name="VTA_LoadContent$ctl00$VTA_ShowWriteNhanXet1$txtEmail"></td>
                    </tr>
                    <tr>
                    <td valign="top" class="TieuDeSanPham">Nội dung :</td>
                    <td><textarea cols="30" style="width: 335px; height: 80px;" onkeyup="telexingVietUC(this, event);" id="VTA_LoadContent_ctl00_VTA_ShowWriteNhanXet1_txtNoidung" name="VTA_LoadContent$ctl00$VTA_ShowWriteNhanXet1$txtNoidung"></textarea>
                    </td>
                    </tr>
                    <tr>
                    <td class="TieuDeSanPham">Ưu điểm :</td>
                    <td><input type="text" size="50" onkeyup="telexingVietUC(this, event);" id="VTA_LoadContent_ctl00_VTA_ShowWriteNhanXet1_txtUuDiem" name="VTA_LoadContent$ctl00$VTA_ShowWriteNhanXet1$txtUuDiem">
                    </td>
                    </tr>
                    <tr>
                    <td class="TieuDeSanPham">Nhược điểm :</td>
                    <td><input type="text" size="50" onkeyup="telexingVietUC(this, event);" id="VTA_LoadContent_ctl00_VTA_ShowWriteNhanXet1_txtNhuocDiem" name="VTA_LoadContent$ctl00$VTA_ShowWriteNhanXet1$txtNhuocDiem">
                    </td>
                    </tr>
                    <tr>
                    <td class="TieuDeSanPham">Đánh giá :</td>
                    <td>
                        <table>
                            <tr>
                            <td height="23" align="center" width="16%" valign="middle">
                                <img onclick="DanhGia(this.id);" onmouseout="MouseOut(this.id);" onmouseover="MouseOver(this.id);" id="tn1" style="" name="tn1" src="../App_Themes/icons/01_over.jpg"></td>
                            <td height="23" align="center" width="16%" valign="middle">
                                <img onclick="DanhGia(this.id);" onmouseout="MouseOut(this.id);" onmouseover="MouseOver(this.id);" id="tn2" style="" name="tn2" src="../App_Themes/icons/02_over.jpg"></td>
                            <td height="23" align="center" width="16%" valign="middle">
                                <img onclick="DanhGia(this.id);" onmouseout="MouseOut(this.id);" onmouseover="MouseOver(this.id);" id="tn3" style="" name="tn3" src="../App_Themes/icons/03_over.jpg"></td>
                            <td height="23" align="center" width="16%" valign="middle">
                                <img onclick="DanhGia(this.id);" onmouseout="MouseOut(this.id);" onmouseover="MouseOver(this.id);" id="tn4" style="" name="tn4" src="../App_Themes/icons/04_over.jpg"></td>
                            <td height="23" align="center" width="16%" valign="middle">
                                <img onclick="DanhGia(this.id);" onmouseout="MouseOut(this.id);" onmouseover="MouseOver(this.id);" id="tn5" style="" name="tn5" src="../App_Themes/icons/05.jpg"></td>
                            </tr>
                        </table>
                        <input type="hidden" name="HidDanhGiaTN" value="4" id="HidDanhGiaTN">

                    </td>
                    </tr>

                    <tr>
                    <td>&nbsp;</td>
                    <td align="left"><input align="absmiddle" type="image" style="border-width: 0px;" onclick="return NhanXetDienthoai(1401);" src="../../../../App_Themes/BackGround/gui_btn.gif" id="VTA_LoadContent_ctl00_VTA_ShowWriteNhanXet1_CmdBinhchon" name="VTA_LoadContent$ctl00$VTA_ShowWriteNhanXet1$CmdBinhchon"> <input align="absmiddle" type="image" onclick="return reset_nhan_xet();" id="bnt_reset" src="../App_Themes/BackGround/xoa_btn.gif"></td>
                    </tr>
                </table>
            </div>

        </div> 
    </div>
    <%            }
    %>
</td>

</tr>
<tr>
<td>&nbsp;</td>
</tr>
<tr>
<td>
    <!--
    <table cellspacing="5" cellpadding="5" border="0" width="100%" id="sp_cungloai">
        <tr>
            <td background="12" align="left" style="color: rgb(177, 0, 50);" colspan="4"><b>Sản phẩm cùng loại</b></td>
        </tr>
        <tr>
            <td align="center" class="graytdborder1"><a class="TextTieuDeSP" href="http://www.vienthonga.com/dien-thoai/chi-tiet/NokiaN9-64-GB/1470/17"><img border="0" width="47" src="http://www.vienthonga.com/App_Themes/SanphamDienThoai/thumb/N9-small-64.jpg"></a><br><span class="producttitle"><a class="TextTieuDeSP" href="http://www.vienthonga.com/dien-thoai/chi-tiet/NokiaN9-64-GB/1470/17">Nokia N9 64 GB</a></span><br><span class="detail_price">14,749,000 VNĐ</span>  </td><td align="center" class="graytdborder1"><a class="TextTieuDeSP" href="http://www.vienthonga.com/dien-thoai/chi-tiet/NokiaN9-16-GB/1375/17"><img border="0" width="47" src="http://www.vienthonga.com/App_Themes/SanphamDienThoai/thumb/N9-small.jpg"></a><br><span class="producttitle"><a class="TextTieuDeSP" href="http://www.vienthonga.com/dien-thoai/chi-tiet/NokiaN9-16-GB/1375/17">Nokia N9 16 GB</a></span><br><span class="detail_price">13,249,000 VNĐ</span>  </td><td align="center" class="graytdborder1"><a class="TextTieuDeSP" href="http://www.vienthonga.com/dien-thoai/chi-tiet/NokiaE7/1264/17"><img border="0" width="47" src="http://www.vienthonga.com/App_Themes/SanphamDienThoai/thumb/E7.jpg"></a><br><span class="producttitle"><a class="TextTieuDeSP" href="http://www.vienthonga.com/dien-thoai/chi-tiet/NokiaE7/1264/17">Nokia E7</a></span><br><span class="detail_price">11,049,000 VNĐ</span>  </td><td align="center" class="graytdborder1"><a class="TextTieuDeSP" href="http://www.vienthonga.com/dien-thoai/chi-tiet/NokiaN900/1015/17"><img border="0" width="47" src="http://www.vienthonga.com/App_Themes/SanphamDienThoai/thumb/N900.jpg"></a><br><span class="producttitle"><a class="TextTieuDeSP" href="http://www.vienthonga.com/dien-thoai/chi-tiet/NokiaN900/1015/17">Nokia N900</a></span><br><span class="detail_price">9,899,000 VNĐ</span>  </td>
        </tr>
    </table>
    -->
</td>
</tr>
<tr>
<td>&nbsp;</td>
</tr>
</table></td>
</tr>
<tr>
<td align="center" valign="top" );="" style="height: 2px; background-image: url(&quot;http://www.vienthonga.com/App_Themes/BackGround/maintablebottom.gif&quot;);"></td>
</tr>

</table>
</div>