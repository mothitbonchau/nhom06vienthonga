<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/maintabletitle.css" rel="stylesheet" type="text/css" />
<div id="body_mid" style="float:left; width:60%;">
    <form name="formDangNhap" id="formDangNhap" Action="proccess?task=XuLy" method="post">
        <table width="775" border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                <td width="591" valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tbody>
                            <tr>
                            <td>
                                <table width="596" border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                        <td height="42" class="maintabletitle">
                                        <span class="titleSPChitiet">ĐĂNG NHẬP</span>
                                        </td>
                                        </tr>
                                        <tr>
                                        <td style="height: 19px">  </td>
                                        </tr>
                                        <tr>
                                        <td>
                                            <table border="0" cellpadding="5" cellspacing="2" width="100%" class="card">
                                                <tbody>
                                                    <tr>
                                                    <td colspan="2">
                                                        Để tiếp tục Đặt Mua Online tại VienthongA.com, vui lòng
                                                        <a href="/order/?action=VTA_DangKy" style="color:bold;color:blue; text-decoration:none;font-weight:bold;"> Đăng Ký </a>
                                                        (nếu chưa có tài khoản) hoặc
                                                        <b>Đăng Nhập</b>
                                                        theo thông tin bên dưới: 
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                    <td height="5" style="width: 232px"> </td>
                                                    <td height="5">
                                                    <span id="VTA_LoadContent1_ctl00_lblStatus" style="color:Red;"/>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                    <td align="right" valign="top" style="width: 232px">
                                                        Tên đăng nhập 
                                                    <span class="styleRed">(*)</span>
                                                    </td>
                                                    <td style="color: #ff0000">
                                                    <label>
                                                        <input name="tenDangNhap" type="text" id="VTA_LoadContent1_ctl00_txtEmail" style="width:213px;"
                                                            <%
                                                            if (request.getParameter("tenDangNhap") != null) {
                                                            %>
                                                             value="<%=request.getParameter("tenDangNhap")%>"
                                                            <%}%>                      
                                                            />   
                                                               
                                                               
                                                    </label>
                                                    </td>
                                                    <tr>
                                                    <td align="right" style="width: 232px">
                                                        Mật khẩu 
                                                    <span class="styleRed">(*)</span>
                                                    </td>
                                                    <td>
                                                        <input name="matKhau" type="password" id="VTA_LoadContent1_ctl00_txtPass" style="width:213px;"/>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                    <td/>
                                                    <td align="left">                                                                   
                                                    <label>
                                                        <input type="submit" name="btDangNhap" id="btDangNhap" value ="Đăng Nhập" style="border-width:1px;height: 25px;"/>
                                                    </label>
                                                    <br/>
                                                    <div style="padding-top:5px;">
                                                        <a id="VTA_LoadContent1_ctl00_lbtDangky" href="login?Action=TrangDangKy">Đăng ký</a>
                                                        |  
                                                        <a id="VTA_LoadContent1_ctl00_LinkButton1" href="javascript:__doPostBack('VTA_LoadContent1$ctl00$LinkButton1','')">Quên mật khẩu</a>
                                                        |  
                                                        <a href="http://www.vienthonga.com/template/chinhsach.pdf" target="_blank">Quy định/Chính sách</a>
                                                    </div>
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
                        </tbody>
                    </table>
                </td>
                </tr>
            </tbody>
        </table>
    </form>
</div>