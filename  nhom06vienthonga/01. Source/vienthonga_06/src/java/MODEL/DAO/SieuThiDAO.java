/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Sieuthi;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;

import org.hibernate.Session;

/**
 *
 * @author thien-anh
 */
public class SieuThiDAO {
    public static List<Sieuthi> LayDSSieuThi(){
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sieuthi> list = null;

        try {
            String hql = "FROM Sieuthi";
            Query query = session.createQuery(hql);
            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }
        return list;
    }
    public static List<Sieuthi> LaySieuThiTheoMaVung(String MaVung){
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Sieuthi> DS = null;
        try {
            String hql = "FROM Sieuthi WHERE maVung = '"+MaVung+"'";
            Query query = session.createQuery(hql);
            DS = query.list();
        } catch (Exception e) {
        }
        finally{
            session.close();
        }
        return DS;
        
    }
}
