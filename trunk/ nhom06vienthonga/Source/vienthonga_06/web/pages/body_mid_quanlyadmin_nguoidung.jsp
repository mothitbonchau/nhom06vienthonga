<%-- 
    Document   : body_mid_quanlyuser
    Created on : Oct 4, 2011, 9:15:56 AM
    Author     : HP
--%>

<%@page import="MODEL.POJO.Loainguoidung"%>
<%@page import="java.util.List"%>
<%@page import="MODEL.POJO.Nguoidung"%>
<%@page import="MODEL.DAO.NguoiDungDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Nguoidung> list = NguoiDungDAO.LayListNguoiDung();
    
%>
<style>
    .test tr
    {
        height: 30px;
    }
</style>
<div id="body_mid" style="float:left; width:76.5%;">
    <form method="post" action="process?task=quanlyadmin&task_chitiet=nguoidung">
        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">            
            <tr align='center'>
                <td>Xóa</td>            
                <td>Tên Đăng Nhập</td>
                <td>Mật Khẩu</td>
                <td>Tên Người Dùng </td>
                <td>Email </td>
                <td>CMND </td>
                <td>Điện Thoại </td>
                <td>Địa Chỉ </td>
                <td>Loại Người Dùng </td>
                <td>Ngày Đăng Ký </td>
            </tr>
            <%
                for(int i=0; i< list.size() ; i++){  
                    Loainguoidung lnd = NguoiDungDAO.LayDoiTuongTheoMa(list.get(i).getLoainguoidung().getMaLoaiNguoiDung());
            %>
            
            <tr>
                <td align='center'>
                    <label>
                        <input type='checkbox' name='cbXoa' id='cbXoa' value='<%= list.get(i).getMaNguoiDung() %>' />
                    </label>
                </td>

                <td>
                    <label>
                        <input type='text' name='tbTenDangNhap' id='tbTenDangNhap' value='<%= list.get(i).getTenDangNhap() %>' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbMatKhau' id='tbMatKhau' value='<%= list.get(i).getMatKhau() %>' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbTenNguoiDung' id='tbTenNguoiDung' value='<%= list.get(i).getTenNguoiDung() %>' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbEmail' id='tbEmail' value='<%= list.get(i).getEmail() %>' style="width:100px;"/>
                    </label>
                </td> 
                <td>
                    <label>
                        <input type='text' name='tbCMND' id='tbCMND' value='<%= list.get(i).getCmnd() %>' style="width:80px;"/>
                    </label>  
                </td>
                <td>
                    <label>
                        <input type='text' name='tbDienThoai' id='tbDienThoai' value='<%= list.get(i).getDienThoai() %>' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbDiaChi' id='tbDiaChi' value='<%= list.get(i).getDiaChi() %>' style="width:100px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbTenLoaiNguoiDung' id='tbTenLoaiNguoiDung' value='<%= lnd.getTenLoaiNguoiDung() %>' style="width:60px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbNgayDangKy' id='tbNgayDangKy' value='<%= list.get(i).getNgayDangKy() %>' style="width:80px;"/>
                    </label>
                </td>                
            </tr>
            <%
               }
            %>
        </table>

        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">
            <tr>
            <td width='10%'>
            <label>
                <a href='xxx.jsp' ></a>
                <input type='submit' name='btThem' id='btThem' value='Thêm' style="height: 30px"/>
            </label>
            </td>                
            <td width='10%'>
            <label>
                <input type='submit' name='btCapNhat' id='btCapNhat' value='Cập Nhật' style="height: 30px"/>
            </label>
            </td>
            <td width='10%'>
            <label>
                <input type='submit' name='btXoaTatCa' id='btXoaTatCa' value='Xóa Tất Cả' style="height: 30px"/>
            </label>
            </td>

        </table>


    </form>

</div>

