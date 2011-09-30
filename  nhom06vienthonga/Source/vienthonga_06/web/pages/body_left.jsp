<%@page import="MODEL.POJO.Hang"%>
<%@page import="java.util.List"%>
<%@page import="MODEL.DAO.HangDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Hang> list = HangDAO.LayHang();
%>

<div id="body_left" style="float: left; width: 15%; margin-left: -25px;">
    <div class="highlightLev"> <div style="background: none repeat scroll 0% 0% transparent; width: 160px; height: 115px; display: none;" class="blocksearch">
            <a href="index.php?option=content&amp;task=news&amp;sectionid=5&amp;catid=10&amp;id=1747"><img src="images/linhtinh/icon_muahang.jpg" /></a>
        </div>
        <div style="background: none repeat scroll 0% 0% transparent; width: 160px; height: 160px;" class="blocksearch">
            <a href="http://www.hnammobile.com/index.php?option=content&amp;task=news&amp;sectionid=5&amp;catid=10&amp;id=2929">
                <img border="0" width="160" style="display: block; margin: 0pt auto;" src="images/linhtinh/_tuyendung.jpg" />
            </a>
        </div>	

        <br />
        <div class="blocSearch">
            <form style="background-image: url(images/linhtinh/bgd_top_timkiem.gif);" method="post" action="/" name="frmSearch" id="frmSearch">
                <input type="hidden" value="com_search" id="option" name="option" />
                <input type="hidden" value="search" id="task" name="task" />
                <h2>Tìm kiếm</h2>
                <input type="text" name="keywords" id="keywords" />
                <select name="type" id="type">
                    <option value="1">- Điện Thoại - </option>
                    <option value="2">- Phụ kiện - </option>
                    <option value="3">- Thẻ nhớ - </option>
                </select>
                <select name="brand" id="brand">
                    <option value="0">- Chọn hãng - </option>
                    <option value="9"> HTC </option><option value="16"> APPLE iPhone </option><option value="18"> APPLE iPad </option><option value="22"> ARCHOS </option><option value="2"> NOKIA </option><option value="3"> SAMSUNG </option><option value="4"> SONY ERICSSON </option><option value="11"> LG </option><option value="17"> BLACKBERRY </option><option value="5"> MOTOROLA </option><option value="19"> DELL </option><option value="20"> Q-Mobile </option><option value="21"> ALCATEL </option><option value="7"> Kho Máy Cũ </option>
                </select>

                <select style="width: 140px;" class="slsType01" name="priceFrom" id="priceFrom">
                    <option value="0">- Chọn Giá - </option>
                    <option value="1"> Dưới 1,000,000 </option>
                    <option value="1000000"> 1,000,000 đến 3,000,000 </option>
                    <option value="3000000"> 3,000,000 đến 5,000,000 </option>
                    <option value="5000000"> 5,000,000 đên 7,000,000 </option>
                    <option value="7000000"> 7,000,000 đến 9,000,000 </option>
                    <option value="9000000"> Trên 11,000,000 </option>
                </select>

                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody><tr>
                            <td width="50%"><input type="checkbox" style="width: 20px; border: 0pt none; background: none repeat scroll 0% 0% transparent;" value="touch" id="touch" name="touch" /><label class="stext">Cảm ứng</label></td>
                            <td width="50%"><input type="checkbox" style="width: 20px; border: 0pt none; background: none repeat scroll 0% 0% transparent;" value="3g" id="3g" name="3g" /><label class="stext">3G</label></td>
                        </tr>
                        <tr>
                            <td width="50%"><input type="checkbox" style="width: 20px; border: 0pt none; background: none repeat scroll 0% 0% transparent;" value="wifi" id="wifi" name="wifi" /><label class="stext">Wifi</label></td>
                            <td width="50%"><input type="checkbox" style="width: 20px; border: 0pt none; background: none repeat scroll 0% 0% transparent;" value="gps" id="gps" name="gps" /><label class="stext">GPS</label></td>
                        </tr>
                        <tr>
                            <td width="50%"><input type="checkbox" style="width: 20px; border: 0pt none; background: none repeat scroll 0% 0% transparent;" value="qwerty" id="qwerty" name="qwerty" /><label class="stext">Qwerty</label></td>
                            <td width="50%"><input type="checkbox" style="width: 20px; border: 0pt none; background: none repeat scroll 0% 0% transparent;" value="sim" id="sim" name="sim" /><label class="stext">2 Sim</label></td>
                        </tr>
                    </tbody>
                </table>


                <input type="image" class="btnSearch" name="Search" id="Search" src="images/linhtinh/btn_timkiem.gif" />

            </form>
        </div>
        <div class="blocCategory">
            <h2 style="background-image: url(images/linhtinh/bgd_title.gif)" >Sản phẩm</h2>
            <ul>
                <%
                for(int i=0; i<list.size(); i++)
                                       {
                    Hang h = list.get(i);
                    
                    %>
                    <li>
                    <a style="text-transform: none;" title="HTC chính hãng" href="/loai-dien-thoai/htc-showlist0.9.1.html"><%= h.getTenHang()%></a>
                    <span><img alt="HTC chính hãng" src="images/linhtinh/9_logo_htc.gif" /></span>
                </li> 
                    <%
                }
                %>
                               
            </ul>
        </div>                                                                                                                           
    </div>
</div>