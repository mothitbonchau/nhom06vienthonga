/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import MODEL.DAO.*;
import MODEL.POJO.*;
import MODEL.UTIL.HinhAnh;
import MODEL.UTIL.MD5;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;
import org.apache.commons.io.IOUtils;
import org.omg.CORBA.SystemException;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author HP
 */
@WebServlet(name = "process", urlPatterns = {"/process"})
public class process extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        try {
            String task = "";
            if (request.getParameter("task") != null) {
                task = request.getParameter("task").toString();
            }

            //<editor-fold defaultstate="collapsed" desc="xử lý tìm kiếm sản phẩm">
            if (task.equals("timkiem")) {
                Sanpham sp = new Sanpham();
                sp.setTenSanPham(request.getParameter("TSP"));
                Loaisanpham lsp = new Loaisanpham();
                lsp.setMaLoaiSanPham(request.getParameter("MLSP"));
                sp.setLoaisanpham(lsp);
                Hang h = new Hang();
                h.setMaHang(request.getParameter("MH"));
                sp.setHang(h);
                sp.setGiaBan(Float.parseFloat(request.getParameter("Gia").toString()));

                int sp1trang = ThamSoDAO.LaySoSanPhamTrenTrang();
                int tongsotrang = 0;
                int trang = 1;
                if (request.getParameter("trang") != null) {
                    trang = Integer.parseInt(request.getParameter("trang").toString());
                }
                int batdau = 0;
                if (trang > 1) {
                    batdau = sp1trang * trang - sp1trang;
                }

                List<Sanpham> list = SanPhamDAO.TimKiem(sp, batdau, -1);
                tongsotrang = list.size() / sp1trang;
                if (list.size() % sp1trang > 0) {
                    tongsotrang = tongsotrang + 1;
                }
                list = SanPhamDAO.TimKiem(sp, batdau, sp1trang);
                //list = list.subList(0, sp1trang);

                request.setAttribute("tongsotrang", tongsotrang);
                request.setAttribute("list", list);
                request.getRequestDispatcher("TimKiem.jsp").forward(request, response);
                return;
            }
            //</editor-fold>

            //<editor-fold defaultstate="collapsed" desc="xử lý đặt mua sản phẩm">
            if (task.equals("datmua")) {
                String msp = request.getParameter("MSP");
                String maNguoiDung = (String) session.getAttribute("MaNguoiDung");
                Giohang ghTrung = GioHangDAO.LayGioHangVoiSanPhamBiTrung(maNguoiDung, msp);
                Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(msp);

                int flag = 0;

                if (session.getAttribute("TenDangNhap") == null) {
                    request.getRequestDispatcher("view?task=DangNhap").forward(request, response);
                    return;
                } else {
                    if (ghTrung != null) {
                        int soLuong = ghTrung.getSoLuong() + 1;
                        flag = GioHangDAO.CapNhatSoLuongChoSanPhamTrung(ghTrung.getMaGioHang(), soLuong);
                        flag = GioHangDAO.CapNhatThanhTienChoSanPhamTrung(ghTrung.getMaGioHang(), soLuong);
                    } else {
                        Giohang gh = GioHangDAO.LayGioHangCuoiCung();
                        int mgh = 1;
                        if (gh == null) {
                            gh = new Giohang();
                        } else {
                            mgh = Integer.parseInt(gh.getMaGioHang().substring(3));
                            mgh = mgh + 1;
                        }
                        gh = new Giohang();
                        gh.setMaGioHang("MGH" + String.valueOf(mgh));
                        gh.setDonGia(sp.getGiaBan());
                        gh.setSanpham(sp);
                        gh.setSoLuong(1);
                        gh.setThanhTien(gh.getSoLuong() * gh.getDonGia());
                        gh.setTinhTrang(0);
                        Nguoidung nd = NguoiDungDAO.LayNguoiDungTheoTenDangNhap(session.getAttribute("TenDangNhap").toString());
                        gh.setNguoidung(nd);

                        request.setAttribute("TenSanPham", sp.getTenSanPham());
                        request.setAttribute("ThanhTien", sp.getGiaBan());

                        flag = GioHangDAO.Them(gh);

                    }

                    if (flag == 1) {
                        String thongbao = "";
                        thongbao = "Đã đặt mua thành công";
                        request.setAttribute("thongbao", thongbao);
                    }
                }

                //request.getRequestDispatcher("view?task=chitietsanpham&MSP=MSP31").forward(request, response);
                request.setAttribute("sanpham", sp);
                request.getRequestDispatcher("ChiTietSanPham.jsp").forward(request, response);
                return;
            }
            //</editor-fold>

            //<editor-fold defaultstate="collapsed" desc="Xử lý đăng nhập">
            if (task.equals("XuLy")) {

                //Mã hoá MD5
                MD5 k = new MD5();
                String pass = request.getParameter("matKhau").toString();
                try {
                    pass = k.MD5(request.getParameter("matKhau").toString());
                } catch (Exception ex) {
                    Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                    response.sendRedirect("view?task=DangNhap");
                }
                /////////////

                Nguoidung ndung = NguoiDungDAO.DangNhap(request.getParameter("tenDangNhap"), pass);
                if (ndung != null) {
                    session.setAttribute("MaNguoiDung", ndung.getMaNguoiDung());
                    session.setAttribute("TenDangNhap", ndung.getTenDangNhap());
                    session.setAttribute("TenNguoiDung", ndung.getTenNguoiDung());
                    request.getRequestDispatcher("view").forward(request, response);
                } else {
                    response.sendRedirect("view?task=DangNhap");
                    return;
                }
            }
            //</editor-fold>

            //<editor-fold defaultstate="collapsed" desc="Xử lý đăng ký">
            if (task.equals("Luu")) {
                String remoteAddr = request.getRemoteAddr();
                ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
                reCaptcha.setPrivateKey("6Ld03sgSAAAAAGI9a-JBcCtJHNgL4umXwtW0uNW- ");

                String challenge = request.getParameter("recaptcha_challenge_field");
                String uresponse = request.getParameter("recaptcha_response_field");
                ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

                if (!reCaptchaResponse.isValid()) {
                    request.setAttribute("thongbao", "Sai captcha !!!");
                    request.getRequestDispatcher("view?task=DangKy").forward(request, response);
                    return;
                }

                Nguoidung pojo = new Nguoidung();
                Loainguoidung lnd = NguoiDungDAO.LayDoiTuongTheoMa("MLND2");

                //Lấy Mã người dùng kiểu String tăng tự động
                String MaND = NguoiDungDAO.LayMaNguoiDungCuoiCung();
                String ma = "MND";
                String ChuoiSo = MaND.substring(3);
                int So = Integer.parseInt(ChuoiSo) + 1;
                MaND = ma + So;

                //Lấy giờ hệ thống
                long current_time = System.currentTimeMillis();
                java.sql.Date NgayHienTai = new java.sql.Date(current_time);


                pojo.setMaNguoiDung(MaND);
                pojo.setTenDangNhap(request.getParameter("txtTenDangNhap"));
                pojo.setTenNguoiDung(request.getParameter("txtName"));

                //Mã hoá MD5
                MD5 k = new MD5();
                String pass = request.getParameter("txtPass").toString();
                try {
                    pass = k.MD5(request.getParameter("txtPass").toString());
                } catch (Exception ex) {
                    Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                }
                /////////////

                pojo.setMatKhau(pass);
                pojo.setEmail(request.getParameter("txtEmail"));
                pojo.setCmnd(request.getParameter("txtCMND").toString());
                pojo.setDienThoai(request.getParameter("txtDienThoai").toString());
                pojo.setDiaChi(request.getParameter("txtDiaChi"));
                pojo.setNgayDangKy(NgayHienTai);
                pojo.setLoainguoidung(lnd);
                pojo.setTinhTrang(0);

                int kq = NguoiDungDAO.DangKy(pojo);

                //Gán Session Tên Đăng Nhập    
                session.setAttribute("MaNguoiDung", pojo.getMaNguoiDung());
                session.setAttribute("TenDangNhap", pojo.getTenDangNhap());
                session.setAttribute("TenNguoiDung", pojo.getTenNguoiDung());

                request.setAttribute("thongbao", "Đã đăng ký thành công !!!");
                request.getRequestDispatcher("view").forward(request, response);
            }
            //</editor-fold>                                      

            //<editor-fold defaultstate="collapsed" desc="Xử lý đăng xuất">
            if (task.equals("DangXuat")) {
                session.invalidate();
                request.getRequestDispatcher("view").forward(request, response);
            }
            //</editor-fold>

            //<editor-fold defaultstate="collapsed" desc="xử lý giỏ hàng">
            if (task.equals("GioHang")) {
                String chi_tiet = request.getParameter("btXoa");
                if (request.getParameter("btXoa") != null) {
                    String[] CacMaXoa = request.getParameterValues("chkDel");
                    if (CacMaXoa != null) {
                        for (int i = 0; i < CacMaXoa.length; i++) {
                            String ms = CacMaXoa[i];
                            int kq = GioHangDAO.XoaChiTietGioHang(ms);
                        }
                    }
                }
                if (request.getParameter("btnDatMua") != null) {
                    /////////////////////////////////////Ghi vào bảng Đơn Hàng                                  
                    Donhang dh = DonHangDAO.LayDonHangCuoiCung();
                    int mdh = 1;
                    if (dh == null) {
                        dh = new Donhang();
                    } else {
                        mdh = Integer.parseInt(dh.getMaDonHang().substring(3));
                        mdh = mdh + 1;
                    }
                    dh = new Donhang();
                    String maDonHang = "MDH" + String.valueOf(mdh);
                    dh.setMaDonHang(maDonHang);
                    //Lấy giờ hệ thống
                    long current_time = System.currentTimeMillis();
                    java.sql.Date NgayHienTai = new java.sql.Date(current_time);
                    dh.setNgayDat(NgayHienTai);
                    //Set NguoiDung
                    String maNguoiDung = (String) session.getAttribute("MaNguoiDung");
                    Nguoidung nd = NguoiDungDAO.LayNguoiDungTheoMa(maNguoiDung);
                    dh.setNguoidung(nd);
                    //Set TongTien
                    float TongTien = GioHangDAO.TongTienGioHang(maNguoiDung);
                    dh.setTongTien(TongTien);

                    //Giam Gia
                    float GiamGia = Float.parseFloat(session.getAttribute("TienGiamGia").toString());
                    dh.setGiamGia(GiamGia);
                    //Thanh Tien
                    float ThanhTien = Float.parseFloat(session.getAttribute("ThanhTien").toString());
                    dh.setThanhTien(ThanhTien);

                    //HinhThucThanhToan
                    String maHinhThuc = request.getParameter("rdoHinhThucThanhToan");
                    Hinhthucthanhtoan httt = HinhThucThanhToanDAO.LayHinhThucThanhToanTheoMa(maHinhThuc);
                    dh.setHinhthucthanhtoan(httt);
                    //Tinh trang
                    dh.setTinhTrang(0);
                    //Ghi đơn hàng
                    int tc = DonHangDAO.DatHang(dh);
                    if (tc == 1) {
                        String thongbao = "";
                        thongbao = "Đặt hàng thành công";
                        request.setAttribute("thongbao", thongbao);
                    }

                    //////////////////////////////////////Ghi vào bảng ChiTietDonHang
                    List<Giohang> listGioHang = GioHangDAO.LayListGioHangTheoMaNguoiDung(maNguoiDung);
                    for (int i = 0; i < listGioHang.size(); i++) {
                        Chitietdonhang ctdh = ChiTietDonHangDAO.LayChiTietDonHangCuoiCung();
                        int mctdh = 1;
                        if (ctdh == null) {
                            ctdh = new Chitietdonhang();
                        } else {
                            String machitiet = ctdh.getMaChiTietDonHang().substring(5);
                            mctdh = Integer.parseInt(machitiet);
                            mctdh = mctdh + 1;
                        }
                        ctdh = new Chitietdonhang();
                        ctdh.setMaChiTietDonHang("MCTDH" + String.valueOf(mctdh));
                        //Set Ma Don Hang
                        ctdh.setDonhang(dh);
                        //Set Ma San pham
                        Sanpham sp = listGioHang.get(i).getSanpham();
                        ctdh.setSanpham(sp);
                        //Set so luong
                        ctdh.setSoLuong(listGioHang.get(i).getSoLuong());
                        //Set Don Gia
                        ctdh.setDonGia(listGioHang.get(i).getDonGia());
                        //Set Giam Gia  --- Sua lai kieu du lieu GiamGia cua bang GiamGia thanh Float
                        String msp = listGioHang.get(i).getSanpham().getMaSanPham();
                        Giamgia gg = GiamGiaDAO.LayTienGiamGiaTheoMaSanPham(msp);
                        float Gia = Float.valueOf(gg.getGiaGiam());
                        ctdh.setGiamGia(Gia);
                        //Set ThanhTien
                        ctdh.setThanhTien((ctdh.getDonGia() * ctdh.getSoLuong()) - ctdh.getGiamGia());
                        //Trang Thai - TInh Trang
                        ctdh.setTrangThai(0);
                        ctdh.setTinhTrang(0);

                        ////Ghi Chi Tiết Đơn Hàng
                        int kq = ChiTietDonHangDAO.Them(ctdh);
                        if (kq != 1) {
                            String thongbao = "";
                            thongbao = "Đặt hàng không thành công";
                            request.setAttribute("thongbao", thongbao);
                        }
                    }

                    //////////////////////////////////////////Xóa trong bảng GioHang
                    for (int i = 0; i < listGioHang.size(); i++) {
                        GioHangDAO.XoaChiTietGioHang(listGioHang.get(i).getMaGioHang());
                    }
                }
                request.getRequestDispatcher("view").forward(request, response);
            }
            //</editor-fold>

            //<editor-fold defaultstate="collapsed" desc="Xử lý liên hệ">
            if (task.equals("XLLienHe")) {
                String task_chitiet = "";
                if(request.getParameter("task_chitiet") != null)
                {
                    task_chitiet = request.getParameter("task_chitiet").toString();
                }
                
                if(task_chitiet.equals("vung"))
                {
                    String mavung = request.getParameter("MV").toString();
                    List<Sieuthi> list = SieuThiDAO.LaySieuThiTheoMaVung(mavung);
                    
                    for(int i=0; i<list.size(); i++)
                    {
                        out.println("<option value='" + list.get(i).getMaSieuThi() + "'>" + list.get(i).getTenSieuThi() + "</option>");
                    }
                    
                    return;
                }
                
                String remoteAddr = request.getRemoteAddr();
                ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
                reCaptcha.setPrivateKey("6Ld03sgSAAAAAGI9a-JBcCtJHNgL4umXwtW0uNW- ");

                String challenge = request.getParameter("recaptcha_challenge_field");
                String uresponse = request.getParameter("recaptcha_response_field");
                ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);

                if (!reCaptchaResponse.isValid()) {
                    request.setAttribute("thongbao", "Sai captcha !!!");
                    request.getRequestDispatcher("view?task=LienHe").forward(request, response);
                    return;
                }

                Gopy gop = new Gopy();

                // Lấy Mã Góp ý tăng tự động
                String MaGopY = GopYDAO.LayMaGopYCuoi();
                String magop = "MGY";
                String Chuoi = MaGopY.substring(3);
                int so = Integer.parseInt(Chuoi) + 1;
                MaGopY = magop + so;

                // Lấy giờ hệ thống
                long curren_time = System.currentTimeMillis();
                java.sql.Date NgayHienTai = new java.sql.Date(curren_time);

                gop.setMaGopY(MaGopY);
                gop.setHoTen(request.getParameter("txtHoTen"));
                gop.setDiaChi(request.getParameter("txtDiaChi"));
                gop.setEmail(request.getParameter("txtEmail"));
                gop.setNoiDung(request.getParameter("txtNoiDung"));
                gop.setNgayGopY(NgayHienTai);

                int kq = GopYDAO.GopY(gop);

                request.setAttribute("thongbao", "Đã góp ý thành công !!!");
                request.getRequestDispatcher("view").forward(request, response);
            }
            //</editor-fold>

            //<editor-fold defaultstate="collapsed" desc="xử lý quản lý admin">
            if (task.equals("quanlyadmin")) {
                if (request.getParameter("task_chitiet") != null) {
                    String task_chitiet = request.getParameter("task_chitiet");

                    //<editor-fold defaultstate="collapsed" desc="công ty">
                    if (task_chitiet.equals("capnhatcongty")) {
                        Congty ct = new Congty();
                        ct.setMaCongTy(request.getParameter("maCongTy"));
                        ct.setDiaChi(request.getParameter("diaChi"));
                        ct.setDienThoai(request.getParameter("dienThoai"));
                        ct.setEmail(request.getParameter("email"));
                        ct.setFax(request.getParameter("fax"));
                        ct.setHotLine(request.getParameter("hotLine"));
                        ct.setTenCongTy(request.getParameter("tenCongTy"));
                        ct.setWebsite(request.getParameter("website"));
                        ct.setGioiThieu(request.getParameter("gioiThieu"));
                        int kq = CongTyDAO.CapNhatCongTy(ct);
                        if (kq == 1) {
                            String thongbao = "";
                            thongbao = "Đã cập nhật thành công";
                            request.setAttribute("thongbao", thongbao);
                        }

                        request.getRequestDispatcher("QuanLyAdmin_CongTy.jsp").forward(request, response);
                        return;
                    }
                    //</editor-fold>

                    //<editor-fold defaultstate="collapsed" desc="Người dùng">
                    if (task_chitiet.equals("nguoidung")) {
                        if (request.getParameter("btnXoa") != null) {
                            String[] CacMaXoa = request.getParameterValues("cbXoa");
                            if (CacMaXoa != null) {
                                for (int i = 0; i < CacMaXoa.length; i++) {
                                    String ms = CacMaXoa[i];
                                    int j = NguoiDungDAO.XoaNguoiDungTheoMa(ms);
                                }
                            }
                        }
                        if (request.getParameter("btnThem") != null) {
                            String tenDN = request.getParameter("tbTenDangNhapMoi");
                            String matKhau = request.getParameter("tbMatKhauMoi");
                            String tenND = request.getParameter("tbTenNguoiDungMoi");
                            String email = request.getParameter("tbEmailMoi");
                            String cmnd = request.getParameter("tbCMNDMoi");
                            String dienThoai = request.getParameter("tbDienThoaiMoi");
                            String diaChi = request.getParameter("tbDiaChiMoi");
                            String Malnd = request.getParameter("LND");
                            String ngayDK = request.getParameter("tbNgayDangKyMoi");

                            //Lấy giờ hệ thống
                            long current_time = System.currentTimeMillis();
                            java.sql.Date NgayHienTai = new java.sql.Date(current_time);
                            //Lay Loai Nguoi Dung qua MLND
                            Loainguoidung lnd = NguoiDungDAO.LayDoiTuongTheoMa(Malnd);
                            //Lấy Mã người dùng kiểu String tăng tự động
                            String MaND = NguoiDungDAO.LayMaNguoiDungCuoiCung();
                            String ma = "MND";
                            String ChuoiSo = MaND.substring(3);
                            int So = Integer.parseInt(ChuoiSo) + 1;
                            MaND = ma + So;

                            Nguoidung nd = new Nguoidung();
                            nd.setMaNguoiDung(MaND);
                            nd.setTenDangNhap(tenDN);
                            nd.setMatKhau(matKhau);
                            nd.setTenNguoiDung(tenND);
                            nd.setEmail(email);
                            nd.setCmnd(cmnd);
                            nd.setDienThoai(dienThoai);
                            nd.setDiaChi(diaChi);
                            nd.setLoainguoidung(lnd);
                            nd.setNgayDangKy(NgayHienTai);
                            nd.setTinhTrang(0);

                            try {
                                //Them Nguoi Dung Moi
                                int kq = NguoiDungDAO.DangKy(nd);
                            } catch (SystemException ex) {
                                Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                            }
                        }
                        if (request.getParameter("btnCapNhat") != null) {
                            String[] CacMaCapNhat = request.getParameterValues("cbCapnhat");
                            if (CacMaCapNhat != null) {
                                for (int i = 0; i < CacMaCapNhat.length; i++) {
                                    //////                                    
                                    String tenDN = request.getParameter("tbTenDangNhap" + CacMaCapNhat[i]);
                                    String matKhau = request.getParameter("tbMatKhau" + CacMaCapNhat[i]);
                                    String tenND = request.getParameter("tbTenNguoiDung" + CacMaCapNhat[i]);
                                    String email = request.getParameter("tbEmail" + CacMaCapNhat[i]);
                                    String cmnd = request.getParameter("tbCMND" + CacMaCapNhat[i]);
                                    String dienThoai = request.getParameter("tbDienThoai" + CacMaCapNhat[i]);
                                    String diaChi = request.getParameter("tbDiaChi" + CacMaCapNhat[i]);


                                    //Lấy thông tin cũ của Người Dùng đó
                                    Nguoidung ndCu = NguoiDungDAO.LayNguoiDungTheoMa(CacMaCapNhat[i]);

                                    Nguoidung nd = new Nguoidung();
                                    nd.setMaNguoiDung(CacMaCapNhat[i]);
                                    nd.setTenDangNhap(tenDN);
                                    nd.setMatKhau(matKhau);
                                    nd.setTenNguoiDung(tenND);
                                    nd.setEmail(email);
                                    nd.setCmnd(cmnd);
                                    nd.setDienThoai(dienThoai);
                                    nd.setDiaChi(diaChi);
                                    nd.setLoainguoidung(ndCu.getLoainguoidung());
                                    nd.setNgayDangKy(ndCu.getNgayDangKy());
                                    nd.setTinhTrang(ndCu.getTinhTrang());

                                    try {
                                        //Update lại
                                        int kq = NguoiDungDAO.DangKy(nd);
                                    } catch (SystemException ex) {
                                        Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                }
                            }
                        }
                        //Load lai trang
                        request.getRequestDispatcher("QuanLyAdmin_NguoiDung.jsp").forward(request, response);
                        return;
                    }
                    //</editor-fold>

                    //<editor-fold defaultstate="collapsed" desc="Sản phẩm">
                    if (task_chitiet.equals("sanpham")) {
                        //<editor-fold defaultstate="collapsed" desc="thêm">
                        if (request.getParameter("Them") != null) {
                            ArrayList<FileItem> hinhanhsanpham_data = new ArrayList<FileItem>();
                            Hashtable params = new Hashtable();
                            if (ServletFileUpload.isMultipartContent(request)) {
                                ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
                                try {
                                    List fileItemsList = servletFileUpload.parseRequest(request);

                                    Iterator it = fileItemsList.iterator();

                                    while (it.hasNext()) {
                                        FileItem fileItem = (FileItem) it.next();
                                        if (fileItem.isFormField()) {
                                            String value = fileItem.getString("UTF-8");
                                            String key = fileItem.getFieldName();
                                            params.put(key, value);
                                        } else {
                                            hinhanhsanpham_data.add(fileItem);
                                        }
                                    }
                                } catch (Exception e) {
                                    out.println(e);
                                    return;
                                }

                                Sanpham sp = new Sanpham();
                                sp.setMaSanPham(params.get("MaSanPham").toString());
                                sp.setTenSanPham(params.get("TenSanPham").toString());
                                Loaisanpham lsp = new Loaisanpham();
                                lsp.setMaLoaiSanPham(params.get("MaLoaiSanPham").toString());
                                sp.setLoaisanpham(lsp);
                                Hang h = HangDAO.LayHangTheoMa(params.get("MaHang").toString());
                                sp.setHang(h);
                                sp.setSoLuong(Integer.parseInt(params.get("SoLuong").toString()));
                                sp.setGiaBan(Float.parseFloat(params.get("GiaBan").toString()));
                                sp.setMauSac(params.get("MauSac").toString());
                                sp.setThoiGianBaoHanh(params.get("ThoiGianBaoHanh").toString());
                                sp.setKichThuoc(params.get("KichThuoc").toString());
                                sp.setTrongLuong(params.get("TrongLuong").toString());
                                sp.setTinhTrang(0);

                                SanPhamDAO.ThemSanPham(sp);

                                String path = getServletContext().getRealPath("/") + "images\\";

                                if (sp.getLoaisanpham().getMaLoaiSanPham().equals("DT")) {
                                    path += "dien thoai\\";

                                    Chitietdienthoai ctdt = ChiTietDienThoaiDAO.LayChiTietDienThoaiCuoiCung();
                                    int chiso = 1;
                                    if (ctdt == null) {
                                        ctdt = new Chitietdienthoai();
                                    } else {
                                        chiso = Integer.parseInt(ctdt.getMaChiTietDienThoai().substring(5).toString());
                                        chiso += 1;
                                    }
                                    ctdt.setMaChiTietDienThoai("MCTDT" + chiso);
                                    ctdt.setSanpham(sp);
                                    ctdt.setMang(params.get("Mang").toString());
                                    ctdt.setLoaiManHinh(params.get("LoaiManHinh").toString());
                                    ctdt.setNgonNgu(params.get("NgonNgu").toString());

                                    ChiTietDienThoaiDAO.Them(ctdt);
                                }

                                if (sp.getLoaisanpham().getMaLoaiSanPham().equals("LT")) {
                                    path += "laptop\\";

                                    Chitietlaptop ctlt = ChiTietLaptopDAO.LayChiTietLaptopCuoiCung();
                                    int chiso = 1;
                                    if (ctlt == null) {
                                        ctlt = new Chitietlaptop();
                                    } else {
                                        chiso = Integer.parseInt(ctlt.getMaChiTietLaptop().substring(5).toString());
                                        chiso += 1;
                                    }
                                    ctlt.setMaChiTietLaptop("MCTLT" + chiso);
                                    ctlt.setSanpham(sp);
                                    ctlt.setCongNgheCpu(params.get("CongNgheCPU").toString());
                                    ctlt.setTocDoCpu(params.get("TocDoCPU").toString());
                                    ctlt.setBoNhoDem(params.get("BoNhoDem").toString());

                                    ChiTietLaptopDAO.Them(ctlt);
                                }

                                path += sp.getHang().getTenHang() + "\\";

                                Hinhanhsanpham hasp_cuoi = HinhAnhSanPhamDAO.LayHinhAnhSanPhamCuoiCung();
                                int chiso = 1;
                                if (hasp_cuoi == null) {
                                    hasp_cuoi = new Hinhanhsanpham();
                                } else {
                                    chiso = Integer.parseInt(hasp_cuoi.getMaHinhAnhSanPham().substring(5));
                                    chiso += 1;
                                }
                                String mhasp = "MHASP" + chiso;

                                for (int i = 0; i < hinhanhsanpham_data.size(); i++) {
                                    Hinhanhsanpham hasp = new Hinhanhsanpham();
                                    hasp.setMaHinhAnhSanPham(mhasp);
                                    hasp.setSanpham(sp);
                                    hasp.setTinhTrang(0);
                                    hasp.setDuongDan(hinhanhsanpham_data.get(i).getName());

                                    HinhAnhSanPhamDAO.Them(hasp);

                                    File file = new File(path + hinhanhsanpham_data.get(i).getName());
                                    try {
                                        hinhanhsanpham_data.get(i).write(file);
                                    } catch (Exception ex) {
                                        Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                                    }

                                    chiso += 1;
                                    mhasp = "MHASP" + chiso;
                                }

                                String thongbao = "";
                                thongbao = "Đã thêm sản phẩm thành công";
                                request.setAttribute("thongbao", thongbao);
                            }

                            request.getRequestDispatcher("QuanLyAdmin_SanPham_Them.jsp").forward(request, response);
                            return;
                        }
                        //</editor-fold>

                        //<editor-fold defaultstate="collapsed" desc="cập nhật">                        
                        if (request.getParameter("CapNhat") != null) {
                            String capnhat = request.getParameter("CapNhat").toString();
                            DecimalFormat df = new DecimalFormat("###,###,###");

                            String msp = "";

                            if (capnhat.equals("chitiet")) {
                                //<editor-fold defaultstate="collapsed" desc="chi tiết">
                                ArrayList<FileItem> hinhanhsanpham_data = new ArrayList<FileItem>();
                                int[] hinhanhsanpham_chiso = new int[6];
                                Hashtable params = new Hashtable();
                                if (ServletFileUpload.isMultipartContent(request)) {
                                    ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
                                    try {
                                        List fileItemsList = servletFileUpload.parseRequest(request);

                                        Iterator it = fileItemsList.iterator();

                                        while (it.hasNext()) {
                                            FileItem fileItem = (FileItem) it.next();
                                            if (fileItem.isFormField()) {
                                                String value = fileItem.getString("UTF-8");
                                                String key = fileItem.getFieldName();
                                                params.put(key, value);
                                            } else {
                                                hinhanhsanpham_data.add(fileItem);
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                        return;
                                    }

                                    msp = params.get("MaSanPham").toString();

                                    String path_cu = getServletContext().getRealPath("/") + "images\\";;

                                    Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(params.get("MaSanPham").toString());
                                    if (sp.getLoaisanpham().getMaLoaiSanPham().equals("DT")) {
                                        path_cu += "dien thoai\\";
                                    } else {
                                        path_cu += "laptop\\";
                                    }
                                    path_cu += sp.getHang().getTenHang() + "\\" + ((Hinhanhsanpham) sp.getHinhanhsanphams().toArray()[0]).getDuongDan();

                                    sp.setTenSanPham(params.get("TenSanPham").toString());
                                    Loaisanpham lsp = new Loaisanpham();
                                    lsp.setMaLoaiSanPham(params.get("MaLoaiSanPham").toString());
                                    if (!sp.getLoaisanpham().getMaLoaiSanPham().equals(lsp.getMaLoaiSanPham())) {
                                        if (sp.getLoaisanpham().getMaLoaiSanPham().equals("DT")) {
                                            ChiTietDienThoaiDAO.Xoa(sp.getMaSanPham());
                                            Chitietlaptop ctlt = ChiTietLaptopDAO.LayChiTietLaptopCuoiCung();
                                            int chiso = 1;
                                            if (ctlt == null) {
                                                ctlt = new Chitietlaptop();
                                            } else {
                                                chiso = Integer.parseInt(ctlt.getMaChiTietLaptop().substring(5).toString());
                                                chiso += 1;
                                            }
                                            ctlt.setMaChiTietLaptop("MCTLT" + chiso);
                                            ctlt.setSanpham(sp);
                                            ctlt.setCongNgheCpu(params.get("CongNgheCPU").toString());
                                            ctlt.setTocDoCpu(params.get("TocDoCPU").toString());
                                            ctlt.setBoNhoDem(params.get("BoNhoDem").toString());

                                            ChiTietLaptopDAO.Them(ctlt);
                                        } else {
                                            ChiTietLaptopDAO.Xoa(sp.getMaSanPham());
                                            Chitietdienthoai ctdt = ChiTietDienThoaiDAO.LayChiTietDienThoaiCuoiCung();
                                            int chiso = 1;
                                            if (ctdt == null) {
                                                ctdt = new Chitietdienthoai();
                                            } else {
                                                chiso = Integer.parseInt(ctdt.getMaChiTietDienThoai().substring(5).toString());
                                                chiso += 1;
                                            }
                                            ctdt.setMaChiTietDienThoai("MCTDT" + chiso);
                                            ctdt.setSanpham(sp);
                                            ctdt.setMang(params.get("Mang").toString());
                                            ctdt.setLoaiManHinh(params.get("LoaiManHinh").toString());
                                            ctdt.setNgonNgu(params.get("NgonNgu").toString());

                                            ChiTietDienThoaiDAO.Them(ctdt);
                                        }
                                    }
                                    sp.setLoaisanpham(lsp);
                                    Hang h = HangDAO.LayHangTheoMa(params.get("MaHang").toString());
                                    sp.setHang(h);
                                    sp.setSoLuong(Integer.parseInt(params.get("SoLuong").toString()));
                                    float giaban = 0;
                                    try {
                                        giaban = df.parse(params.get("GiaBan").toString()).floatValue();
                                    } catch (ParseException ex) {
                                        Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                    sp.setGiaBan(giaban);
                                    sp.setMauSac(params.get("MauSac").toString());
                                    sp.setThoiGianBaoHanh(params.get("ThoiGianBaoHanh").toString());
                                    sp.setKichThuoc(params.get("KichThuoc").toString());
                                    sp.setTrongLuong(params.get("TrongLuong").toString());
                                    sp.setTinhTrang(0);

                                    SanPhamDAO.CapNhatSanPham(sp);

                                    String path = getServletContext().getRealPath("/") + "images\\";

                                    if (sp.getLoaisanpham().getMaLoaiSanPham().equals("DT")) {
                                        path += "dien thoai\\";

                                        Chitietdienthoai ctdt = (Chitietdienthoai) sp.getChitietdienthoais().toArray()[0];
                                        ctdt.setSanpham(sp);
                                        ctdt.setMang(params.get("Mang").toString());
                                        ctdt.setLoaiManHinh(params.get("LoaiManHinh").toString());
                                        ctdt.setNgonNgu(params.get("NgonNgu").toString());

                                        ChiTietDienThoaiDAO.CapNhatChiTietDienThoai(ctdt);
                                    }

                                    if (sp.getLoaisanpham().getMaLoaiSanPham().equals("LT")) {
                                        path += "laptop\\";

                                        Chitietlaptop ctlt = (Chitietlaptop) sp.getChitietlaptops().toArray()[0];
                                        ctlt.setSanpham(sp);
                                        ctlt.setCongNgheCpu(params.get("CongNgheCPU").toString());
                                        ctlt.setTocDoCpu(params.get("TocDoCPU").toString());
                                        ctlt.setBoNhoDem(params.get("BoNhoDem").toString());

                                        ChiTietLaptopDAO.CapNhatChiTietLaptop(ctlt);
                                    }

                                    path += sp.getHang().getTenHang() + "\\";

                                    for (int i = 0; i < hinhanhsanpham_data.size(); i++) {
                                        Hinhanhsanpham hasp = (Hinhanhsanpham) sp.getHinhanhsanphams().toArray()[i];
                                        hasp.setSanpham(sp);
                                        hasp.setTinhTrang(0);
                                        if (!hinhanhsanpham_data.get(i).getName().equals("")) {
                                            hasp.setDuongDan(hinhanhsanpham_data.get(i).getName());
                                        }
                                        String path_moi = path + hasp.getDuongDan();
                                        if (!path_cu.equals(path_moi)) {
                                            HinhAnh.DiChuyenHinhAnh(path_cu, path_moi);
                                        }
                                        HinhAnhSanPhamDAO.CapNhatHinhAnhSanPham(hasp);

                                        File file = new File(path + hinhanhsanpham_data.get(i).getName());
                                        try {
                                            hinhanhsanpham_data.get(i).write(file);
                                        } catch (Exception ex) {
                                            Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                                        }
                                    }
                                    //</editor-fold>
                                }
                            } else {
                                //<editor-fold defaultstate="collapsed" desc="cơ bản">                                                                
                                String[] stt = request.getParameterValues("ID");
                                for (int i = 0; i < stt.length; i++) {
                                    int k = Integer.parseInt(stt[i]);

                                    String masanpham = request.getParameterValues("MaSanPham")[k].toString();
                                    msp = masanpham;
                                    String tensanpham = request.getParameterValues("TenSanPham")[k].toString();
                                    Loaisanpham lsp = new Loaisanpham();
                                    lsp.setMaLoaiSanPham(request.getParameterValues("MaLoaiSanPham")[k].toString());
                                    Hang h = new Hang();
                                    h.setMaHang(request.getParameterValues("MaHang")[k].toString());
                                    int soluong = Integer.parseInt(request.getParameterValues("SoLuong")[k].toString());
                                    float giaban = 0;
                                    try {
                                        giaban = df.parse(request.getParameterValues("GiaBan")[k].toString()).floatValue();
                                    } catch (ParseException ex) {
                                        Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                    String mausac = request.getParameterValues("MauSac")[k].toString();
                                    String thoigianbaohanh = request.getParameterValues("ThoiGianBaoHanh")[k].toString();
                                    String kichthuoc = request.getParameterValues("KichThuoc")[k].toString();
                                    String trongluong = request.getParameterValues("TrongLuong")[k].toString();
                                    int tinhtrang = Integer.parseInt(request.getParameterValues("TinhTrang")[k].toString());

                                    Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(masanpham);
                                    sp.setTenSanPham(tensanpham);
                                    sp.setLoaisanpham(lsp);
                                    sp.setHang(h);
                                    sp.setSoLuong(soluong);
                                    sp.setGiaBan(giaban);
                                    sp.setMauSac(mausac);
                                    sp.setThoiGianBaoHanh(thoigianbaohanh);
                                    sp.setKichThuoc(kichthuoc);
                                    sp.setTrongLuong(trongluong);
                                    sp.setTinhTrang(tinhtrang);

                                    SanPhamDAO.CapNhatSanPham(sp);
                                }
                                //</editor-fold>
                            }

                            String thongbao = "";
                            thongbao = "Đã cập nhật thành công";
                            request.setAttribute("thongbao", thongbao);

                            if (capnhat.equals("chitiet")) {
                                request.getRequestDispatcher("view?task=quanly&task_chitiet=sanpham&CapNhat=chitiet&MSP=" + msp).forward(request, response);
                            } else {
                                request.getRequestDispatcher("view?task=quanly&task_chitiet=sanpham").forward(request, response);
                            }
                            return;
                        }
                        //</editor-fold>

                        //<editor-fold defaultstate="collapsed" desc="xoá">                        
                        if (request.getParameter("Xoa") != null) {
                            String[] stt = request.getParameterValues("ID");
                            for (int i = 0; i < stt.length; i++) {
                                int k = Integer.parseInt(stt[i]);

                                String masanpham = request.getParameterValues("MaSanPham")[k].toString();
                                Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(masanpham);
                                sp.setTinhTrang(1);

                                SanPhamDAO.CapNhatSanPham(sp);
                            }

                            String thongbao = "";
                            thongbao = "Đã xoá thành công";
                            request.setAttribute("thongbao", thongbao);

                            request.getRequestDispatcher("view?task=quanly&task_chitiet=sanpham").forward(request, response);
                            return;
                        }
                        //</editor-fold>

                        request.getRequestDispatcher("QuanLyAdmin_SanPham.jsp").forward(request, response);
                        return;
                    }
                    //</editor-fold>

                    //<editor-fold defaultstate="collapsed" desc="Khuyến mãi">
                    if (task_chitiet.equals("khuyenmai")) {
                        //<editor-fold defaultstate="collapsed" desc="thêm">
                        if (request.getParameter("Them") != null) {
                            ArrayList<FileItem> hinhanhsanpham_data = new ArrayList<FileItem>();
                            Hashtable params = new Hashtable();
                            if (ServletFileUpload.isMultipartContent(request)) {
                                ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
                                try {
                                    List fileItemsList = servletFileUpload.parseRequest(request);

                                    Iterator it = fileItemsList.iterator();

                                    while (it.hasNext()) {
                                        FileItem fileItem = (FileItem) it.next();
                                        if (fileItem.isFormField()) {
                                            String value = fileItem.getString("UTF-8");
                                            String key = fileItem.getFieldName();
                                            params.put(key, value);
                                        } else {
                                            hinhanhsanpham_data.add(fileItem);
                                        }
                                    }
                                } catch (Exception e) {
                                    out.println(e);
                                    return;
                                }

                                Sanpham sp = new Sanpham();
                                sp.setMaSanPham(params.get("MaSanPham").toString());
                                sp.setTenSanPham(params.get("TenSanPham").toString());
                                Loaisanpham lsp = new Loaisanpham();
                                lsp.setMaLoaiSanPham(params.get("MaLoaiSanPham").toString());
                                sp.setLoaisanpham(lsp);
                                Hang h = HangDAO.LayHangTheoMa(params.get("MaHang").toString());
                                sp.setHang(h);
                                sp.setSoLuong(Integer.parseInt(params.get("SoLuong").toString()));
                                sp.setGiaBan(Float.parseFloat(params.get("GiaBan").toString()));
                                sp.setMauSac(params.get("MauSac").toString());
                                sp.setThoiGianBaoHanh(params.get("ThoiGianBaoHanh").toString());
                                sp.setKichThuoc(params.get("KichThuoc").toString());
                                sp.setTrongLuong(params.get("TrongLuong").toString());
                                sp.setTinhTrang(0);

                                SanPhamDAO.ThemSanPham(sp);

                                String path = getServletContext().getRealPath("/") + "images\\";

                                if (sp.getLoaisanpham().getMaLoaiSanPham().equals("DT")) {
                                    path += "dien thoai\\";

                                    Chitietdienthoai ctdt = ChiTietDienThoaiDAO.LayChiTietDienThoaiCuoiCung();
                                    int chiso = 1;
                                    if (ctdt == null) {
                                        ctdt = new Chitietdienthoai();
                                    } else {
                                        chiso = Integer.parseInt(ctdt.getMaChiTietDienThoai().substring(5).toString());
                                        chiso += 1;
                                    }
                                    ctdt.setMaChiTietDienThoai("MCTDT" + chiso);
                                    ctdt.setSanpham(sp);
                                    ctdt.setMang(params.get("Mang").toString());
                                    ctdt.setLoaiManHinh(params.get("LoaiManHinh").toString());
                                    ctdt.setNgonNgu(params.get("NgonNgu").toString());

                                    ChiTietDienThoaiDAO.Them(ctdt);
                                }

                                if (sp.getLoaisanpham().getMaLoaiSanPham().equals("LT")) {
                                    path += "laptop\\";

                                    Chitietlaptop ctlt = ChiTietLaptopDAO.LayChiTietLaptopCuoiCung();
                                    int chiso = 1;
                                    if (ctlt == null) {
                                        ctlt = new Chitietlaptop();
                                    } else {
                                        chiso = Integer.parseInt(ctlt.getMaChiTietLaptop().substring(5).toString());
                                        chiso += 1;
                                    }
                                    ctlt.setMaChiTietLaptop("MCTLT" + chiso);
                                    ctlt.setSanpham(sp);
                                    ctlt.setCongNgheCpu(params.get("CongNgheCPU").toString());
                                    ctlt.setTocDoCpu(params.get("TocDoCPU").toString());
                                    ctlt.setBoNhoDem(params.get("BoNhoDem").toString());

                                    ChiTietLaptopDAO.Them(ctlt);
                                }

                                path += sp.getHang().getTenHang() + "\\";

                                Hinhanhsanpham hasp_cuoi = HinhAnhSanPhamDAO.LayHinhAnhSanPhamCuoiCung();
                                int chiso = 1;
                                if (hasp_cuoi == null) {
                                    hasp_cuoi = new Hinhanhsanpham();
                                } else {
                                    chiso = Integer.parseInt(hasp_cuoi.getMaHinhAnhSanPham().substring(5));
                                    chiso += 1;
                                }
                                String mhasp = "MHASP" + chiso;

                                for (int i = 0; i < hinhanhsanpham_data.size(); i++) {
                                    Hinhanhsanpham hasp = new Hinhanhsanpham();
                                    hasp.setMaHinhAnhSanPham(mhasp);
                                    hasp.setSanpham(sp);
                                    hasp.setTinhTrang(0);
                                    hasp.setDuongDan(hinhanhsanpham_data.get(i).getName());

                                    HinhAnhSanPhamDAO.Them(hasp);

                                    File file = new File(path + hinhanhsanpham_data.get(i).getName());
                                    try {
                                        hinhanhsanpham_data.get(i).write(file);
                                    } catch (Exception ex) {
                                        Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                                    }

                                    chiso += 1;
                                    mhasp = "MHASP" + chiso;
                                }

                                String thongbao = "";
                                thongbao = "Đã thêm sản phẩm thành công";
                                request.setAttribute("thongbao", thongbao);
                            }

                            request.getRequestDispatcher("QuanLyAdmin_SanPham_Them.jsp").forward(request, response);
                            return;
                        }
                        //</editor-fold>

                        //<editor-fold defaultstate="collapsed" desc="cập nhật">                        
                        if (request.getParameter("CapNhat") != null) {
                            String capnhat = request.getParameter("CapNhat").toString();
                            DecimalFormat df = new DecimalFormat("###,###,###");

                            String mkm = "";

                            if (capnhat.equals("chitiet")) {
                                //<editor-fold defaultstate="collapsed" desc="chi tiết">
                                ArrayList<FileItem> hinhanhkhuyenmai_data = new ArrayList<FileItem>();
                                int[] hinhanhkhuyenmai_chiso = new int[6];
                                Hashtable params = new Hashtable();
                                if (ServletFileUpload.isMultipartContent(request)) {
                                    ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
                                    try {
                                        List fileItemsList = servletFileUpload.parseRequest(request);

                                        Iterator it = fileItemsList.iterator();

                                        while (it.hasNext()) {
                                            FileItem fileItem = (FileItem) it.next();
                                            if (fileItem.isFormField()) {
                                                String value = fileItem.getString("UTF-8");
                                                String key = fileItem.getFieldName();
                                                params.put(key, value);
                                            } else {
                                                hinhanhkhuyenmai_data.add(fileItem);
                                            }
                                        }
                                    } catch (Exception e) {
                                        out.println(e);
                                        return;
                                    }

                                    mkm = params.get("MaKhuyenMai").toString();

                                    Khuyenmai km = KhuyenMaiDAO.LayKhuyenMaiTheoMa(params.get("MaKhuyenMai").toString());
                                    km.setNoiDungKhuyenMai(params.get("Content").toString().replaceAll("\n", ""));
                                    km.setTenKhuyenMai(params.get("TenKhuyenMai").toString());
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                    Date ngaybatdau = null;
                                    Date ngayketthuc = null;
                                    try {
                                        ngaybatdau = sdf.parse(params.get("NgayBatDau").toString());
                                        ngayketthuc = sdf.parse(params.get("NgayKetThuc").toString());
                                    } catch (ParseException ex) {
                                        Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                    km.setNgayBatDau(ngaybatdau);
                                    km.setNgayKetThuc(ngayketthuc);
                                    km.setTinhTrang(Integer.parseInt(params.get("TinhTrang").toString()));

                                    KhuyenMaiDAO.CapNhatKhuyenMai(km);

                                    String path = getServletContext().getRealPath("/") + "images\\khuyen mai\\";

                                    for (int i = 0; i < hinhanhkhuyenmai_data.size(); i++) {
                                        Hinhanhkhuyenmai hakm = (Hinhanhkhuyenmai) km.getHinhanhkhuyenmais().toArray()[i];
                                        hakm.setTinhTrang(0);
                                        if (!hinhanhkhuyenmai_data.get(i).getName().equals("")) {
                                            hakm.setDuongDan(hinhanhkhuyenmai_data.get(i).getName());
                                        }
                                        HinhAnhKhuyenMaiDAO.CapNhatHinhAnhKhuyenMai(hakm);

                                        File file = new File(path + hinhanhkhuyenmai_data.get(i).getName());
                                        try {
                                            hinhanhkhuyenmai_data.get(i).write(file);
                                        } catch (Exception ex) {
                                            Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                                        }
                                    }
                                }
                                //</editor-fold>                                
                            } else {
                                //<editor-fold defaultstate="collapsed" desc="cơ bản">                                                                
                                String[] stt = request.getParameterValues("ID");
                                for (int i = 0; i < stt.length; i++) {
                                    int k = Integer.parseInt(stt[i]);

                                    String makhuyemmai = request.getParameterValues("MaKhuyenMai")[k].toString();
                                    mkm = makhuyemmai;
                                    String tenkhuyenmai = request.getParameterValues("TenKhuyenMai")[k].toString();
                                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                                    String ngaybatdau_temp = request.getParameterValues("NgayBatDau")[k].toString();
                                    String ngayketthuc_temp = request.getParameterValues("NgayKetThuc")[k].toString();
                                    Date ngaybatdau = null;
                                    Date ngayketthuc = null;
                                    try {
                                        ngaybatdau = sdf.parse(ngaybatdau_temp);
                                        ngayketthuc = sdf.parse(ngayketthuc_temp);
                                    } catch (ParseException ex) {
                                        Logger.getLogger(process.class.getName()).log(Level.SEVERE, null, ex);
                                    }
                                    int tinhtrang = Integer.parseInt(request.getParameterValues("TinhTrang")[k].toString());

                                    Khuyenmai km = KhuyenMaiDAO.LayKhuyenMaiTheoMa(mkm);
                                    km.setMaKhuyenMai(makhuyemmai);
                                    km.setTenKhuyenMai(tenkhuyenmai);
                                    km.setNgayBatDau(ngaybatdau);
                                    km.setNgayKetThuc(ngayketthuc);
                                    km.setTinhTrang(tinhtrang);

                                    KhuyenMaiDAO.CapNhatKhuyenMai(km);
                                }
                                //</editor-fold>
                            }

                            String thongbao = "";
                            thongbao = "Đã cập nhật thành công";
                            request.setAttribute("thongbao", thongbao);

                            if (capnhat.equals("chitiet")) {
                                request.getRequestDispatcher("view?task=quanly&task_chitiet=khuyenmai&CapNhat=chitiet&MKM=" + mkm).forward(request, response);
                            } else {
                                request.getRequestDispatcher("view?task=quanly&task_chitiet=khuyenmai").forward(request, response);
                            }
                            return;
                        }
                        //</editor-fold>

                        //<editor-fold defaultstate="collapsed" desc="xoá">                        
                        if (request.getParameter("Xoa") != null) {
                            String[] stt = request.getParameterValues("ID");
                            for (int i = 0; i < stt.length; i++) {
                                int k = Integer.parseInt(stt[i]);

                                String masanpham = request.getParameterValues("MaSanPham")[k].toString();
                                Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(masanpham);
                                sp.setTinhTrang(1);

                                SanPhamDAO.CapNhatSanPham(sp);
                            }

                            String thongbao = "";
                            thongbao = "Đã xoá thành công";
                            request.setAttribute("thongbao", thongbao);

                            request.getRequestDispatcher("view?task=quanly&task_chitiet=sanpham").forward(request, response);
                            return;
                        }
                        //</editor-fold>

                        //<editor-fold defaultstate="collapsed" desc="xử lý upload hình cho bài viết - chưa làm được gì">
                        if (task.equals("1")) {
                            ArrayList<FileItem> hinhanhsanpham_data = new ArrayList<FileItem>();
                            Hashtable params = new Hashtable();
                            if (ServletFileUpload.isMultipartContent(request)) {
                                ServletFileUpload servletFileUpload = new ServletFileUpload(new DiskFileItemFactory());
                                try {
                                    List fileItemsList = servletFileUpload.parseRequest(request);

                                    Iterator it = fileItemsList.iterator();

                                    while (it.hasNext()) {
                                        FileItem fileItem = (FileItem) it.next();
                                        if (fileItem.isFormField()) {
                                            String value = fileItem.getString("UTF-8");
                                            String key = fileItem.getFieldName();
                                            params.put(key, value);
                                        } else {
                                            hinhanhsanpham_data.add(fileItem);
                                        }
                                    }
                                } catch (Exception e) {
                                    out.println(e);
                                    return;
                                }
                            }

                            List<Sanpham> list = SanPhamDAO.LayHetSanPham(5, 2);

                            request.getRequestDispatcher("").forward(request, response);

                            return;
                        }
                        //</editor-fold>

                        request.getRequestDispatcher("QuanLyAdmin_SanPham.jsp").forward(request, response);
                        return;
                    }
                    //</editor-fold>                    

                    request.getRequestDispatcher("QuanLyAdmin_SanPham.jsp").forward(request, response);
                    return;
                }
            }
            //</editor-fold>           

            //<editor-fold defaultstate="collapsed" desc="upload hình cho bài viết khuyến mãi - tin tức">                        
            //task = 1 => khuyến mãi
            //task = 2 => tin tức
            if (task.equals("1") || task.equals("2")) {
                long serialVersionUID = 6748857432950840322L;
                String DESTINATION_DIR_PATH = "images/khuyen mai/bai viet";
                if (task.equals("2")) {
                    DESTINATION_DIR_PATH = "images/tin tuc/bai viet";
                }
                String realPath;
                realPath = getServletContext().getRealPath(DESTINATION_DIR_PATH) + "/";

                PrintWriter writer = null;
                InputStream is = null;
                FileOutputStream fos = null;

                try {
                    writer = response.getWriter();
                } catch (IOException ex) {
                    log(process.class.getName() + "has thrown an exception: " + ex.getMessage());
                }

                String filename = request.getHeader("X-File-Name");
                try {
                    is = request.getInputStream();
                    fos = new FileOutputStream(new File(realPath + filename));
                    IOUtils.copy(is, fos);
                    response.setStatus(response.SC_OK);
                    writer.print("{success: true}");
                } catch (FileNotFoundException ex) {
                    response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
                    writer.print("{success: false}");
                    log(process.class.getName() + "has thrown an exception: " + ex.getMessage());
                } catch (IOException ex) {
                    response.setStatus(response.SC_INTERNAL_SERVER_ERROR);
                    writer.print("{success: false}");
                    log(process.class.getName() + "has thrown an exception: " + ex.getMessage());
                } finally {
                    try {
                        fos.close();
                        is.close();
                    } catch (IOException ignored) {
                    }
                }

                writer.flush();
                writer.close();

                return;
            }
            //</editor-fold>

            request.getRequestDispatcher("QuanLyAdmin.jsp").forward(request, response);
            return;

        } finally {
            out.close();
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
