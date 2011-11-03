/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Giamgia;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
/**
 *
 * @author thienanh
 */
public class GiamGiaDAO {
    public static Giamgia LayTienGiamGiaTheoMaSanPham(String maSanPham) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Giamgia sp = null;

        String hql = "From Giamgia Where maSanPham = '" + maSanPham + "'";
                
        try {
            Query query = session.createQuery(hql);
            sp = (Giamgia) query.uniqueResult();          
            
        } catch (Exception ex) {
            
        } finally {
            session.close();
        }

        return sp;
    }
}
