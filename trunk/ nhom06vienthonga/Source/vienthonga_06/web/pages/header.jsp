<%@page import="javax.print.DocFlavor.STRING"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="header" style="">    	
    <div class="flashHeader" align="center" style="width: 1000px; padding-left:0px;">
        <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" title="www.passion.com" >           
            <param name="quality" value="high" />
            <param name="wmode" value="transparent" />
            <embed src="images/banner/flashvortex.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" width="100%" height="120" />
        </object>

        <ul class="lev1" style="background-image: url(images/linhtinh/menu_bar_03.gif); margin-left: -40px;">
            <li><a href="view"><span>Trang Chủ</span></a></li>
            <li><a href="view?task=danhmucsanpham&task_chitiet=dienthoai"><span>Điện Thoại</span></a></li>
            <li><a href="view?task=danhmucsanpham&task_chitiet=laptop"><span>Laptop</span></a></li>
            <li><a href="view?task=khuyenmai"><span>Khuyến Mãi</span></a></li>
            <li><a href="view?task=tintuc"><span>Tin Tức</span></a></li>
            <li><a href="view?task=lienhe"><span>Liên Hệ</span></a></li>
            <li><a href="view?task=diendan"><span>Diễn Đàn</span></a></li>
        </ul>
    </div>

    <div class="lev1" style="background-image: url(images/linhtinh/quanly.gif); margin-top: -5px; margin-right: 120px; text-align: right; vertical-align: middle; height: 22px;">
        <%
            String tenDangNhap = (String)session.getAttribute("TenDangNhap");
            if(tenDangNhap == null)
           {
        %>
        <a style="float: right; text-transform: uppercase;" href="login?Action=DangNhap" >| Đăng nhập</a>
        <a style="float: right; text-transform: uppercase;" href="DangKy_Controller?Action=DangKy" >| Đăng ký </a>
        <%
           }
            else
           {
        %>
        <a style="float: right; text-transform: uppercase;" href="DangXuat_Controller" >| Đăng Xuất</a>
        <a style="float: right; text-transform: uppercase;" >Hi, <%= request.getParameter("tenDangNhap")%></a>        
        <%
           }
        %>
        
        <a style="float: right; text-transform: uppercase;" href="" >| giỏ hàng</a>
        <a style="float: right; text-transform: uppercase;" href="view?task=quanly" >quản lý</a>
                                              
   </div>

</div>