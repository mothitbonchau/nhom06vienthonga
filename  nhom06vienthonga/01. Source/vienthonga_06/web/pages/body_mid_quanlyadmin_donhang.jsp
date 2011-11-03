<%-- 
    Document   : body_mid_quanlynguoidung_lichsumuahang
    Created on : Oct 25, 2011, 4:13:04 PM
    Author     : HP
--%>

<%@page import="MODEL.DAO.HinhThucThanhToanDAO"%>
<%@page import="MODEL.POJO.Hinhthucthanhtoan"%>
<%@page import="MODEL.DAO.NguoiDungDAO"%>
<%@page import="MODEL.POJO.Nguoidung"%>
<%@page import="MODEL.DAO.DonHangDAO"%>
<%@page import="MODEL.POJO.Donhang"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">

<%      
    List<Donhang> list = (List<Donhang>) request.getAttribute("dh");
%>

<style>
    .test tr
    {
        height: 30px;
    }
</style>
<div id="body_mid" style="float:left; width:76.5%;">
    <form method="post" action="process?task=quanlyadmin&task_chitiet=donhang">
        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">
            <tr align='center' style="background-color: #CCCCCC">
                <th>MĐH</th>            
                <th>Ngày Đặt</th>
                <th>Tên Người Dùng</th>
                <th>Tổng Tiền </th>
                <th>Giảm Giá </th>
                <th>Thành Tiền </th>
                <th>Hình Thức Thanh Toán </th>                
            </tr>
            <%
                for (int i = 0; i < list.size(); i++) {
                    List<Nguoidung> lisnd = NguoiDungDAO.LayListNguoiDung();
                    Hinhthucthanhtoan ht = HinhThucThanhToanDAO.LayHinhThucThanhToanTheoMa(list.get(i).getHinhthucthanhtoan().getMaHinhThucThanhToan());
            %>
            <tr>                
                <td>
                    <label>  
                        <a href="view?task=quanly&task_chitiet=donhang&quanlyadmin_donhang_chitietdonhang=ctdonhang&MDH=<%=list.get(i).getMaDonHang()%>"><%= list.get(i).getMaDonHang()%></a>
                        <input type='hidden' name='MaDonHang<%=list.get(i).getMaDonHang()%>' id='tbMaDonHang' value='<%=list.get(i).getMaDonHang()%>' style="width:120px;"/>
                    </label>    
                </td>
                <td>
                    <%=list.get(i).getNgayDat()%>
                    <label>                        
                        <input type='hidden' name='NgayDat<%=list.get(i).getMaDonHang()%>' id='tbNgayDat' value='<%=list.get(i).getNgayDat()%>' style="width:120px;"/>
                    </label>
                </td>
                <td>
                    <%=lisnd.get(i).getTenNguoiDung()%>
                    <label>
                        <input type='hidden' name='TenNguoiDung<%=list.get(i).getMaDonHang()%>' id='tbTenNguoiDung' value='<%=lisnd.get(i).getTenNguoiDung()%>' style="width:120px;"/>
                    </label>
                </td>
                <td>
                    <%= (int)list.get(i).getTongTien().doubleValue()%>
                    <label>
                        <input type='hidden' name='TongTien<%=list.get(i).getMaDonHang()%>' id='tbTongTien' value='<%=list.get(i).getTongTien()%>' style="width:120px;"/>
                    </label>        
                </td> 
                <td>
                    <%= (int)list.get(i).getGiamGia().doubleValue()%>
                    <label>
                        <input type='hidden' name='GiamGia<%= list.get(i).getMaDonHang()%>' id='tbGiamGia' value='<%=list.get(i).getGiamGia()%>' style="width:120px;"/>
                    </label>  
                </td>
                <td>
                    <%= (int)list.get(i).getThanhTien().doubleValue()%>
                    <label>
                        <input type='hidden' name='ThanhTien<%= list.get(i).getMaDonHang()%>' id='tbThanhTien' value='<%=list.get(i).getThanhTien()%>' style="width:120px;"/>
                    </label>
                </td>
                <td>
                    <%=ht.getTenHinhThucThanhToan()%>
                    <label>
                        <input type='hidden' name='HinhThucThanhToan<%=list.get(i).getMaDonHang()%>' id='tbHinhThucThanhToan' value='<%=ht.getTenHinhThucThanhToan()%>' style="width:150px;"/>
                    </label>
                </td>
            </tr>
            <% }%>
        </table>
    </form>
        
   
</div>