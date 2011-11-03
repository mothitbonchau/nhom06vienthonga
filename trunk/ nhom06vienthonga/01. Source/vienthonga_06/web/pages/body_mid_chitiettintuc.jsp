<%@page import="MODEL.POJO.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    Tintuc tt = (Tintuc) request.getAttribute("tintuc");
%>

<div id="body_mid" style="float:left; width:60%;">
    <div class="newsDetail" style="margin-left: 10px;">
        <h3><%= tt.getTenTinTuc() %> <span>(Ngày đăng: <%= sdf.format(tt.getNgayDang()) %>)</span></h3>

        <p><%= tt.getNoiDungTinTuc() %></p>
    </div>
</div>