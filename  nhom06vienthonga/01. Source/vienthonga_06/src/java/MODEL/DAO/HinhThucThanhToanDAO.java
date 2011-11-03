/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Hinhthucthanhtoan;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author thienanh
 */
public class HinhThucThanhToanDAO {
    public static List<Hinhthucthanhtoan> LayListHinhThucThanhToan(){
        List<Hinhthucthanhtoan> list = null;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try{
            transaction = session.beginTransaction();
            
            String hql = "From Hinhthucthanhtoan Where tinhTrang=0 " ;
            Query query = session.createQuery(hql);
            list = query.list();
            
            transaction.commit();
        }
        catch(Exception ex){
            transaction.rollback();
        }
        finally{
            session.close();
        }
        
        return list;
    }
    
     public static Hinhthucthanhtoan LayHinhThucThanhToanTheoMa(String mht) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Hinhthucthanhtoan sp = (Hinhthucthanhtoan) session.get(Hinhthucthanhtoan.class, mht);

        session.close();

        return sp;
    }
}
