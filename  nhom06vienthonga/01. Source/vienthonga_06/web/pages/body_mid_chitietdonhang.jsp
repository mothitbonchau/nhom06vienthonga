
<%@page import="MODEL.DAO.SanPhamDAO"%>
<%@page import="MODEL.POJO.Sanpham"%>
<%@page import="java.util.List"%>
<%@page import="MODEL.POJO.Donhang"%>
<%@page import="MODEL.POJO.Chitietdonhang"%>
<%@page import="MODEL.DAO.ChiTietDonHangDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%
    
    List<Chitietdonhang> listctdh = (List <Chitietdonhang>)request.getAttribute("lichsumuahang");
    int i=1;
%>
<div id="body_mid" style="float:left; width:76.5%;">    
     <form method="post" action="process?task=quanlynguoidung&task_chitiet=lichsumuahang">
        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">
            <tr align='center' style="background-color: #CCCCCC">
                <th>MĐH</th>            
                <th>Tên Sản Phẩm</th>
                <th>Số Lượng</th>
                <th>Đơn Giá</th>
                <th>Giảm Giá </th>
                <th>Thành Tiền </th>
                <th>Trạng Thái</th>                
            </tr>  
            <%
            for(i = 0; i<listctdh.size(); i++){
                Sanpham sp = listctdh.get(i).getSanpham();                
            
            %>
            
            <tr>                
                <td>
                    <label>                          
                        <input type='text' name='MaChiTietDonHang' id='tbMaChiTietDonHang' value='<%=listctdh.get(i).getMaChiTietDonHang() %>' style="width:80px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='MaSanPham' id='tbMaSanPham' value='<%=sp.getTenSanPham() %>' style="width:110px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='SoLuong' id='tbSoLuong' value='<%=listctdh.get(i).getSoLuong() %>' style="width:110px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='DonGia' id='tbDonGia' value='<%=listctdh.get(i).getDonGia() %>' style="width:110px;"/>
                    </label>
                </td> 
                <td>
                    <label>
                        <input type='text' name='GiamGia' id='tbGiamGia' value='<%=listctdh.get(i).getGiamGia() %>' style="width:110px;"/>
                    </label>  
                </td>
                <td>
                    <label>
                        <input type='text' name='ThanhTien' id='tbThanhTien' value='<%=listctdh.get(i).getThanhTien() %>' style="width:110px;"/>
                    </label>
                </td>
                <td>
                    <label>
                        <input type='text' name='TrangThai' id='tbTrangThai' value='<%=listctdh.get(i).getTinhTrang() %>' style="width:90px;"/>
                    </label>
                </td>
            </tr>
            <%
            }
            %>
        </table>
     </form>
</div>