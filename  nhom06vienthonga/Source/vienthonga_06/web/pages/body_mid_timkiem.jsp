<%@page import="MODEL.DAO.ThamSoDao"%>
<%@page import="MODEL.POJO.Hinhanhsanpham"%>
<%@page import="MODEL.POJO.Sanpham"%>
<%@page import="MODEL.DAO.SanPhamDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int tongsotrang = Integer.parseInt(request.getAttribute("tongsotrang").toString());
    List<Sanpham> list = (List<Sanpham>) request.getAttribute("list");
%>

<div id="body_mid" style="float:left; width:60%;">
    <div class="contentCenter">                 
        <div class="topProducts"> 
            <h2 style="background-image: url(images/linhtinh/title_product.gif)">Sản phẩm tìm được</h2>
            <div class="topProductsWrap">
                <%
                    for (int i = 0; i < list.size(); i++) {
                        Hinhanhsanpham hasp = (Hinhanhsanpham) list.get(i).getHinhanhsanphams().toArray()[0];
                        String path_lsp = "";
                        String path_hang = "";
                        if (list.get(i).getLoaisanpham().getMaLoaiSanPham().equals("DT")) {
                            path_lsp = "dien thoai/";
                        } else {
                            path_lsp = "laptop/";
                        }
                        path_hang = list.get(i).getHang().getTenHang() + "/";
                %>
                <div class="itemProducts">
                    <a href="view?task=chitietsanpham&MSP=<%= list.get(i).getMaSanPham()%>">
                        <img height="93" alt="<%= list.get(i).getTenSanPham()%>" src="<%= ThamSoDao.LayDuongDanHinhAnh()%><%= path_lsp%><%= path_hang%><%= hasp.getDuongDan()%>" />
                    </a>
                    <h3>
                        <a href="view?task=chitietsanpham&MSP=<%= list.get(i).getMaSanPham()%>"><%= list.get(i).getTenSanPham()%></a>
                    </h3>

                    <div style="bottom: 0pt; position: absolute; width: 100%; text-align: center; left: 0pt;">
                        <span style="line-height: 1.3em;"><%= list.get(i).getGiaBan().intValue()%> Đ</span>
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
        <!-- bắt đầu phân trang -->
        <%
            int sotrang = 1;
            if (request.getParameter("trang") != null) {
                sotrang = Integer.parseInt(request.getParameter("trang").toString());
            }
        %>
        
        <script type="text/javascript" >
            function show(t)
            {		
                document.getElementById("trang").value = t;
                document.getElementById("frmTimKiem").submit();
            }
        </script>
        
        <form action="process?task=timkiem" method="post" id="frmTimKiem" style="margin-bottom: 10px; height: 20px; text-align: center; font-size: 1.5em">
            <%
                if (sotrang - 1 < 1) {
            %>
            <a href="#" onclick="show(1);" > Trang Đầu </a>
            <%            } else {
            %>
            <a href="#" onclick="show(<%= sotrang - 1%>);" > <%= sotrang - 1%> </a>
            <%
                }
            %>            
            <a href="#" onclick="show(<%= sotrang%>);" > <%= sotrang%> </a>
            <%
                if (sotrang + 1 > tongsotrang) {
            %>
            <a href="#" onclick="show(<%= tongsotrang%>);"  > Trang Cuối </a>
            <%            } else {
            %>
            <a href="#" onclick="show(<%= sotrang + 1%>);" > <%= sotrang + 1%> </a>
            <%
                }
            %>
            <input type="hidden" name="MH" value="<%= request.getParameter("MH")%>" />
            <input type="hidden" name="TSP" value="<%= request.getParameter("TSP")%>" />
            <input type="hidden" name="MLSP" value="<%= request.getParameter("MLSP")%>" />
            <input type="hidden" name="Gia" value="<%= request.getParameter("Gia")%>" />
            <input type="hidden" name="trang" id="trang" value="" />
        </form>
        <!-- kết thúc phân trang -->
        <img style="margin-left: 10px;" alt="Advertisement" src="images/linhtinh/600x100_trungthuc.jpg" />

    </div>
</div>