<%-- 
    Document   : body_mid_lienhe
    Created on : Oct 16, 2011, 1:09:11 PM
    Author     : HP
--%>

<%@page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
<%@page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@page import="MODEL.DAO.VungDAO"%>
<%@page import="MODEL.POJO.Vung"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Vung> list = VungDAO.LayDanhSachVung();
%>
<link href="css/maintabletitle.css" rel="stylesheet" type="text/css" />
<link href="css/lienhe.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
    function show(tenvung)
    {
        if(tenvung == "Hồ Chí Minh")
        {
            var hienthi = document.getElementById('hienthi');
            var noidung = document.getElementById('HCM');
            hienthi.innerHTML = noidung.innerHTML;
            return;
        }

        if(tenvung == "Hà Nội ")
        {            
            var hthi = document.getElementById('hienthi');
            var ndung = document.getElementById('HN');
            hthi.innerHTML = ndung.innerHTML;
            return;
        }
    }
</script>

<div id="HCM" style="display: none;">
    <select class="timkiemlist" id="cboAddress" onChange="SetBranch()">
        <option selected="selected" value="0">Địa chỉ</option>
        <option value="HaiPhong_BigCHaiPhong.gif">adsfasjdkfhadskjhfl</option>
    </select>
</div>

<div id="HN" style="display: none;">
    <select class="timkiemlist" id="cboAddress" onChange="SetBranch()">
        <option selected="selected" value="0">Địa chỉ</option>
        <option value="HaiPhong_BigCHaiPhong.gif">hihi</option>
    </select>
</div>

<div id="body_mid" style="float:left; width:56%;">
    <form name="formLienHe" id="formLienHe" Action="process?task=XLLienHe" method="post">
        <table width="596" border="0" cellpadding="0" cellspacing="0">
            <tr>
            <td height="42" class="maintabletitle">
            <span class="titleSPChitiet">LIÊN HỆ</span>
            </td>
            </tr>

            <tr>
            <td class="graytdborder">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tbody><tr>
                        <td>
                            <table border="0" cellpadding="10" cellspacing="0" width="100%" style="height: 50px">
                                <tbody>
                                    <tr style="height: 25px">
                                    <td class="lineHeight">
                                    <span class="titleChitiet">Công ty Cổ Phần  SX-TM XNK Viễn Thông A</span><br>
                                    Trụ sở chính: 328-330 Đường 3/2, P.12, Quận 10, TPHCM<br>
                                    Tel: (84-8) 38633333 - Fax: (84-8) 38680634 - Hotline: 1900 54 54 46<br>
                                    Email: <a href="mailto:contact@vienthonga.com">contact@vienthonga.com</a> - Website: <a href="http://www.vienthonga.com/">www.vienthonga.com</a>
                                    </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        </tr>
                        <tr>
                        <td class="CellPadding borderCellTopBottom cellBgColor1" style="height: 20px;">
                            <a href="#sieuthi">Địa chỉ các siêu thị</a>
                        <span class="style8"> |</span> 
                        <a href="#gopy">Góp ý</a>
                        </td>
                        </tr>
                        <tr>
                        <td><table border="0" cellpadding="10" cellspacing="0" width="100%">
                                <tbody>
                                    <tr style="height: 20px;">
                                    <td colspan="3" style="height: 50px">
                                        <a name="sieuthi" id="sieuthi">
                                        </a>
                                        Để xem địa chỉ và bản đồ của từng siêu thị, vui lòng chọn thông tin bến dưới: 
                                    </td>                                    
                                    </tr>
                                    <tr>
                                    <td>
                                        <select id="cboProvinces" class="timkiemlist">
                                            <option>Tỉnh / Thành phố</option>
                                            <%
                                                for (int i = 0; i < list.size(); i++) {
                                            %>
                                            <option onclick="show('<%=list.get(i).getTenVung()%>');" value="<%=list.get(i).getMaVung()%>"><%=list.get(i).getTenVung()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </td>                                    
                                    <td>
                                        <div id="hienthi">
                                            <select class="timkiemlist" id="cboAddress" onChange="SetBranch()">
                                                <option selected="selected" value="0">Địa chỉ</option>
                                                <option value="HaiPhong_BigCHaiPhong.gif">Lô 1/20 Khu Đô Thị Ngã 5, Sân Bay Cát Bi</option>
                                            </select>
                                        </div>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td id="VTA_LoadContent_ctl00_img_branch" colspan="3" align="center">
                                        <img id="bando" src="images/linhtinh/vnmap.gif"/>
                                    </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        </tr>
                        <tr>
                        <td>&nbsp;</td>
                        </tr>
                        <tr>
                        <td class="CellPadding borderCellTopBottom cellBgColor3">
                            <a name="gopy" id="gopy"></a>
                            <strong class="titleChitiet">Góp ý</strong>
                        </td>
                        </tr>
                        <tr>
                        <td><table border="0" cellpadding="5" cellspacing="2" width="100%">
                                <tbody>
                                    <tr>
                                    <td height="5"></td>
                                    <td height="5"></td>
                                    </tr>
                                    <tr>
                                    <td align="right" valign="top" width="160">Họ Tên  <span class="style23">(*)</span>
                                    </td>
                                    <td>
                                    <label>
                                        <input name="txtHoTen" id="txtHoTen" size="30" class="textField" type="text">
                                        <br>
                                    </label>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td align="right">Địa chỉ <span class="style23">(*)</span>
                                    </td>
                                    <td>
                                        <input name="txtDiaChi" id="txtDiaChi" size="30" class="textField" type="text">
                                    </td>
                                    </tr>
                                    <tr>
                                    <td align="right">Email  <span class="style23">(*)</span>
                                    </td>
                                    <td>
                                        <input name="txtEmail" id="txtEmail" size="30" class="textField" type="text">
                                    </td>
                                    </tr>
                                    <tr>
                                    <td align="right">Tiêu đề <span class="style23">(*)</span>
                                    </td>
                                    <td>
                                        <input name="txtTieuDe" id="txtTieuDe" size="30" class="textField" type="text">
                                    </td>
                                    </tr>
                                    <tr>
                                    <td align="right">Nội dung <span class="style23">(*)</span> </td>
                                    <td>
                                        <textarea name="txtNoiDung" id="txtNoiDung" cols="30" rows="5">
                                        </textarea>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td align="right">&nbsp;</td>
                                    <td><em>Vui lòng nhập mã số an toàn sau đây</em></td>
                                    </tr>
                                    <tr>
                                    <td align="right">Mã an toàn <span class="style23">(*)</span></td>
                                    <td>
                                        <table border="0" cellpadding="5" cellspacing="0" width="100">
                                            <tbody>
                                                <tr>
                                                
                                                <td align="center"><td>
                                                    <form action="" method="post">
                                                        <%
                                                            ReCaptcha c = ReCaptchaFactory.newReCaptcha("6Ld03sgSAAAAAELYRYbjvhqsILWyj1zxc6DX4cwT ", "6Ld03sgSAAAAAGI9a-JBcCtJHNgL4umXwtW0uNW- ", false);
                                                            out.print(c.createRecaptchaHtml("abc", null));
                                                        %>
                                                    </form>
                                                
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    </tr>
                                    <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input name="btSend" id="btSend" src="images/linhtinh/gui.gif" onClick="javascript:return CheckSendMail();" style="height: 21px; width: 42px; border-width: 0px;" type="image">
                                        <input name="btClear" id="btClear" src="images/linhtinh/xoa.gif" style="height: 21px; width: 42px; border-width: 0px;" type="image">
                                    </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                        </tr>
                    </tbody>
                </table>  
            </td>
            </tr>
        </table>
    </form>
</div>