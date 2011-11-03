<%-- 
    Document   : QuanLyNguoiDung_LichSuMuaHang
    Created on : Oct 25, 2011, 4:20:49 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
String lnd = request.getAttribute("mlnd").toString();
if(lnd.equals("MLND1"))
       {
    %>
    <tiles:insertDefinition name="quanlyadmin_lichsumuahang"/>
    <%
}
if(lnd.equals("MLND2"))
       {
  %>
  <tiles:insertDefinition name="quanlynguoidung_lichsumuahang"/>
  <%
}
if(lnd.equals("MLND3"))
       {
  %>
  <tiles:insertDefinition name="quanlynhanvien_lichsumuahang"/>
  <%
}
%>