<%-- 
    Document   : TrangDangKy
    Created on : Oct 1, 2011, 10:19:06 AM
    Author     : thien-anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="DangKy" />

<%
    if (request.getAttribute("thongbao") != null) {
%>
<script type='text/javascript' >
    alert('<%= request.getAttribute("thongbao")%>');
</script>
<%
    }
%>