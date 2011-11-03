<%-- 
    Document   : body_mid_quanlyuser
    Created on : Oct 4, 2011, 9:15:56 AM
    Author     : HP
--%>

<%@page import="MODEL.DAO.LoaiNguoiDungDAO"%>
<%@page import="MODEL.POJO.Loainguoidung"%>
<%@page import="MODEL.DAO.NguoiDungDAO"%>
<%@page import="MODEL.POJO.Nguoidung"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String maNguoiDung = (String)session.getAttribute("MaNguoiDung");
    Nguoidung nd = NguoiDungDAO.LayNguoiDungTheoMa(maNguoiDung);    
    Loainguoidung lnd = NguoiDungDAO.LayDoiTuongTheoMa(nd.getLoainguoidung().getMaLoaiNguoiDung());
%>

<div id="body_mid" style="float:left; width:76.5%;" align="center">  
    <form action="process?task=quanlynguoidung&task_chitiet=capnhatnguoidung" method="post" style="margin-left: 10px;">        
        <table border="2px" width="100%" >
            <tr>
                <td colspan="2" align="center" style="font-size: 2EM; font-weight: bold; color: #a2c62d;">THÔNG TIN KHÁCH HÀNG</td>
            </tr>
            
            <tr>
                <td width="10%" style="font-size: 1.2EM; font-weight: bold;">Tên người dùng: </td>
                <td width="20%">
                    <input size="50px" name="tenNguoiDung" type="text" value="<%=nd.getTenDangNhap() %>" />
                </td>

                <td width="5%">
                    <input name="capnhat" type="submit" value="CẬP NHẬT" style="height: 20px;" />
                </td>

                <td width="5%">
                    <input name="huy" type="reset" value="HUỶ" style="height: 20px;" />
                </td>
            </tr>

            <tr>
                <td style="font-size: 1.2EM; font-weight: bold;">Email: </td>
                <td>
                    <input size="50px" name="email" type="text" value="<%=nd.getEmail() %>" />
                </td>
            </tr>

            <tr>
                <td style="font-size: 1.2EM; font-weight: bold;">CMND: </td>
                <td>
                    <input size="50px" name="cmnd" type="text" value="<%=nd.getCmnd() %>" />
                </td>
            </tr>

            <tr>
                <td style="font-size: 1.2EM; font-weight: bold;">Điện thoại: </td>
                <td>
                    <input size="50px" name="dienThoai" type="text" value="<%=nd.getDienThoai() %>" />
                </td>
            </tr>

            <tr>
                <td style="font-size: 1.2EM; font-weight: bold;">Địa chỉ: </td>
                <td>
                    <input size="50px" name="diaChi" type="text" value="<%=nd.getDiaChi() %>" />
                </td>
            </tr>

            <tr>
                <td style="font-size: 1.2EM; font-weight: bold;">Tên loại người dùng: </td>
                <td>
                    <input size="50px" name="tenLoaiNguoiDung" type="text" value="Thành Viên" />
                </td>
            </tr>

            <tr>
                <td style="font-size: 1.2EM; font-weight: bold;">Ngày đăng ký: </td>
                <td>
                    <input size="50px" name="ngayDangKy" type="text" value="<%=nd.getNgayDangKy() %>" />
                </td>
            </tr>      
        </table>
    </form>
</div>