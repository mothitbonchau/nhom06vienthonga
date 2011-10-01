<%@page import="MODEL.DAO.ThamSoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
    session.setAttribute("images", ThamSoDao.LayDuongDanHinhAnh());
    
    response.sendRedirect("view");
%>