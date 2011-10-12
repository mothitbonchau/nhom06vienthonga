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
public class ChiTietLaptopDAO {
    public static Chitietlaptop LayChiTietLaptopCuoiCung() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Chitietlaptop ctlt = null;

        String hql = "select max(ctlt.maChiTietLaptop)";
        hql += "from Chitietlaptop ctlt ";
        hql += "where length(substring(ctlt.maChiTietLaptop,4)) = (select max(length(substring(ctlt.maChiTietLaptop,4))) from Chitietlaptop ctlt)";
        
        try {
            Query query = session.createQuery(hql);
            String mctlt_cuoi = (String) query.uniqueResult();            
            ctlt = LayChiTietLaptopTheoMa(mctlt_cuoi);
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return ctlt;
    }
    
    public static Chitietlaptop LayChiTietLaptopTheoMa(String mctlt) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Chitietlaptop ctlt = (Chitietlaptop) session.get(Chitietlaptop.class, mctlt);

        session.close();

        return ctlt;
    }
    
    public static int Them(Chitietlaptop ctlt) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(ctlt);
            transaction.commit();
            kq = 1;
        } catch (Exception ex) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return kq;
    }

    public static int CapNhatChiTietLaptop(Chitietlaptop ctlt) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.update(ctlt);
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
