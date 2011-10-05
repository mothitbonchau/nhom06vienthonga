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

/**
 *
 * @author LAPTOP
 */
public class CongTyDAO {
    public static Congty LayCongTy()
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Congty ct = new Congty();
        
        String hql = "FROM Congty";
        Query query = session.createQuery(hql);
        ct = (Congty) query.list().get(0);
        
        session.close();
        return ct;
    }    
}
