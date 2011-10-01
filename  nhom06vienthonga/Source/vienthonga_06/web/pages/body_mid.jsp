<%@page import="MODEL.POJO.Hinhanhsanpham"%>
<%@page import="MODEL.POJO.Sanpham"%>
<%@page import="MODEL.DAO.SanphamDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Sanpham> list = SanphamDAO.LaySanPham();
%>

<div id="body_mid" style="float:left; width:60%;">
    <div class="contentCenter">                 
        <div class="topProducts"> 
            <h2 style="background-image: url(images/linhtinh/title_product.gif)">HÀNG BÁN CHẠY NHẤT</h2>
            <div class="topProductsWrap">
                <%
                    for (int i = 0; i < 10; i++) {
                        Hinhanhsanpham hasp = (Hinhanhsanpham) list.get(i).getHinhanhsanphams().toArray()[0];
                        String path_lsp = "";
                        String path_hang = "";
                        if(list.get(i).getLoaisanpham().getMaLoaiSanPham().equals("DT"))
                            path_lsp = "dienthoai/";
                        else
                            path_lsp = "laptop/";
                        path_hang = list.get(i).getHang().getTenHang() + "/";
                %>
                <div class="itemProducts">
                    <a href="http://www.hnammobile.com/dien-thoai/iphone-4-16gb-global.1253.html">
                        <img height="93" alt="iPhone 4 16Gb Global" src="<%= session.getAttribute("images") %><%= path_lsp %><%= path_hang %><%= hasp.getDuongDan() %>" />
                    </a>
                    <h3>
                        <a href="http://www.hnammobile.com/dien-thoai/iphone-4-16gb-global.1253.html"><%= list.get(i).getTenSanPham() %></a>
                    </h3>

                    <div style="bottom: 0pt; position: absolute; width: 100%; text-align: center; left: 0pt;">
                        <span style="line-height: 1.3em;"><%= list.get(i).getGiaBan().intValue() %> Đ</span>
                        <span style="color: BLUE;"><br />
                        </span>
                        <br />
                    </div>

                    <!--<div class="bonus"><strong>+  </strong>bao da</div>-->
                </div>  
                <%
                    }
                %>                
            </div>
        </div>                                                                                                                                                                                                        
        <br />
        <img style="margin-left: 10px;" alt="Advertisement" src="images/linhtinh/600x100_trungthuc.jpg" />

    </div>
</div>