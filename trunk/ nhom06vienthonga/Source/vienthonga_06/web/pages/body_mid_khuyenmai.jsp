<%@page import="MODEL.POJO.Hinhanhkhuyenmai"%>
<%@page import="MODEL.DAO.KhuyenMaiDAO"%>
<%@page import="MODEL.POJO.Khuyenmai"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Khuyenmai> list = KhuyenMaiDAO.LayKhuyenMai();    
%>


<div id="body_mid" style="float:left; width:60%;">
    <div class="news">
        &nbsp;
        <%
            for (int i = 0; i < list.size(); i++) {
                Hinhanhkhuyenmai hakm = (Hinhanhkhuyenmai) list.get(i).getHinhanhkhuyenmais().toArray()[0];
        %>
        <div class="news_block">
            <a href="view?task=khuyenmai&task_chitiet=chitietkhuyenmai&MKM=<%= list.get(i).getMaKhuyenMai() %>">
                <img height="100" width="130" class="sborder" src="<%= hakm.getDuongDan() %>">
            </a>

            <div>
                <a href="view?task=khuyenmai&task_chitiet=chitietkhuyenmai&MKM=<%= list.get(i).getMaKhuyenMai() %>"><%= list.get(i).getTenKhuyenMai() %> <span>(<%= list.get(i).getNgayBatDau().toString() %>)</span></a>
                <p>
                    <%= list.get(i).getNoiDungKhuyenMai() %>
                </p>
            </div>
        </div>
        <%    }
        %>
        <!--
        <div style="padding: 0pt;" class="paging">	
            <div class="_paging" style="width: 200px;">
                <a title="1" class="selected">1</a>
                <a title="2" href="/khuyen-mai/trang20.html">2</a>
                <a title="3" href="/khuyen-mai/trang40.html">3</a>
            </div>
        </div>
        -->
    </div>
</div>