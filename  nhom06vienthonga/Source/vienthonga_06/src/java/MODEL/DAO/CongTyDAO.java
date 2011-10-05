/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Congty;
import MODEL.POJO.Thamso;
import MODEL.UTIL.HibernateUtil;
import org.hibernate.CacheMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author LAPTOP
 */
public class CongTyDAO {

    public static Congty LayCongTy() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Congty ct = new Congty();

        String hql = "FROM Congty";
        Query query = session.createQuery(hql);
        ct = (Congty) query.list().get(0);

        session.close();
        return ct;
    }

    public static int CapNhatCongTy(Congty ct) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        int kq = 0;

        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.saveOrUpdate(ct);
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
