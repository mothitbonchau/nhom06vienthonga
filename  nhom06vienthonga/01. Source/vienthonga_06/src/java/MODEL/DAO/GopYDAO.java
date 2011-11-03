/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Gopy;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 *
 * @author HP
 */
public class GopYDAO {
    public static int GopY(Gopy gopy){
       int kq = -1;
       Session session = HibernateUtil.getSessionFactory().openSession();
       Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.saveOrUpdate(gopy);
            transaction.commit();
            kq = 1;
            
        } catch (Exception e) {
            transaction.rollback();
            System.err.println(e);
        }
        finally{
           session.close();
        }
       return kq;       
    }
    public static List<Gopy> LayDSGopY(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Gopy> gop = null;
        try {
            String hql = "FROM Gopy";
            Query query = session.createQuery(hql);
            gop = query.list();
        } catch (Exception e) {
        }
        finally{
            session.close();
        }
        return gop;
    }
    public static String LayMaGopYCuoi(){
        String ma = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "SELECT max(maGopY)FROM Gopy ";
            Query query = session.createQuery(hql);
            Object ob = query.uniqueResult();
            ma = (String) ob;
        } catch (Exception e) {
            System.err.println();
        }
        finally{
            session.close();
        }
        return ma;
    }
}
