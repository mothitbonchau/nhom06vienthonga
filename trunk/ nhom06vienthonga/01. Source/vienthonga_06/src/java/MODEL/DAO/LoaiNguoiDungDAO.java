/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Loainguoidung;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.catalina.connector.Request;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author HP
 */
public class LoaiNguoiDungDAO {
    public static List<Loainguoidung> LayListLoaiNguoiDung(){
        List<Loainguoidung> list = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{
            String hql = "From Loainguoidung";
            Query query = session.createQuery(hql);
            list = query.list();
        }
        catch(HibernateException ex){
            System.err.println(ex);
        }
        finally{
            session.close();
        }
        return list;
    }
}
