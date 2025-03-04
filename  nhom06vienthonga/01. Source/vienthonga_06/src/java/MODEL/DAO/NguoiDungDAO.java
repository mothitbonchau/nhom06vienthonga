/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Loainguoidung;
import MODEL.POJO.Nguoidung;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import javax.transaction.SystemException;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author HP
 */
public class NguoiDungDAO {

    public static Nguoidung DangNhap(String tenDangNhap, String matKhau) {
        Nguoidung ndung = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM Nguoidung WHERE tenDangNhap=:tenDangNhap AND matKhau=:matKhau";
            Query query = session.createQuery(hql);
            query.setString("tenDangNhap", tenDangNhap);
            query.setString("matKhau", matKhau);
            //List<Nguoidung> list = query.list();
            //session.get(ndung.getClass(), ndung);
            Object ob = query.uniqueResult();
            ndung = (Nguoidung) ob;
        } catch (HibernateException ex) {
            System.err.println(ex);

        } finally {
            session.close();
        }
        return ndung;
    }

    public static int DangKy(Nguoidung kh){
        int kq = -1;
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.saveOrUpdate(kh);
            transaction.commit();
            kq = 1;
        } catch (HibernateException ex) {
            transaction.rollback();
            System.err.println(ex);
        } finally {
            session.close();
        }
        return kq;
    }

    public static Loainguoidung LayDoiTuongTheoMa(String maLND) {
        Loainguoidung lnd = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            lnd = (Loainguoidung) session.get(Loainguoidung.class, maLND);
        } catch (HibernateException ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return lnd;
    }
    
   

    public static String LayMaNguoiDungCuoiCung() {
        String Ma = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "select max(maNguoiDung) from Nguoidung";
            Query query = session.createQuery(hql);
            Object ob = query.uniqueResult();
            Ma = (String) ob;
        } catch (HibernateException ex) {
            System.err.println();
        } finally {
            session.close();
        }
        return Ma;
    }

    public static List<Nguoidung> TimKiem(Nguoidung nd) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Nguoidung> list = null;

        try {
            String hql = "FROM Nguoidung WHERE 1=1";
            if (!nd.getTenDangNhap().equals("")) {
                hql += " and tenDangNhap = '" + nd.getTenDangNhap() + "'";
            }

            Query query = session.createQuery(hql);

            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }
    
    public static Nguoidung LayThongTinNguoiDung(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        Nguoidung nd = new Nguoidung();
        String hql = "FROM Nguoidung";
        Query query = session.createQuery(hql);
        nd = (Nguoidung)query.list().get(0);
        session.close();
        return nd;
    }
    
    public static List<Nguoidung> LayListNguoiDung(){
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Nguoidung> listnd = null;

        try {
            String hql = "FROM Nguoidung Where tinhTrang = 0";
            Query query = session.createQuery(hql);
            listnd = query.list();
        } catch (Exception ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return listnd;
    }

    public static Nguoidung LayNguoiDungTheoTenDangNhap(String tdn) {
        Nguoidung ndung = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            String hql = "FROM Nguoidung WHERE tenDangNhap=:tenDangNhap";
            Query query = session.createQuery(hql);
            query.setString("tenDangNhap", tdn);
            //List<Nguoidung> list = query.list();
            //session.get(ndung.getClass(), ndung);
            Object ob = query.uniqueResult();
            ndung = (Nguoidung) ob;

        } catch (HibernateException ex) {
            System.err.println(ex);

        } finally {
            session.close();
        }
        return ndung;
    }

    public static Nguoidung LayNguoiDungTheoMa(String maND) {
        Nguoidung nd = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            nd = (Nguoidung) session.get(Nguoidung.class, maND);
        } catch (HibernateException ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return nd;
    }

    public static int XoaNguoiDungTheoMa(String maND){
        Session session = HibernateUtil.getSessionFactory().openSession();
        int i = 0;
        try{
            String hql = "Update Nguoidung Set tinhTrang=1 Where maNguoiDung = '" + maND + "'" ;
            Query query = session.createQuery(hql);          
            i = query.executeUpdate();
            int k =2;
        }
        catch(HibernateException ex){
            System.err.println(ex);
        }
        finally{
            session.close();
        }
        return i;
    }
    public static int CapNhatNguoiDung(Nguoidung nd){
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.saveOrUpdate(nd);
            transaction.commit();
            kq = 1;
        } catch (Exception e) {
            System.err.println(e);
        }
        return kq;
    }
    
}
