/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Thamso;
import MODEL.UTIL.HibernateUtil;
import org.hibernate.CacheMode;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LAPTOP
 */
public class ThamSoDAO {
    public static String LayDuongDanHinhAnh()
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        String path = "";
        
        String hql = "SELECT duongDanHinhAnh FROM Thamso";
        Query query = session.createQuery(hql);
        path = query.list().get(0).toString();
        
        session.close();
        return path;
    }
    
    public static int LaySoSanPhamTrenTrang()
    {
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        int sp1trang = 0;
        
        String hql = "SELECT soSanPhamTrenTrang FROM Thamso";
        Query query = session.createQuery(hql);
        sp1trang = (Integer) query.uniqueResult();
        
        session.close();
        return sp1trang;
    }
}
