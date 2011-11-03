/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Sanpham;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author LAPTOP
 */
public class SanPhamDAO {

    public static List<Sanpham> LaySanPham() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sanpham> list = null;

        try {
            String hql = "FROM Sanpham s WHERE s.tinhTrang=:tt ORDER BY maSanPham DESC";
            Query query = session.createQuery(hql);
            query.setInteger("tt", 0);
            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }
        
    public static Sanpham LaySanPhamCuoiCung() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Sanpham sp = null;

        String hql = "select max(s.maSanPham)";
        hql += "from Sanpham s ";
        hql += "where length(substring(s.maSanPham,4)) = (select max(length(substring(s.maSanPham,4))) from Sanpham s)";
        
        try {
            Query query = session.createQuery(hql);
            String msp_cuoi = (String) query.uniqueResult();            
            sp = LaySanPhamTheoMa(msp_cuoi);
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return sp;
    }

    public static List<Sanpham> LaySanPham(int batdau, int sp1trang) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sanpham> list = null;

        try {
            String hql = "FROM Sanpham s WHERE s.tinhTrang=0";
            Query query = session.createQuery(hql);
            if (batdau >= 0 && sp1trang > 0) {
                query.setFirstResult(batdau);
                query.setMaxResults(sp1trang);
            }

            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }
    
    public static List<Sanpham> LayHetSanPham(int batdau, int sp1trang) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sanpham> list = null;

        try {
            String hql = "FROM Sanpham s";
            Query query = session.createQuery(hql);
            if (batdau >= 0 && sp1trang > 0) {
                query.setFirstResult(batdau);
                query.setMaxResults(sp1trang);
            }

            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }
    
    public static List<Sanpham> LaySanPhamTheoHang(String mh, int batdau, int sp1trang) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sanpham> list = null;

        try {
            String hql = "FROM Sanpham s WHERE s.tinhTrang=0 and s.hang=:mh";
            Query query = session.createQuery(hql);
            query.setString("mh", mh);
            if (batdau >= 0 && sp1trang > 0) {
                query.setFirstResult(batdau);
                query.setMaxResults(sp1trang);
            }

            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static Sanpham LaySanPhamTheoMa(String msp) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Sanpham sp = (Sanpham) session.get(Sanpham.class, msp);

        session.close();

        return sp;
    }

    public static List<Sanpham> LaySanPhamTheoLoai(String lsp, int batdau, int sp1trang) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sanpham> list = null;

        try {
            String hql = "FROM Sanpham WHERE loaisanpham=:lsp";
            Query query = session.createQuery(hql);
            query.setString("lsp", lsp);
            if (batdau >= 0 && sp1trang > 1) {
                query.setFirstResult(batdau);
                query.setMaxResults(sp1trang);
            }

            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static List<Sanpham> TimKiem(Sanpham sp, int batdau, int sp1trang) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sanpham> list = null;

        try {
            String hql = "FROM Sanpham WHERE 1=1";
            if (!sp.getTenSanPham().equals("")) {
                hql += " and tenSanPham like '%" + sp.getTenSanPham() + "%'";
            }
            if (!sp.getLoaisanpham().getMaLoaiSanPham().equals("-1")) {
                hql += " and loaisanpham.maLoaiSanPham = '" + sp.getLoaisanpham().getMaLoaiSanPham() + "'";
            }
            if (!sp.getHang().getMaHang().equals("-1")) {
                hql += " and hang = '" + sp.getHang().getMaHang() + "'";
            }
            if (sp.getGiaBan() > 0) {
                if(sp.getGiaBan() == 9000000)
                {
                    hql += " and giaBan >= " + sp.getGiaBan().toString();
                }
                else
                {
                    hql += " and giaBan >= " + sp.getGiaBan().toString() + " and giaBan <= " + (sp.getGiaBan() + 2000000);
                }
            }
            if(sp.getGiaBan() < 0)
            {
                
            }
            else
            {
                hql += " and giaBan <= " + (sp.getGiaBan() + 3000000);
            }

            Query query = session.createQuery(hql);

            if (batdau >= 0 && sp1trang > 1) {
                query.setFirstResult(batdau);
                query.setMaxResults(sp1trang);
            }

            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static int ThemSanPham(Sanpham sp) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(sp);
            transaction.commit();
            kq = 1;
        } catch (Exception ex) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return kq;
    }

    public static int CapNhatSanPham(Sanpham sp) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(sp);
            transaction.commit();
            kq = 1;
        } catch (Exception ex) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return kq;
    }
    
    public static List<Sanpham> LayListSanPhamTheoMaNguoiDung(String maNguoiDung){
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Sanpham> listsp = null;
        try {
            String hql = "FROM Sanpham WHERE tinhTrang=0 AND maNguoiDung='"+maNguoiDung+"'";
            Query query = session.createQuery(hql);
            listsp = query.list();
        } catch (Exception e) {
            System.err.println(e);
        }
        finally{
            session.close();
        }
        return listsp;
    }
}
