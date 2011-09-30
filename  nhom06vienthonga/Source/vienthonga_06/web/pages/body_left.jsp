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
        <div class="blocCategory">
            <h2 style="background-image: url(images/linhtinh/bgd_title.gif)" >Phụ kiện</h2>
            <ul>
                <li><a alt="Phụ kiện  chính hãng gía rẻ" title="Phụ kiện  chính hãng " href="http://www.hnammobile.com/component/option,com_accesories/task,memory/">Thẻ nhớ</a></li>
                <li><a alt="Phụ kiện Đầu đọc thẻ nhớ chính hãng gía rẻ" title="Phụ kiện Đầu đọc thẻ nhớ chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,12/">Đầu đọc thẻ nhớ</a></li><li><a alt="Phụ kiện USB Flash &amp; USB 3G chính hãng gía rẻ" title="Phụ kiện USB Flash &amp; USB 3G chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,13/">USB Flash &amp; USB 3G</a></li><li><a alt="Phụ kiện Phụ kiện Samsung chính hãng gía rẻ" title="Phụ kiện Phụ kiện Samsung chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,14/">Phụ kiện Samsung</a></li><li><a alt="Phụ kiện Phụ kiện HTC chính hãng gía rẻ" title="Phụ kiện Phụ kiện HTC chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,15/">Phụ kiện HTC</a></li><li><a alt="Phụ kiện Tai nghe Bluetooth chính hãng gía rẻ" title="Phụ kiện Tai nghe Bluetooth chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,2/">Tai nghe Bluetooth</a></li><li><a alt="Phụ kiện Phụ kiện iPhone 3 chính hãng gía rẻ" title="Phụ kiện Phụ kiện iPhone 3 chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,7/">Phụ kiện iPhone 3</a></li><li><a alt="Phụ kiện Phụ kiện iPhone 4 chính hãng gía rẻ" title="Phụ kiện Phụ kiện iPhone 4 chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,11/">Phụ kiện iPhone 4</a></li><li><a alt="Phụ kiện Phụ kiện iPad/iPad2 chính hãng gía rẻ" title="Phụ kiện Phụ kiện iPad/iPad2 chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,1/">Phụ kiện iPad/iPad2</a></li><li><a alt="Phụ kiện Phụ kiện Sony Ericsson chính hãng gía rẻ" title="Phụ kiện Phụ kiện Sony Ericsson chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,10/">Phụ kiện Sony Ericsson</a></li><li><a alt="Phụ kiện Loa di động chính hãng gía rẻ" title="Phụ kiện Loa di động chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,3/">Loa di động</a></li><li><a alt="Phụ kiện Sạc nhanh, sạc otô chính hãng gía rẻ" title="Phụ kiện Sạc nhanh, sạc otô chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,5/">Sạc nhanh, sạc otô</a></li><li><a alt="Phụ kiện Pin (Battery) chính hãng gía rẻ" title="Phụ kiện Pin (Battery) chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,6/">Pin (Battery)</a></li><li><a alt="Phụ kiện Miếng dán màn hình chính hãng gía rẻ" title="Phụ kiện Miếng dán màn hình chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,9/">Miếng dán màn hình</a></li><li><a alt="Phụ kiện Miếng dán da chính hãng gía rẻ" title="Phụ kiện Miếng dán da chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,16/">Miếng dán da</a></li><li><a alt="Phụ kiện Phụ kiện khác chính hãng gía rẻ" title="Phụ kiện Phụ kiện khác chính hãng gía rẻ" href="http://www.hnammobile.com/component/option,com_accesories/task,type/tid,4/">Phụ kiện khác</a></li>
            </ul>
        </div>
        <div class="blocCategory">
            <h2 style="background-image: url(images/linhtinh/bgd_title.gif)">Thông tin</h2>
            <ul>
                <li><a title="Giới thiệu Hnam" href="http://www.hnammobile.com/tin-tuc/gioi-thieu.4.9.0.html">Giới thiệu Hnam</a></li>
                <li><a title="Thông tin khuyến mãi" href="/khuyen-mai">Thông tin khuyến mãi</a></li>
                <li><a title="Tin tức ĐTDD" href="/tin-tuc">Tin tức ĐTDD</a></li>
                <li><a title="Thủ thuật điện thoại" href="/thu-thuat">Thủ thuật điện thoại</a></li>
                <li><a title="Chế độ bảo hành" href="component/option,com_content/task,news/sectionid,4/catid,7/">Chế độ bảo hành</a></li>
            </ul>
        </div>
        <div class="blocCategory">
            <h2 style="background-image: url(images/linhtinh/bgd_title.gif)">Cài đặt</h2>
            <ul>
                <li class=""><a title="Nâng cấp I-Phone" href="/thong-tin/nang-cap-i-phone.3.4.html">Nâng cấp I-Phone</a></li><li class=""><a title="Cài đặt iPhone/iPad " href="/thong-tin/cai-dat-iphoneipad.3.5.html">Cài đặt iPhone/iPad </a></li>
            </ul>
        </div>                                                                                                                            
    </div>
</div>