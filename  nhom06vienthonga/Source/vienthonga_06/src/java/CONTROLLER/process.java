/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import MODEL.DAO.*;
import MODEL.POJO.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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

            //<editor-fold defaultstate="collapsed" desc="tìm kiếm sản phẩm">
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

                int sp1trang = ThamSoDao.LaySoSanPhamTrenTrang();
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

            //<editor-fold defaultstate="collapsed" desc="đặt mua sản phẩm">
            if (task.equals("datmua")) {
                String msp = request.getParameter("MSP");

                if (session.getAttribute("TenDangNhap") == null) {
                    String thongbao = "";
                    thongbao = "Vui lòng đăng nhập";
                    request.setAttribute("thongbao", thongbao);

                    request.getRequestDispatcher("view?task=chitietsanpham&MSP=" + msp).forward(request, response);
                    return;
                }

                Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(msp);
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
                gh.setThanhTien((float) 0);
                gh.setTinhTrang(0);
                Nguoidung nd = NguoiDungDAO.LayNguoiDungTheoTenDangNhap(session.getAttribute("TenDangNhap").toString());
                gh.setNguoidung(nd);

                int kq = GioHangDAO.Them(gh);

                if (kq == 1) {
                    String thongbao = "";
                    thongbao = "Đã đặt mua thành công";
                    request.setAttribute("thongbao", thongbao);
                }

                sp = SanPhamDAO.LaySanPhamTheoMa(msp);

                request.setAttribute("sanpham", sp);
                request.getRequestDispatcher("ChiTietSanPham.jsp").forward(request, response);
                return;
            }
            //</editor-fold>

            //<editor-fold defaultstate="collapsed" desc="Xử lý đăng nhập">
            if (task.equals("XuLy")) {
                Nguoidung ndung = NguoiDungDAO.DangNhap(request.getParameter("tenDangNhap"), request.getParameter("matKhau"));
                if (ndung != null) {
                    session.setAttribute("TenDangNhap", ndung.getTenDangNhap());
                    request.getRequestDispatcher("view").forward(request, response);
                } else {
                    response.sendRedirect("view?task=DangNhap");
                }
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

                        request.getRequestDispatcher("QuanLyAdmin_NguoiDung.jsp").forward(request, response);
                        return;
                    }
                    //</editor-fold>

                    //<editor-fold defaultstate="collapsed" desc="Sản phẩm">
                    if (task_chitiet.equals("sanpham")) {
                        //thêm
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

                                SanPhamDAO.Them(sp);

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
                        }

                        //cập nhật
                        if (request.getParameter("CapNhat") != null) {
                            request.getRequestDispatcher("QuanLyAdmin_SanPham_Them.jsp").forward(request, response);
                            return;
                        }

                        //xoá
                        if (request.getParameter("Xoa") != null) {
                            request.getRequestDispatcher("QuanLyAdmin_SanPham_Them.jsp").forward(request, response);
                            return;
                        }

                        request.getRequestDispatcher("QuanLyAdmin_SanPham_Them.jsp").forward(request, response);
                        return;
                    }

                    request.getRequestDispatcher("QuanLyAdmin_SanPham.jsp").forward(request, response);
                    return;
                }
                //</editor-fold>
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
