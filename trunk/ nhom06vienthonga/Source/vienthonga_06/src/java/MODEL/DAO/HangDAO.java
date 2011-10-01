/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Hang;

import MODEL.UTIL.HibernateUtil;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author LAPTOP
 */
public class HangDAO {
    public static List<Hang> LayHang()
    {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Hang> list = null;        

        try {
            String hql = "FROM Hang WHERE tinhTrang = 0";
            Query query = session.createQuery(hql);
            //query.setInteger("tt", 0);
            list = query.list();
            
            //
            Hang h = new Hang();
            session.saveOrUpdate(h);
        } catch (Exception ex) {
            Logger.getLogger(HangDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally
        {
            session.close();
        }
        
        return list;
    }
}
