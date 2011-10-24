/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Vung;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author HP
 */
public class VungDAO {
    public static List<Vung> LayDanhSachVung(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Vung> ds= null;
        try{
            String hql = "FROM Vung";
            Query query = session.createQuery(hql);
            ds = query.list();            
        }catch(Exception ex){
            
        }finally{
            session.close();
        }
         return ds;
    }
}
