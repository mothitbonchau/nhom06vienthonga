/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Sanpham;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LAPTOP
 */
public class SanphamDAO {
    public static List<Sanpham> LaySanPham()
    {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sanpham> list = null;        

        try {
            String hql = "FROM Sanpham s WHERE s.tinhTrang=:tt ORDER BY maSanPham DESC";
            Query query = session.createQuery(hql);
            query.setInteger("tt", 0);
            list = query.list();
        } catch (Exception ex) {
            
        }
        finally
        {
            session.close();
        }
        
        return list;
    }
}
