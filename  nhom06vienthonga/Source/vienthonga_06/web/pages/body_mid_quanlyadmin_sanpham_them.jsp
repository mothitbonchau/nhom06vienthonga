<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="MODEL.POJO.*"%>
<%@page import="MODEL.DAO.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Sanpham sp_cuoi = SanPhamDAO.LaySanPhamCuoiCung();
    int chiso = Integer.parseInt(sp_cuoi.getMaSanPham().substring(3));
    chiso += 1;
    String msp = "MSP" + chiso;
%>

<style>
    .test tr
    {
        height: 30px;
    }
</style>

<script type="text/javascript" language="javascript">
    function showthongtin(lsp)
    {
        var hienthi = document.getElementById("thongtinchitiet");
        var laptop = document.getElementById("chitietlaptop");
        var dienthoai = document.getElementById("chitietdienthoai");
        if(lsp == "DT")
        {
            hienthi.innerHTML = dienthoai.innerHTML;
        }
        else
        {
            hienthi.innerHTML = laptop.innerHTML;
        }
    }
    
    function chuyentask(task)
    {
        var frm = document.getElementById("frmthemsanpham");
        frm.setAttribute("action", "process?task=quanlyadmin&task_chitiet=sanpham" + task);
    }
</script>

<div id="chitietdienthoai" style="display: none">
    Mạng:<br/>
    <input type="text" name="Mang" /><br/>   
    Loại màn hình:<br/>
    <input type="text" name="LoaiManHinh" /><br/>
    Ngôn ngữ:<br/>
    <input type="text" name="NgonNgu" />
</div>

<div id="chitietlaptop" style="display: none">
    Công nghệ CPU:<br/>
    <input type="text" name="CongNgheCPU" /><br/>
    Tốc độ CPU:<br/>
    <input type="text" name="TocDoCPU" /><br/>
    Bộ nhớ đệm:<br/>
    <input type="text" name="BoNhoDem" />
</div>

<div id="body_mid" style="float: left; width: 75%; margin-left: 0px;">
    <form id="frmthemsanpham" method="post" action="process?task=quanlyadmin&task_chitiet=sanpham" enctype="multipart/form-data">
        <table width="100%" border="0" cellspacing="10" cellpadding="2">
            <tr>
            <td>Mã Sản Phẩm</td>
            <td><input type="text" name="MaSanPham" value="<%= msp%>" readonly="readonly" /></td>
            <td>Hình đại diện:</td>
            <td><input style="height: 25px;" type="file" name="HinhDaiDien" value="Browse" /></td>
            </tr>
            <tr>
            <td>Tên Sản Phẩm</td>
            <td><input type="text" name="TenSanPham" value="" /></td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>Loại Sản Phẩm</td>
            <td>
                <select id="MaLoaiSanPham" name="MaLoaiSanPham" style="width: 125px;" >
                    <option value="DT" onclick="showthongtin('DT');">- Điện Thoại -</option>
                    <option value="LT" onclick="showthongtin('LT');">- Laptop -</option>
                </select>

                <div id="thongtinchitiet">

                </div>
            </td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>Mã Hãng</td>
            <td><input type="text" name="MaHang" value="" /></td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>Số Lượng</td>
            <td><input type="text" name="SoLuong" value="" /></td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>Giá Bán</td>
            <td><input type="text" name="GiaBan" value="" /></td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>Màu Sắc</td>
            <td><input type="text" name="MauSac" value="" /></td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>Thời Gian Bảo Hành</td>
            <td><input type="text" name="ThoiGianBaoHanh" value="" /></td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>Kích Thước</td>
            <td><input type="text" name="KichThuoc" value="" /></td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>Trọng Lượng</td>
            <td><input type="text" name="TrongLuong" value="" /></td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td align="center" colspan="5">
                <input onclick="chuyentask('&Them=1')" type='submit' name='Them' id='Them' value='Thêm' style="height: 30px"/>
            <span>&nbsp;</span>
            <input onclick="chuyentask('&CapNhat=1')" type='submit' name='CapNhat' id='CapNhat' value='Cập Nhật' style="height: 30px"/>
            <span>&nbsp;</span>
            <input onclick="chuyentask('&Xoa=1')" type='submit' name='Xoa' id='Xoa' value='Xóa' style="height: 30px"/>
            </td>
            </tr>
        </table>
    </form>
</div>