/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Nguoidung;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;


/**
 *
 * @author HP
 */
public class NguoiDungDAO {
    public static Nguoidung DangNhap(String tenDangNhap,String matKhau){
        Nguoidung ndung = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try{            
            String hql = "FROM Nguoidung WHERE tenDangNhap=:tenDangNhap AND matKhau=:matKhau";            
            Query query = session.createQuery(hql);          
            query.setString("tenDangNhap",tenDangNhap);
            query.setString("matKhau", matKhau); 
            //List<Nguoidung> list = query.list();
            //session.get(ndung.getClass(), ndung);
            Object ob = query.uniqueResult();
            ndung = (Nguoidung)ob; 
                                            
        }catch(HibernateException ex){
            System.err.println(ex);
           
        }
        finally{
            session.close();
        }
        return ndung;
    } 
    
}
