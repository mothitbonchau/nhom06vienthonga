<%-- 
    Document   : body_mid_quanlyuser
    Created on : Oct 4, 2011, 9:15:56 AM
    Author     : HP
--%>

<%@page import="MODEL.DAO.LoaiNguoiDungDAO"%>
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
                <th>Xóa</th>            
                <th>Tên Đăng Nhập</th>
                <th>Mật Khẩu</th>
                <th>Tên Người Dùng </th>
                <th>Email </th>
                <th>CMND </th>
                <th>Điện Thoại </th>
                <th>Địa Chỉ </th>
                <th>Loại Người Dùng </th>
                <th>Ngày Đăng Ký </th>
                <th>Cập Nhật</th>
            </tr>
            <%
                for(int i=0; i< list.size() ; i++){  
                    Loainguoidung lnd = NguoiDungDAO.LayDoiTuongTheoMa(list.get(i).getLoainguoidung().getMaLoaiNguoiDung());
            %>
            
            <tr>
                <td align='center'>
                    <label>
                        <input type='checkbox' name='cbXoa' id='cbXoa' value='<%= list.get(i).getMaNguoiDung()%>' />
                    </label>
                </td>

                <td>
                    <label>
                        <input type='text' name='tbTenDangNhap<%=list.get(i).getMaNguoiDung()%>' id='tbTenDangNhap' value='<%= list.get(i).getTenDangNhap() %>' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbMatKhau<%=list.get(i).getMaNguoiDung()%>' id='tbMatKhau' value='<%= list.get(i).getMatKhau() %>' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbTenNguoiDung<%=list.get(i).getMaNguoiDung()%>' id='tbTenNguoiDung' value='<%= list.get(i).getTenNguoiDung() %>' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbEmail<%=list.get(i).getMaNguoiDung()%>' id='tbEmail' value='<%= list.get(i).getEmail() %>' style="width:100px;"/>
                    </label>
                </td> 
                <td>
                    <label>
                        <input type='text' name='tbCMND<%=list.get(i).getMaNguoiDung()%>' id='tbCMND' value='<%= list.get(i).getCmnd() %>' style="width:80px;"/>
                    </label>  
                </td>
                <td>
                    <label>
                        <input type='text' name='tbDienThoai<%=list.get(i).getMaNguoiDung()%>' id='tbDienThoai' value='<%= list.get(i).getDienThoai() %>' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbDiaChi<%=list.get(i).getMaNguoiDung()%>' id='tbDiaChi' value='<%= list.get(i).getDiaChi() %>' style="width:100px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbTenLoaiNguoiDung<%=list.get(i).getMaNguoiDung()%>' id='tbTenLoaiNguoiDung' value='<%= lnd.getTenLoaiNguoiDung() %>' style="width:110px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbNgayDangKy<%=list.get(i).getMaNguoiDung()%>' id='tbNgayDangKy' value='<%= list.get(i).getNgayDangKy() %>' style="width:80px; visibility:inherit; " />
                    </label>
                </td>
                <td align='center'>
                    <label>
                        <input type='checkbox' name='cbCapnhat' id='cbCapnhat' value='<%= list.get(i).getMaNguoiDung()%>' />
                    </label>
                </td>
            </tr>
            <%
               }
            %>
            
            <!-- Dòng mới để thêm 1 User mới -->
            <tr>
                <td align='center'>
                    <label>
                        
                    </label>
                </td>

                <td>
                    <label>
                        <input type='text' name='tbTenDangNhapMoi' id='tbTenDangNhapMoi' value='' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbMatKhauMoi' id='tbMatKhauMoi' value='' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbTenNguoiDungMoi' id='tbTenNguoiDungMoi' value='' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbEmailMoi' id='tbEmailMoi' value='' style="width:100px;"/>
                    </label>
                </td> 
                <td>
                    <label>
                        <input type='text' name='tbCMNDMoi' id='tbCMNDMoi' value='' style="width:80px;"/>
                    </label>  
                </td>
                <td>
                    <label>
                        <input type='text' name='tbDienThoaiMoi' id='tbDienThoaiMoi' value='' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='tbDiaChiMoi' id='tbDiaChiMoi' value='' style="width:100px;"/>
                    </label>
                </td>
                <td>
                    <select name="LND" id="LND">
                        <option value="-1">-Loại Người Dùng-</option>
                        <%
                            List<Loainguoidung> listlnd = LoaiNguoiDungDAO.LayListLoaiNguoiDung();
                            for (int i = 0; i < listlnd.size(); i++) {
                                %>
                                <option value="<%= listlnd.get(i).getMaLoaiNguoiDung() %>">- <%= listlnd.get(i).getTenLoaiNguoiDung()%> -</option>                            
                                <%
                            }
                        %>
                    </select>
                </td>
                <td>
                    <label>
                        <%
                            //Lấy giờ hệ thống
                            long current_time = System.currentTimeMillis();
                            java.sql.Date NgayHienTai = new java.sql.Date(current_time);
                        %>
                        <input type='text' name='tbNgayDangKyMoi' id='tbNgayDangKyMoi' value='<%= NgayHienTai %>' style="width:80px;"/>
                    </label>
                </td>
                
            </tr>
            <!-- -->
            
        </table>

        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">
            <tr>
            <td width='10%'>
            <label>              
                <input type='submit' name='btnThem' id='btThem' value='Thêm' style="height: 30px"/>             
            </label>
            </td>                
            <td width='10%'>
            <label>             
                <input type='submit' name='btnCapNhat' id='btCapNhat' value='Cập Nhật' style="height: 30px"/>              
            </label>
            </td>
            <td width='10%'>
            <label>             
                <input type='submit' name='btnXoa' id='btXoa' value='Xóa' style="height: 30px"/>                                
            </label>
            </td>

        </table>


    </form>

</div>

