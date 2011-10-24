<%@page import="MODEL.DAO.ThamSoDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="MODEL.POJO.Hinhanhkhuyenmai"%>
<%@page import="MODEL.DAO.KhuyenMaiDAO"%>
<%@page import="MODEL.POJO.Khuyenmai"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int tongsotrang = Integer.parseInt(request.getAttribute("tongsotrang").toString());
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    List<Khuyenmai> list = (List<Khuyenmai>) request.getAttribute("list");
%>

<div id="body_mid" style="float:left; width:60%;">
    <div class="news">
        &nbsp;
        <%
            for (int i = 0; i < list.size(); i++) {
                Hinhanhkhuyenmai hakm = (Hinhanhkhuyenmai) list.get(i).getHinhanhkhuyenmais().toArray()[0];
                if (!hakm.getDuongDan().startsWith("http")) {
                    String path = ThamSoDAO.LayDuongDanHinhAnh() + "khuyen mai/" + hakm.getDuongDan();
                    hakm.setDuongDan(path);
                }
        %>
        <div class="news_block">
            <a href="view?task=khuyenmai&task_chitiet=chitietkhuyenmai&MKM=<%= list.get(i).getMaKhuyenMai()%>">
                <img height="100" width="130" class="sborder" src="<%= hakm.getDuongDan()%>">
            </a>

            <div>
                <a href="view?task=khuyenmai&task_chitiet=chitietkhuyenmai&MKM=<%= list.get(i).getMaKhuyenMai()%>"><%= list.get(i).getTenKhuyenMai()%> <span>(<%= sdf.format(list.get(i).getNgayBatDau())%> đến <%= sdf.format(list.get(i).getNgayKetThuc())%>)</span></a>
                <p>
                    Click tiêu đề để xem thông tin
                </p>
            </div>
        </div>
        <%    }
        %>
        <!-- bắt đầu phân trang -->
        <%
            int sotrang = 1;
            if (request.getParameter("trang") != null) {
                sotrang = Integer.parseInt(request.getParameter("trang").toString());
            }
        %>
        <div style="padding: 0pt;" class="paging">
            <div class="_paging" style="width: 200px;">
                <%
                    if (sotrang - 1 < 1) {
                %>
                <a href="view?task=khuyenmai&trang=1" > Trang Đầu </a>
                <%            } else {
                %>
                <a href="view?task=khuyenmai&trang=<%= sotrang - 1%>" > <%= sotrang - 1%> </a>
                <%
                    }
                %>            
                <a href="view?task=khuyenmai&trang=<%= sotrang%>" > <%= sotrang%> </a>
                <%
                    if (sotrang + 1 > tongsotrang) {
                %>
                <a href="view?task=khuyenmai&trang=<%= tongsotrang%>" > Trang Cuối </a>
                <%
                } else {
                %>
                <a href="view?task=khuyenmai&trang=<%= sotrang + 1%>" > <%= sotrang + 1%> </a>
                <%
                    }
                %>
            </div>
        </div>
        <!-- kết thúc phân trang -->
    </div>
</div>