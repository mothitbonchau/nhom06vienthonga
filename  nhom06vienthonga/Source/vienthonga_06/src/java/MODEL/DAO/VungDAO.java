/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Vung;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author HP
 */
public class VungDAO {

    public static List<Vung> LayDanhSachVung() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Vung> ds = null;
        try {
            String hql = "FROM Vung";
            Query query = session.createQuery(hql);
            ds = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }
        return ds;
    }

    public static Vung LayVungTheoMa(String mv) {
        Vung v = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            v = (Vung) session.get(Vung.class, mv);
        } catch (HibernateException ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return v;
    }

    public static Vung LayVungTheoTenVung(String tv) {
        Vung v = null;

        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "from Vung where tenVung = '" + tv + "'";
            Query query = session.createQuery(hql);
            v = (Vung) query.uniqueResult();
        } catch (HibernateException ex) {
            System.err.println();
        } finally {
            session.close();
        }
        return v;
    }
}
