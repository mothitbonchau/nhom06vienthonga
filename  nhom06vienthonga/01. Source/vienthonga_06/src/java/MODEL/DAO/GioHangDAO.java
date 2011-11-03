/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL.DAO;

import MODEL.POJO.Giohang;
import MODEL.UTIL.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author LAPTOP
 */
public class GioHangDAO {

    public static List<Giohang> LayGioHang() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        List<Giohang> list = null;

        try {
            String hql = "FROM Giohang WHERE tinhTrang=:tt";
            Query query = session.createQuery(hql);
            query.setInteger("tt", 0);
            list = query.list();
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return list;
    }

    public static Giohang LayGioHangTheoMa(String mgh) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Giohang sp = (Giohang) session.get(Giohang.class, mgh);

        session.close();

        return sp;
    }

    public static Giohang LayGioHangCuoiCung() {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Giohang gh = null;

        String hql = "select max(gh.maGioHang)";
        hql += "from Giohang gh ";
        hql += "where length(substring(gh.maGioHang,4)) = (select max(length(substring(gh.maGioHang,4))) from Giohang gh)";

        try {
            Query query = session.createQuery(hql);
            String mgh_cuoi = (String) query.uniqueResult();
            gh = LayGioHangTheoMa(mgh_cuoi);
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return gh;
    }

    public static int Them(Giohang gh) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int kq = 0;
        Transaction transaction = null;
        try {
            transaction = session.beginTransaction();
            session.save(gh);
            transaction.commit();
            kq = 1;
        } catch (Exception ex) {
            transaction.rollback();
        } finally {
            session.close();
        }
        return kq;
    }
    
    public static List<Giohang> LayListGioHangTheoMaNguoiDung(String MaNguoiDung){
        List<Giohang> list = null;
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try{
            String hql = "From Giohang Where tinhTrang=0 and maNguoiDung= '" + MaNguoiDung + "'";
            Query query = session.createQuery(hql);
            //query.setString("MaNguoiDung", MaNguoiDung);
            list = query.list();                    
        }
        catch(Exception ex){            
        }
        finally{
            session.close();
        }        
        
        return list;
    }
    
    public static int XoaChiTietGioHang(String maGioHang)
    {
        int kq = 0;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try{
            transaction = session.beginTransaction();
            
            String hql = "Update Giohang Set tinhTrang=1 Where maGioHang = '" + maGioHang + "'" ;
            Query query = session.createQuery(hql);
            query.executeUpdate();
            
            transaction.commit();
            kq=1;
        }
        catch(Exception ex){
            transaction.rollback();
        }
        finally{
            session.close();
        }
        
        return kq;
    }
    
    public static float TongTienGioHang(String maNguoiDung){
        float S = 0;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try{
            transaction = session.beginTransaction();
            
            List<Giohang> list = LayListGioHangTheoMaNguoiDung(maNguoiDung);
            for(int i=0;i<list.size();i++){
                S += list.get(i).getThanhTien();
            }
            
            transaction.commit();
        }
        catch(Exception ex){
            transaction.rollback();
        }
        finally{
            session.close();
        }
        
        return S;
    }
    
    public static Giohang LayGioHangVoiSanPhamBiTrung(String maNguoiDung, String maSanPham) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Giohang gh = null;       
        String hql = "Select maGioHang From Giohang Where tinhTrang=0 and maNguoiDung='"+ maNguoiDung +"' and maSanPham='"+ maSanPham +"' ";
       
        try {            
            Query query = session.createQuery(hql);            
            String mgh =  (String) query.uniqueResult();
            gh = LayGioHangTheoMa(mgh);
        } catch (Exception ex) {
        } finally {
            session.close();
        }

        return gh;
    }
    
    public static int CapNhatSoLuongChoSanPhamTrung(String maGioHang,int soLuong)
    {
        int kq = 0;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try{
            transaction = session.beginTransaction();
            
            String hql = "Update Giohang Set soLuong="+soLuong+" Where maGioHang = '" + maGioHang + "' " ;
            Query query = session.createQuery(hql);
            query.executeUpdate();
            
            transaction.commit();
            kq=1;
        }
        catch(Exception ex){
            transaction.rollback();
        }
        finally{
            session.close();
        }
        
        return kq;
    }
    
    public static int CapNhatThanhTienChoSanPhamTrung(String maGioHang,int soLuong)
    {
        int kq = 0;
        Transaction transaction = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        
        try{
            transaction = session.beginTransaction();
            
           String hql = "Update Giohang Set thanhTien=donGia * "+soLuong+" Where maGioHang = '" + maGioHang + "' " ;
            Query query = session.createQuery(hql);
            query.executeUpdate();
            
            transaction.commit();
            kq=1;
        }
        catch(Exception ex){
            transaction.rollback();
        }
        finally{
            session.close();
        }
        
        return kq;
    }
}
