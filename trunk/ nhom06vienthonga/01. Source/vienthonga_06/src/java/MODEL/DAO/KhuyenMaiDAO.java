/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Khuyenmai;
import MODEL.POJO.Khuyenmai;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author LAPTOP
 */
public class KhuyenMaiDAO {

    public static List<Khuyenmai> LayKhuyenMai() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Khuyenmai> list = null;

        try {
            String hql = "FROM Khuyenmai kh WHERE kh.tinhTrang=:tt ORDER BY maKhuyenMai DESC";
            Query query = session.createQuery(hql);
            query.setInteger("tt", 0);
            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static List<Khuyenmai> LayKhuyenMai(int batdau, int sp1trang) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Khuyenmai> list = null;

        try {
            String hql = "FROM Khuyenmai kh WHERE kh.tinhTrang=:tt ORDER BY maKhuyenMai DESC";
            Query query = session.createQuery(hql);
            query.setInteger("tt", 0);
            list = query.list();
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

    public static Khuyenmai LayKhuyenMaiTheoMa(String mkh) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Khuyenmai sp = (Khuyenmai) session.get(Khuyenmai.class, mkh);

        session.close();

        return sp;
    }

    public static List<Khuyenmai> LayHetKhuyenMai(int batdau, int sp1trang) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Khuyenmai> list = null;

        try {
            String hql = "FROM Khuyenmai km";
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
    
    public static int CapNhatKhuyenMai(Khuyenmai km) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(km);
            transaction.commit();
            kq = 1;
        } catch (Exception ex) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return kq;
    }

    public static int ThemKhuyenMai(Khuyenmai km) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(km);
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
