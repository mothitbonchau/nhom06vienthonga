/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import MODEL.DAO.NguoiDungDAO;
import MODEL.POJO.Loainguoidung;
import MODEL.POJO.Nguoidung;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "DangKy_Controller", urlPatterns = {"/DangKy_Controller"})
public class DangKy_Controller extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
           
            String action = request.getParameter("Action");
            if (action != null) {
                if (action.equals("DangKy")) {
//                    ArrayList<DanhMucHoaPOJO> danhMucs = DanhMucHoaDAO.LayDanhSachLoaiHoa();
//                    request.setAttribute("DanhMucs", danhMucs);
                    request.getRequestDispatcher("TrangDangKy.jsp").forward(request, response);
                }
                if(action.equals("Luu")){
                    Nguoidung pojo=new Nguoidung();
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
                    pojo.setMatKhau(request.getParameter("txtPass"));
                    pojo.setEmail(request.getParameter("txtEmail"));
                    pojo.setCmnd(Integer.parseInt(request.getParameter("txtCMND")));
                    pojo.setDienThoai(Integer.parseInt(request.getParameter("txtDienThoai")));
                    pojo.setDiaChi(request.getParameter("txtDiaChi"));
                    pojo.setNgayDangKy(NgayHienTai);
                    pojo.setLoainguoidung(lnd);
                    pojo.setTinhTrang(0);
                    
                    int kq = NguoiDungDAO.DangKy(pojo);        
                    
                    //Gán Session Tên Đăng Nhập
                    HttpSession session = request.getSession();
                    session.setAttribute("MaNguoiDung", pojo.getMaNguoiDung());
                    session.setAttribute("TenDangNhap", pojo.getTenDangNhap());
                    session.setAttribute("TenNguoiDung", pojo.getTenNguoiDung());
                    session.setAttribute("Email", pojo.getEmail());
                                        
                    request.getRequestDispatcher("view").forward(request, response);                                  
                }
            }
        } catch (Exception e) {
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
