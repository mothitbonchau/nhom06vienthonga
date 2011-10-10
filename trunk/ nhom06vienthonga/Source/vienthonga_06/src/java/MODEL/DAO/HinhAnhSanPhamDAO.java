/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.*;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author LAPTOP
 */
public class HinhAnhSanPhamDAO {
    public static Hinhanhsanpham LayHinhAnhSanPhamCuoiCung() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Hinhanhsanpham gh = null;

        String hql = "select max(hasp.maHinhAnhSanPham) ";
        hql += "from Hinhanhsanpham hasp ";
        hql += "where length(substring(hasp.maHinhAnhSanPham,4)) = (select max(length(substring(hasp.maHinhAnhSanPham,4))) from Hinhanhsanpham hasp)";

        try {
            Query query = session.createQuery(hql);
            String mhasp_cuoi = (String) query.uniqueResult();
            gh = LayHinhAnhSanPhamTheoMa(mhasp_cuoi);
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return gh;
    }

    public static Hinhanhsanpham LayHinhAnhSanPhamTheoMa(String mhasp) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Hinhanhsanpham hasp = (Hinhanhsanpham) session.get(Hinhanhsanpham.class, mhasp);

        session.close();

        return hasp;
    }
    
    public static int Them(Hinhanhsanpham hasp) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(hasp);
            transaction.commit();
            kq = 1;
        } catch (Exception ex) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return kq;
    }
}
