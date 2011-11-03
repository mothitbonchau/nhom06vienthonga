<%@page import="MODEL.DAO.GopYDAO"%>
<%@page import="MODEL.POJO.Gopy"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    List<Gopy> list = GopYDAO.LayDSGopY();
%>
<div id="body_mid" style="float:left; width:76.5%;">
    <form method="post" action="process?task=quanlyadmin&task_chitiet=gopy">
        <table class="test" width="100%" border="2" cellspacing="2" cellpadding="2">
            <tr align='center' style="background-color: #CCCCCC">
                <th>Xóa</th>
                <th>Mã Góp Ý</th>
                <th>Họ Tên</th>
                <th>Địa Chỉ</th>
                <th>Email </th>
                <th>Tiêu Đề</th>
                <th>Nội Dung </th>        
            </tr>
            
            
            <tr>
                <td align='center'>
                    <label>
                        <input type='checkbox' name='cbXoa' id='cbXoa' value='jii' />
                    </label>
                </td>
                
                
                <td>
                    
                    <label>                        
                        <input type='hidden' name='NgayDat' id='tbNgayDat' value='trtr' style="width:120px;"/>
                    </label>
                </td>
                <td>
                    
                    <label>
                        <input type='hidden' name='TenNguoiDung' id='tbTenNguoiDung' value='fdgd' style="width:120px;"/>
                    </label>
                </td>
                <td>
                    
                    <label>
                        <input type='hidden' name='TongTien' id='tbTongTien' value='trt' style="width:120px;"/>
                    </label>        
                </td> 
                <td>
                    
                    <label>
                        <input type='hidden' name='GiamGia' id='tbGiamGia' value='fgf' style="width:120px;"/>
                    </label>  
                </td>
                <td>
                   
                    <label>
                        <input type='hidden' name='ThanhTien' id='tbThanhTien' value='hf' style="width:120px;"/>
                    </label>
                </td>
                <td>
                    
                    <label>
                        <input type='hidden' name='HinhThucThanhToan' id='tbHinhThucThanhToan' value='gfgd' style="width:150px;"/>
                    </label>
                </td>
            </tr>
            
        </table>
    </form>
        </table>
    </form>
</div>