<%-- 
    Document   : body_mid_quanlyuser
    Created on : Oct 4, 2011, 9:15:56 AM
    Author     : HP
--%>
<%@page import="MODEL.DAO.CongTyDAO"%>
<%@page import="MODEL.POJO.Congty"%>
<%
    Congty ct = CongTyDAO.LayCongTy();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="body_mid" style="float:left; width:76.5%;">   
    <form action="process?task=quanlyadmin&task_chitiet=capnhatcongty" method="post" style="margin-left: 10px;">
        <input name="maCongTy" type="hidden" value="<%= ct.getMaCongTy()%>" />
        
        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">
            <tr>
            <td colspan="2" align="center" style="font-size: 2EM; font-weight: bold; color: #a2c62d;">VIỄN THÔNG A</td>
            </tr>
            <tr>
            <td width="5%" style="font-size: 1.2EM; font-weight: bold;">Tên công ty: </td>
            <td width="20%"><input size="50px" name="tenCongTy" type="text" value="<%= ct.getTenCongTy()%>" /></td>
            <td width="5%"><input name="capnhat" type="submit" value="CẬP NHẬT" style="height: 20px;" /></td>
            <td width="5%"><input name="huy" type="reset" value="HUỶ" style="height: 20px;" /></td>
            </tr>
            <tr>
            <td style="font-size: 1.2EM; font-weight: bold;">Địa chỉ: </td>
            <td><input size="50px" name="diaChi" type="text" value="<%= ct.getDiaChi()%>" /></td>
            </tr>
            <tr>
            <td style="font-size: 1.2EM; font-weight: bold;">Điện thoại: </td>
            <td><input size="50px" name="dienThoai" type="text" value="<%= ct.getDienThoai()%>" /></td>
            </tr>
            <tr>
            <td style="font-size: 1.2EM; font-weight: bold;">Hotline: </td>
            <td><input size="50px" name="hotLine" type="text" value="<%= ct.getHotLine()%>" /></td>
            </tr>
            <tr>
            <td style="font-size: 1.2EM; font-weight: bold;">E-mail: </td>
            <td><input size="50px" name="email" type="text" value="<%= ct.getEmail()%>" /></td>
            </tr>
            <tr>
            <td style="font-size: 1.2EM; font-weight: bold;">Website: </td>
            <td><input size="50px" name="website" type="text" value="<%= ct.getWebsite()%>" /></td>
            </tr>
            <tr>
            <td style="font-size: 1.2EM; font-weight: bold;">Fax: </td>
            <td><input size="50px" name="fax" type="text" value="<%= ct.getFax()%>" /></td>
            </tr>
            <tr>
            <td style="font-size: 1.2EM; font-weight: bold;">Giới thiệu: </td>
            <td>
                <!--<legend><h1><span name="gioiThieu" ><%= ct.getGioiThieu()%></span></h1></legend>-->
                <!--<input size="50px" name="gioiThieu" type="text" value="<%= ct.getGioiThieu()%>" />-->
                <textarea cols="36px" rows="10px" name="gioiThieu"><%= ct.getGioiThieu()%></textarea>
            </td>
            </tr>
        </table>
    </form>
</div>