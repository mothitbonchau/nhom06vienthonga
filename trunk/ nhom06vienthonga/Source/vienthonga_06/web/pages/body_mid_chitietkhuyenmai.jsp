<%@page import="MODEL.POJO.Khuyenmai"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
    Khuyenmai km = (Khuyenmai) request.getAttribute("khuyenmai");
%>

<div id="body_mid" style="float:left; width:60%;">
    <div class="newsDetail" style="margin-left: 10px;">
        <h3><%= km.getTenKhuyenMai() %> <span>(<%= sdf.format(km.getNgayBatDau()) %> đến <%= sdf.format(km.getNgayKetThuc()) %>)</span></h3>

        <p><%= km.getNoiDungKhuyenMai() %></p>
    </div>
</div>