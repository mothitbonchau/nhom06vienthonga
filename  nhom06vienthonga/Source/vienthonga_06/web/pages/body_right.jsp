<%@page import="java.util.List"%>
<%@page import="MODEL.DAO.KhuyenMaiDAO"%>
<%@page import="MODEL.POJO.Khuyenmai"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Khuyenmai> list = KhuyenMaiDAO.LayKhuyenMai();
%>

<div id="body_right" style="float:left; width:15%;" >
    <div class="contextual" > 
        <div style="display: block; line-height: 1px;" class="slogan">
            <img border="0" width="160" style="display: block; margin: 0pt auto;" src="images/linhtinh/response.gif" />
        </div>
        <div style="display:block; line-height:1px;" class="slogan">
            <a style="display: none;" href="http://www.hnammobile.com/index.php?option=content&amp;task=news&amp;sectionid=5&amp;catid=10&amp;id=2929">
                <img border="0" width="160" style="display: block; margin: 0pt auto;" src="images/linhtinh/_tuyendung.jpg" />
            </a>
            <br/>
            <a href="http://www.hnammobile.com/index.php?option=content&amp;task=news&amp;sectionid=5&amp;catid=10&amp;id=1747">
                <img src="images/linhtinh/icon_muahang.jpg" />
            </a>
        </div>
        <div style="display: none;" class="supportOnline">
            <h2>Hỗ trợ trực tuyến</h2>
            <ul>
                <li class="messenger"><a title="PassionMoblie" href="ymsgr:sendIM?hnammobile">PassionMoblie</a></li>
                <li class="phone">(08) 66 59 69 79</li>
            </ul>
        </div>
        <div class="supportOnline" style="background-image: url(images/linhtinh/border_03.gif)">
            <h2 style="background: url(images/linhtinh/bgd_title.gif) no-repeat scroll left transparent; text-align:center; padding-top: 10px;">Hỗ trợ bán hàng</h2>
            <ul>
                <li style="background: url(images/linhtinh/phone_03.gif) no-repeat scroll left center transparent;" class="phone">
                    <a href="ymsgr:addfriend?sau_con_89">
                        <img src="http://opi.yahoo.com/online?u=sau_con_89&m=g&t=1" border="0">
                    </a>
                </li>
                <li style="background: url(images/linhtinh/phone_03.gif) no-repeat scroll left center transparent;" class="phone">
                    <a href="ymsgr:addfriend?anhangle292000">
                        <img src="http://opi.yahoo.com/online?u=anhangle292000&m=g&t=1" border="0">
                    </a>
                </li>
                <li style="background: url(images/linhtinh/phone_03.gif) no-repeat scroll left center transparent;" class="phone">
                    <a href="ymsgr:addfriend?pha_le_tim151189">
                        <img src="http://opi.yahoo.com/online?u=pha_le_tim151189&m=g&t=1" border="0">
                    </a>
                </li>
            </ul>
        </div>

        <div class="blocNews" style="background-image: url(images/linhtinh/border_xanh03.gif); " >
            <h2 style="background: url(images/linhtinh/top_xanh_03.gif) no-repeat scroll left transparent; text-align:center; padding-top: 10px;">Thông tin khuyến mãi</h2>
            <ul>               
                <%
                    for (int i = 0; i < list.size() && i < 3; i++) {
                %>
                <li class="last">
                    <a title="<%= list.get(i).getTenKhuyenMai()%>" href="view?task=khuyenmai&task_chitiet=chitietkhuyenmai&MKM=<%= list.get(i).getMaKhuyenMai()%>"><%= list.get(i).getTenKhuyenMai()%></a>
                </li>  
                <%                        }
                %>
            </ul>
        </div>
        <br/>                                                                                                                                                                                                        
    </div>
</div>