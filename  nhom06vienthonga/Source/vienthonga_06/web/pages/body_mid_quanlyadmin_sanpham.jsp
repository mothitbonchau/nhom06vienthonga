<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="MODEL.POJO.*"%>
<%@page import="MODEL.DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    DecimalFormat df = new DecimalFormat("###,###,###");
    int tongsotrang = Integer.parseInt(request.getAttribute("tongsotrang").toString());
    List<Sanpham> list = (List<Sanpham>) request.getAttribute("list");
%>

<style>
    .test tr
    {
        height: 30px;
    }
</style>

<script type="text/javascript" >
    function submit_them()
    {
        var task = document.getElementById('task');
        task.setAttribute("name", "Them");
        var frm = document.getElementById('frm_sanpham');
        frm.setAttribute("action", "view?task=quanly&task_chitiet=sanpham");
        frm.submit();
    }
    function submit_capnhat()
    {
        var task = document.getElementById('task');
        task.setAttribute("name", "CapNhat");
        var frm = document.getElementById('frm_sanpham');
        frm.setAttribute("action", "process?task=quanlyadmin&task_chitiet=sanpham");
        frm.submit();
    }
    function submit_xoa()
    {
        var task = document.getElementById('task');
        task.setAttribute("name", "Xoa");
        var frm = document.getElementById('frm_sanpham');
        frm.setAttribute("action", "process?task=quanlyadmin&task_chitiet=sanpham");
        frm.submit();
    }
    
    function kiemtracheck()
    {
        var flag = 0;
        var id = document.getElementsByName('ID');
        for(var i=0; i<id.length; i++)
        {
            if(id[i].checked) 
            {
                flag = 1;
            }
        }

        if(flag == 0)
        {
            alert("Chưa chọn sản phẩm để cập nhật !!!");
            return false;
        }               
        
        return true;
    }
    
    function chuyen(task)
    {
        if(task == 'Them')
        {
            submit_them();
        }
        
        if(task == 'CapNhat')
        {
            if(kiemtracheck() == true)
            {
                submit_capnhat();
            }
        }
            
        if(task == 'Xoa')
        {
            if(kiemtracheck() == true)
            {
                submit_xoa();
            }
        }
    }
</script>

<div id="body_mid" style="float: left; width: 75%; margin-left: 0px;">
    <form id="frm_sanpham" method="post" action="">
        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">            
            <tr align='center' style="background-color: #CCCCCC">
            <th>ID</th>            
            <th>Mã Sản Phẩm</th>
            <th>Tên Sản Phẩm</th>
            <th>Loại Sản Phẩm</th>
            <th>Mã Hàng</th>
            <th>Số Lượng</th>
            <th>Giá Bán</th>
            <th>Màu Sắc</th>
            <th>Thời Gian Bảo Hành</th>
            <th>Kích Thước</th>
            <th>Trọng Lượng</th>
            <th>Tình Trạng</th>
            </tr>
            <%
                for (int i = 0; i < list.size(); i++) {
                    Sanpham sp = list.get(i);
            %>

            <tr>
            <td align='center'>
                <input type='checkbox' name='ID' id='ID' value='<%= i%>' />
            </td>
            <td>
                <a href="view?task=quanly&task_chitiet=sanpham&CapNhat=chitiet&MSP=<%= sp.getMaSanPham()%>" style="width:50px;"><%= sp.getMaSanPham()%></a>
                <input type='hidden' name='MaSanPham' id='MaSanPham' value='<%= sp.getMaSanPham()%>'/>
            </td>
            <td>
                <input type='text' name='TenSanPham' id='TenSanPham' value='<%= sp.getTenSanPham()%>' style="width:90px;"/>
            </td>
            <td>
                <input readonly="readonly" type='text' name='TenLoaiSanPham' id='TenLoaiSanPham' value='<%= sp.getLoaisanpham().getTenLoaiSanPham()%>' style="width:80px;"/>
                <input type='hidden' name='MaLoaiSanPham' id='MaLoaiSanPham' value='<%= sp.getLoaisanpham().getMaLoaiSanPham()%>' style="width:80px;"/>
            </td>
            <td>
                <input readonly="readonly" type='text' name='TenHang' id='TenHang' value='<%= sp.getHang().getTenHang()%>' style="width:60px;"/>
                <input type='hidden' name='MaHang' id='MaHang' value='<%= sp.getHang().getMaHang()%>' style="width:60px;"/>                
            </td> 
            <td>
                <input type='text' name='SoLuong' id='SoLuong' value='<%= sp.getSoLuong()%>' style="width:60px;"/>
            </td>
            <td>
                <input type='text' name='GiaBan' id='GiaBan' value='<%= df.format(sp.getGiaBan())%>' style="width:80px;"/>
            </td>
            <td>
                <input type='text' name='MauSac' id='MauSac' value='<%= sp.getMauSac()%>' style="width:50px;"/>
            </td>
            <td>
                <input type='text' name='ThoiGianBaoHanh' id='ThoiGianBaoHanh' value='<%= sp.getThoiGianBaoHanh()%>' style="width:75px;"/>
            </td>
            <td>
                <input type='text' name='KichThuoc' id='KichThuoc' value='<%= sp.getKichThuoc()%>' style="width:80px;"/>
            </td>
            <td>
                <input type='text' name='TrongLuong' id='TrongLuong' value='<%= sp.getTrongLuong()%>' style="width:50px;"/>
            </td>
            <td>
                <input type='text' name='TinhTrang' id='TinhTrang' value='<%= sp.getTinhTrang()%>' style="width:25px;"/>
            </td>
            </tr>
            <%                }
            %>
        </table>

        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">
            <tr>
            <td align="center">
                <input type='button' name="Them" id='Them' value='Thêm' style="height: 30px" onclick="chuyen('Them');" />
            <span>&nbsp;</span>
            <input type='button' name="CapNhat" id='CapNhat' value='Cập Nhật' style="height: 30px" onclick="chuyen('CapNhat');" />
            <span>&nbsp;</span>
            <input type='button' name="Xoa" id='Xoa' value='Xóa' style="height: 30px" onclick="chuyen('Xoa');" />
            </td>
            </tr>
        </table>
        <input type="hidden" name="" id="task" />
    </form>

    <!-- bắt đầu phân trang -->
    <%
        int sotrang = 1;
        if (request.getParameter("trang") != null) {
            sotrang = Integer.parseInt(request.getParameter("trang").toString());
        }
    %>
    <div class="paging" style="width: 100%">
        <div class="_paging" style="width: 200px; text-align: right;">
            <%
                if (sotrang - 1 < 1) {
            %>
            <a href="view?task=quanly&task_chitiet=sanpham&trang=1" > Trang Đầu </a>
            <%            } else {
            %>
            <a href="view?task=quanly&task_chitiet=sanpham&trang=<%= sotrang - 1%>" > <%= sotrang - 1%> </a>
            <%
                }
            %>            
            <a href="view?task=quanly&task_chitiet=sanpham&trang=<%= sotrang%>" > <%= sotrang%> </a>
            <%
                if (sotrang + 1 > tongsotrang) {
            %>
            <a href="view?task=quanly&task_chitiet=sanpham&trang=<%= tongsotrang%>" > Trang Cuối </a>
            <%
            } else {
            %>
            <a href="view?task=quanly&task_chitiet=sanpham&trang=<%= sotrang + 1%>" > <%= sotrang + 1%> </a>
            <%
                }
            %>
        </div>
    </div>
    <!-- kết thúc phân trang -->
</div>