<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<%
    if (request.getAttribute("thongbao") != null) {
%>
<script type='text/javascript' >
    alert('<%= request.getAttribute("thongbao")%>');
</script>
<%
    }
%>

<tiles:insertDefinition name="quanlyadmin_congty" />