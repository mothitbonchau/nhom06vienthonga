<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<tiles:insertDefinition name="quanlyadmin_sanpham" />

<%
    if (request.getAttribute("thongbao") != null) {
%>
<script type='text/javascript' >
    alert('<%= request.getAttribute("thongbao")%>');
</script>
<%        
    }
%>