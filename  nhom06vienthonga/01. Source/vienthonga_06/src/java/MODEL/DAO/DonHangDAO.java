/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Donhang;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


public class DonHangDAO {
    public static int DatHang(Donhang dh){
        int kq = 0;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try{
            transaction = session.beginTransaction();
            
            session.save(dh);
            
            transaction.commit();
            kq = 1;
        }
        catch(Exception ex){
            transaction.rollback();
        }
        finally{
            session.close();
        }
        
        return kq;
    }
    
     public static Donhang LayDonHangTheoMa(String mdh) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Donhang sp = (Donhang) session.get(Donhang.class, mdh);

        session.close();

        return sp;
    }
    
    public static Donhang LayDonHangCuoiCung() {
        Session session = HibernateUtil.getSessionFactory().openSession();

       Donhang dh = null;

        String hql = "select max(dh.maDonHang)";
        hql += "from Donhang dh ";
        hql += "where length(substring(dh.maDonHang,4)) = (select max(length(substring(dh.maDonHang,4))) from Donhang dh)";

        try {
            Query query = session.createQuery(hql);
            String mgh_cuoi = (String) query.uniqueResult();
            dh = LayDonHangTheoMa(mgh_cuoi);
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return dh;
    }
    
    public static List<Donhang> LayListDonHang(String maNguoiDung){
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Donhang> listdh = null;
        try {
            String hql = "FROM Donhang WHERE tinhTrang=0 AND maNguoiDung='"+maNguoiDung+"'";
            Query query = session.createQuery(hql);
            listdh = query.list();
        } catch (Exception e) {
            System.err.println(e);
        }
        finally{
            session.close();
        }
        return listdh;
    }
    
    public static List<Donhang> LayDonHangTheoMaNguoiDung(String maNguoiDung, int batdau, int sp1trang){
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Donhang> listdh = null;
        try {
            String hql = "FROM Donhang WHERE tinhTrang=0 AND maNguoiDung='"+maNguoiDung+"'";
            Query query = session.createQuery(hql);
            if(batdau >= 0 & sp1trang >0){
                query.setFirstResult(batdau);
                query.setMaxResults(sp1trang);
            }
            listdh = query.list();
        } catch (Exception e) {
            System.err.println(e);
        }
        finally{
            session.close();
        }
        return listdh;
    }
    
    public static List<Donhang>LayHetDonHang(int batdau, int sp1trang){
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Donhang> list = null;
        try {
            String hql = "FROM Donhang";
            Query query = session.createQuery(hql);
            if(batdau >= 0 & sp1trang >0){
                query.setFirstResult(batdau);
                query.setMaxResults(sp1trang);
            }
            list = query.list();
        } catch (Exception e) {
        }
        finally{
            session.close();
        }
        return list;
    }
}
