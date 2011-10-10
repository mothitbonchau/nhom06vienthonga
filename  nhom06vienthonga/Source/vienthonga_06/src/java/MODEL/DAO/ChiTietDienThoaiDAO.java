/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.*;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author LAPTOP
 */
public class ChiTietDienThoaiDAO {
    public static Chitietdienthoai LayChiTietDienThoaiCuoiCung() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Chitietdienthoai ctdt = null;

        String hql = "select max(ctdt.maChiTietDienThoai)";
        hql += "from Chitietdienthoai ctdt ";
        hql += "where length(substring(ctdt.maChiTietDienThoai,4)) = (select max(length(substring(ctdt.maChiTietDienThoai,4))) from Chitietdienthoai ctdt)";
        
        try {
            Query query = session.createQuery(hql);
            String mctdt_cuoi = (String) query.uniqueResult();            
            ctdt = LayChiTietDienThoaiTheoMa(mctdt_cuoi);
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return ctdt;
    }
    
    public static Chitietdienthoai LayChiTietDienThoaiTheoMa(String mctdt) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Chitietdienthoai ctdt = (Chitietdienthoai) session.get(Chitietdienthoai.class, mctdt);

        session.close();

        return ctdt;
    }
    
    public static int Them(Chitietdienthoai ctdt) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(ctdt);
            transaction.commit();
            kq = 1;
        } catch (Exception ex) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return kq;
    }
}
