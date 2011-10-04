/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package CONTROLLER;

import MODEL.DAO.SanPhamDAO;
import MODEL.DAO.ThamSoDao;
import MODEL.POJO.Hang;
import MODEL.POJO.Loaisanpham;
import MODEL.POJO.Sanpham;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "proccess", urlPatterns = {"/proccess"})
public class proccess extends HttpServlet {

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
