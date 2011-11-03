<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="MODEL.POJO.*"%>
<%@page import="MODEL.DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    int tongsotrang = Integer.parseInt(request.getAttribute("tongsotrang").toString());
    List<Khuyenmai> list = (List<Khuyenmai>) request.getAttribute("list");
%>

<script type="text/javascript" >
    function submit_them()
    {
        var task = document.getElementById('task');
        task.setAttribute("name", "Them");
        var frm = document.getElementById('frm_khuyenmai');
        frm.setAttribute("action", "view?task=quanly&task_chitiet=khuyenmai");
        frm.submit();
    }
    function submit_capnhat()
    {
        var task = document.getElementById('task');
        task.setAttribute("name", "CapNhat");
        var frm = document.getElementById('frm_khuyenmai');
        frm.setAttribute("action", "process?task=quanlyadmin&task_chitiet=khuyenmai");
        frm.submit();
    }
    function submit_xoa()
    {
        var task = document.getElementById('task');
        task.setAttribute("name", "Xoa");
        var frm = document.getElementById('frm_khuyenmai');
        frm.setAttribute("action", "process?task=quanlyadmin&task_chitiet=khuyenmai");
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
            alert("Chưa chọn khuyến mãi để cập nhật !!!");
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
    <form id="frm_khuyenmai" method="post" action="">
        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">            
            <tr align='center' style="background-color: #CCCCCC">
            <th>ID</th>            
            <th>Mã Khuyến Mãi</th>
            <th>Tên Khuyến Mãi</th>
            <th>Ngày Bắt Đầu</th>
            <th>Ngày Kết Thúc</th>
            <th>Tình Trạng</th>            
            </tr>

            <%
                for (int i = 0; i < list.size(); i++) {
                    Khuyenmai km = list.get(i);
            %>
            <tr>
            <td align='center'>
                <input type='checkbox' name='ID' id='ID' value='<%= i%>' />
            </td>
            <td align='center'>
                <a href="view?task=quanly&task_chitiet=khuyenmai&CapNhat=chitiet&MKM=<%= km.getMaKhuyenMai()%>"><%= km.getMaKhuyenMai()%></a>
                <input type='hidden' name='MaKhuyenMai' id='MaKhuyenMai' value='<%= km.getMaKhuyenMai()%>' />
            </td>
            <td align='center'>
                <input type='text' name='TenKhuyenMai' id='TenKhuyenMai' value='<%= km.getTenKhuyenMai()%>' />
            </td>
            <td align='center'>
                <input type='text' name='NgayBatDau' id='NgayBatDau' value='<%= sdf.format(km.getNgayBatDau())%>' />
            </td>
            <td align='center'>
                <input type='text' name='NgayKetThuc' id='NgayKetThuc' value='<%= sdf.format(km.getNgayKetThuc())%>' />
            </td>
            <td align='center'>
                <input type='text' name='TinhTrang' id='TinhTrang' value='<%= km.getTinhTrang()%>' style="width:25px;"/>
            </td>
            </tr>
            <%                    }
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
            <a href="view?task=quanly&task_chitiet=khuyenmai&trang=1" > Trang Đầu </a>
            <%            } else {
            %>
            <a href="view?task=quanly&task_chitiet=khuyenmai&trang=<%= sotrang - 1%>" > <%= sotrang - 1%> </a>
            <%
                }
            %>            
            <a href="view?task=quanly&task_chitiet=khuyenmai&trang=<%= sotrang%>" > <%= sotrang%> </a>
            <%
                if (sotrang + 1 > tongsotrang) {
            %>
            <a href="view?task=quanly&task_chitiet=khuyenmai&trang=<%= tongsotrang%>" > Trang Cuối </a>
            <%
            } else {
            %>
            <a href="view?task=quanly&task_chitiet=khuyenmai&trang=<%= sotrang + 1%>" > <%= sotrang + 1%> </a>
            <%
                }
            %>
        </div>
    </div>
    <!-- kết thúc phân trang -->
</div>