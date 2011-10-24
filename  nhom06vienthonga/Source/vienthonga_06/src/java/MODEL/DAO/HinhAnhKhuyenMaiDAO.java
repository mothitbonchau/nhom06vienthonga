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
public class HinhAnhKhuyenMaiDAO {
    public static Hinhanhkhuyenmai LayHinhAnhKhuyenMaiCuoiCung() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Hinhanhkhuyenmai gh = null;

        String hql = "select max(hakm.maHinhAnhKhuyenMai) ";
        hql += "from Hinhanhkhuyenmai hakm ";
        hql += "where length(substring(hakm.maHinhAnhKhuyenMai,4)) = (select max(length(substring(hakm.maHinhAnhKhuyenMai,4))) from Hinhanhkhuyenmai hakm)";

        try {
            Query query = session.createQuery(hql);
            String mhakm_cuoi = (String) query.uniqueResult();
            gh = LayHinhAnhKhuyenMaiTheoMa(mhakm_cuoi);
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return gh;
    }

    public static Hinhanhkhuyenmai LayHinhAnhKhuyenMaiTheoMa(String mhakm) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Hinhanhkhuyenmai hakm = (Hinhanhkhuyenmai) session.get(Hinhanhkhuyenmai.class, mhakm);

        session.close();

        return hakm;
    }
    
    public static int Them(Hinhanhkhuyenmai hakm) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(hakm);
            transaction.commit();
            kq = 1;
        } catch (Exception ex) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return kq;
    }

    public static int CapNhatHinhAnhKhuyenMai(Hinhanhkhuyenmai hakm) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(hakm);
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
