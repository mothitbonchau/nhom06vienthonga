<%@page import="java.util.List"%>
<%@page import="MODEL.POJO.*"%>
<%@page import="MODEL.DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Khuyenmai km = KhuyenMaiDAO.LayKhuyenMai().get(KhuyenMaiDAO.LayKhuyenMai().size()-1);
    int temp = Integer.parseInt(km.getMaKhuyenMai().substring(3)) + 1;
    String mkm = "MKM" + String.valueOf(temp);
%>

<style>
    .test tr
    {
        height: 30px;
    }
</style>

<script type="text/javascript">
    function chuyentask(task)
    {
        var frm = document.getElementById("frmcapnhatkhuyenmai");
        frm.setAttribute("action", "process?task=quanlyadmin&task_chitiet=khuyenmai" + task);
    }
</script>
<div id="body_mid" style="float: left; width: 75%; margin-left: 0px;">
    <form id="frmcapnhatkhuyenmai" method="post" action="#" enctype="multipart/form-data">
        <table width="100%" border="0" cellspacing="10" cellpadding="2">
            <tr>
            <td width="150px;">Mã khuyến mãi: </td>
            <td><input readonly="true" type="text" name="MaKhuyenMai" id="MaKhuyenMai" value="<%= mkm %>" /></td>
            <td style="width: 35%; text-align: right;"><img src="" width="100px" height="100px" alt="Hình đại diện: " /></td>
            <td><input style="height: 25px;" type="file" name="HinhDaiDien" value="Browse" /></td>            
            </tr>
            <tr>
            <td>Tên khuyến mãi: </td>
            <td><input type="text" name="TenKhuyenMai" id="TenKhuyenMai" value="" /></td>
            </tr>
            <tr>
            <td>Ngày bắt đầu: </td>
            <td><input type="text" name="NgayBatDau" id="NgayBatDau" value="" /></td>
            </tr>
            <tr>
            <td>Ngày kết thúc: </td>
            <td><input type="text" name="NgayKetThuc" id="NgayKetThuc" value="" /></td>
            </tr>
            <tr>
            <tr>
            <td>Tình trạng: </td>
            <td><input type="text" name="TinhTrang" id="TinhTrang" value="" /></td>
            </tr>
            <tr>
            <td colspan="4">    
                <div id="kk" style="display: none;"></div>
                <script type="text/javascript">
                    var oFCKeditor = new FCKeditor('Content'); // name
                    var temp = document.getElementById('kk');
                    
                    oFCKeditor.Value = temp.innerHTML;
                    oFCKeditor.BasePath = "plugins/fckeditor/";
                    oFCKeditor.Width = "100%";
                    oFCKeditor.Height = "700px";
                    oFCKeditor.ToolbarSet = "Default"; // xem cấu hình ToolbarSets trong file fckeditor/fckconfig.js
                    oFCKeditor.Config['AutoDetectLanguage'] = "false";
                    oFCKeditor.Config['DefaultLanguage'] = "vi";
                    oFCKeditor.Config['ToolbarCanCollapse'] = "false";
                    oFCKeditor.Config['SkinPath'] = "skins/Office2007Real_Actual/";
                    oFCKeditor.Create();
                </script>    
            </td>
            </tr>
            <tr>
            <td align="center" colspan="4">
                <input type="submit" style="height: 30px;" value="Thêm" id="Them" name="CapNhat" onclick="chuyentask('&Them=chitiet')">
                <span>&nbsp;</span>
                <input type="reset" style="height: 30px;" value="Xoá Nhập Lại" id="XoaNhapLai" name="XoaNhapLai">
            </td>
            </tr>
        </table>
    </form>
</div>