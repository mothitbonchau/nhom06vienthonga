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
public class SanPhamDAO {

    public static List<Sanpham> LaySanPham() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sanpham> list = null;

        try {
            String hql = "FROM Sanpham s WHERE s.tinhTrang=:tt ORDER BY maSanPham DESC";
            Query query = session.createQuery(hql);
            query.setInteger("tt", 0);
            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static List<Sanpham> LaySanPhamTheoHang(String mh) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Sanpham> list = null;

        try {
            String hql = "FROM Sanpham s WHERE s.tinhTrang=0 and s.hang=:mh";
            Query query = session.createQuery(hql);
            query.setString("mh", mh);
            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static Sanpham LaySanPhamTheoMa(String msp) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Sanpham sp = (Sanpham) session.get(Sanpham.class, msp);

        session.close();

        return sp;
    }
}
