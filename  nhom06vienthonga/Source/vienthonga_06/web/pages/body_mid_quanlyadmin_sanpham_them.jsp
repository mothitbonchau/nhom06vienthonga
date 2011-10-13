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
    <table class="test" width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr>
        <th colspan="2" align="center"><h2>CHI TIẾT ĐIỆN THOẠI</h2></th>
        </tr>
        <tr>
        <td style="width: 35%;">Mạng: </td>
        <td><input type="text" name="Mang" /></td>
        </tr>
        <tr>
        <td style="width: 35%;">Loại màn hình: </td>
        <td><input type="text" name="LoaiManHinh" /></td>
        </tr>
        <tr>
        <td style="width: 35%;">Ngôn ngữ: </td>
        <td><input type="text" name="NgonNgu" /></td>
        </tr>
    </table>
</div>

<div id="chitietlaptop" style="display: none">
    <table class="test" width="100%" border="0" cellspacing="2" cellpadding="2">
        <tr>
        <th colspan="2" align="center"><h2>CHI TIẾT LAPTOP</h2></th>
        </tr>
        <tr>
        <td style="width: 35%;">Công nghệ CPU: </td>
        <td><input type="text" name="CongNgheCPU" /></td>
        </tr>
        <tr>
        <td style="width: 35%;">Tốc độ CPU: </td>
        <td><input type="text" name="TocDoCPU" /></td>
        </tr>
        <tr>
        <td style="width: 35%;">Bộ nhớ đệm: </td>
        <td><input type="text" name="BoNhoDem" /></td>
        </tr>
    </table>    
</div>

<div id="body_mid" style="float: left; width: 75%; margin-left: 0px;">
    <form id="frmthemsanpham" method="post" action="process?task=quanlyadmin&task_chitiet=sanpham" enctype="multipart/form-data">
        <table width="100%" border="0" cellspacing="10" cellpadding="2">
            <tr>
            <td>Mã Sản Phẩm</td>
            <td><input type="text" name="MaSanPham" value="<%= msp%>" readonly="readonly" /></td>
            <td rowspan="10" style="vertical-align:top">
                <table width="100%" border="0" cellspacing="2" cellpadding="2">
                    <tr>
                    <td style="width: 35%;">Hình đại diện:</td>
                    <td><input style="height: 25px;" type="file" name="HinhDaiDien" value="Browse" /></td>
                    </tr>
                </table>

                <div id="thongtinchitiet" style="float: none;">
                    <table class="test" width="100%" border="0" cellspacing="2" cellpadding="2">
                        <tr>
                        <th colspan="2" align="center"><h2>CHI TIẾT ĐIỆN THOẠI</h2></th>
                        </tr>
                        <tr>
                        <td style="width: 35%;">Mạng: </td>
                        <td><input type="text" name="Mang" /></td>
                        </tr>
                        <tr>
                        <td style="width: 35%;">Loại màn hình: </td>
                        <td><input type="text" name="LoaiManHinh" /></td>
                        </tr>
                        <tr>
                        <td style="width: 35%;">Ngôn ngữ: </td>
                        <td><input type="text" name="NgonNgu" /></td>
                        </tr>
                    </table>
                </div>
            </td>
            </tr>
            <tr>
            <td>Tên Sản Phẩm</td>
            <td><input type="text" name="TenSanPham" value="" /></td>
            </tr>
            <tr>
            <td>Loại Sản Phẩm</td>
            <td>
                <select id="MaLoaiSanPham" name="MaLoaiSanPham" style="width: 125px;" >
                    <option value="DT" onclick="showthongtin('DT');">- Điện Thoại -</option>
                    <option value="LT" onclick="showthongtin('LT');">- Laptop -</option>
                </select>                
            </td>
            </tr>
            <tr>
            <td>Mã Hãng <a href="view?task=quanly&task_chitiet=hang">(Tra mã hãng)</a></td>
            <td><input type="text" name="MaHang" value="" /></td>
            </tr>
            <tr>
            <td>Số Lượng</td>
            <td><input type="text" name="SoLuong" value="" /></td>
            </tr>
            <tr>
            <td>Giá Bán</td>
            <td><input type="text" name="GiaBan" value="" /></td>
            </tr>
            <tr>
            <td>Màu Sắc</td>
            <td><input type="text" name="MauSac" value="" /></td>
            </tr>
            <tr>
            <td>Thời Gian Bảo Hành</td>
            <td><input type="text" name="ThoiGianBaoHanh" value="" /></td>
            </tr>
            <tr>
            <td>Kích Thước</td>
            <td><input type="text" name="KichThuoc" value="" /></td>
            </tr>
            <tr>
            <td>Trọng Lượng</td>
            <td><input type="text" name="TrongLuong" value="" /></td>
            </tr>
            <tr>
            <td align="center" colspan="4">
                <input onclick="chuyentask('&Them=1')" type='submit' name='Them' id='Them' value='Thêm' style="height: 30px"/>            
            <span>&nbsp;</span>
            <input type='reset' name='XoaNhapLai' id='XoaNhapLai' value='Xoá Nhập Lại' style="height: 30px"/>
            </td>
            </tr>
        </table>
    </form>
</div>