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

/**
 *
 * @author LAPTOP
 */
public class TinTucDAO {

    public static List<Tintuc> LayTinTuc() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Tintuc> list = null;

        try {
            String hql = "FROM Tintuc tt WHERE tt.tinhTrang=:tt ORDER BY maTinTuc DESC";
            Query query = session.createQuery(hql);
            query.setInteger("tt", 0);
            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static List<Tintuc> LayTinTuc(int batdau, int sp1trang) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Tintuc> list = null;

        try {
            String hql = "FROM Tintuc tt WHERE tt.tinhTrang=:tt ORDER BY maTinTuc DESC";
            Query query = session.createQuery(hql);
            query.setInteger("tt", 0);
            list = query.list();
            if (batdau >= 0 && sp1trang > 0) {
                query.setFirstResult(batdau);
                query.setMaxResults(sp1trang);
            }

            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static Tintuc LayTinTucTheoMa(String mtt) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Tintuc tt = (Tintuc) session.get(Tintuc.class, mtt);

        session.close();

        return tt;
    }
}
