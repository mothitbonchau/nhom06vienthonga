/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Giohang;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author LAPTOP
 */
public class GioHangDAO {

    public static List<Giohang> LayGioHang() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Giohang> list = null;

        try {
            String hql = "FROM Giohang WHERE tinhTrang=:tt";
            Query query = session.createQuery(hql);
            query.setInteger("tt", 0);
            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static Giohang LayGioHangTheoMa(String mgh) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Giohang sp = (Giohang) session.get(Giohang.class, mgh);

        session.close();

        return sp;
    }

    public static Giohang LayGioHangCuoiCung() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Giohang gh = null;

        String hql = "select max(gh.maGioHang)";
        hql += "from Giohang gh ";
        hql += "where length(substring(gh.maGioHang,4)) = (select max(length(substring(gh.maGioHang,4))) from Giohang gh)";

        try {
            Query query = session.createQuery(hql);
            String mgh_cuoi = (String) query.uniqueResult();
            gh = LayGioHangTheoMa(mgh_cuoi);
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return gh;
    }

    public static int Them(Giohang gh) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(gh);
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
