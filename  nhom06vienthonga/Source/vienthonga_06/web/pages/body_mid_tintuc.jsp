<%@page import="java.text.SimpleDateFormat"%>
<%@page import="MODEL.DAO.*"%>
<%@page import="MODEL.POJO.*"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int tongsotrang = Integer.parseInt(request.getAttribute("tongsotrang").toString());
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    List<Tintuc> list = (List<Tintuc>) request.getAttribute("list");
%>

<div id="body_mid" style="float:left; width:60%;">
    <div class="news">
        &nbsp;
        <%
            for (int i = 0; i < list.size(); i++) {
                Hinhanhtintuc hatt = (Hinhanhtintuc) list.get(i).getHinhanhtintucs().toArray()[0];
        %>
        <div class="news_block">
            <a href="view?task=tintuc&task_chitiet=chitiettintuc&MTT=<%= list.get(i).getMaTinTuc()%>">
                <img height="100" width="130" class="sborder" src="<%= hatt.getDuongDan()%>">
            </a>

            <div>
                <a href="view?task=tintuc&task_chitiet=chitiettintuc&MTT=<%= list.get(i).getMaTinTuc()%>"><%= list.get(i).getTenTinTuc()%> <span>(Ngày đăng: <%= sdf.format(list.get(i).getNgayDang())%>)</span></a>
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
                <a href="view?task=tintuc&trang=1" > Trang Đầu </a>
                <%            } else {
                %>
                <a href="view?task=tintuc&trang=<%= sotrang - 1%>" > <%= sotrang - 1%> </a>
                <%
                    }
                %>            
                <a href="view?task=tintuc&trang=<%= sotrang%>" > <%= sotrang%> </a>
                <%
                    if (sotrang + 1 > tongsotrang) {
                %>
                <a href="view?task=tintuc&trang=<%= tongsotrang%>" > Trang Cuối </a>
                <%
                } else {
                %>
                <a href="view?task=tintuc&trang=<%= sotrang + 1%>" > <%= sotrang + 1%> </a>
                <%
                    }
                %>
            </div>
        </div>
        <!-- kết thúc phân trang -->
    </div>
</div>