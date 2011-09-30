package MODEL.POJO;
// Generated Sep 30, 2011 3:17:38 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Giamgia generated by hbm2java
 */
public class Giamgia  implements java.io.Serializable {


     private String maGiamGia;
     private Sanpham sanpham;
     private Integer giaGiam;
     private Date ngayBatDau;
     private Date ngayKetThuc;
     private Integer tinhTrang;

    public Giamgia() {
    }

	
    public Giamgia(String maGiamGia) {
        this.maGiamGia = maGiamGia;
    }
    public Giamgia(String maGiamGia, Sanpham sanpham, Integer giaGiam, Date ngayBatDau, Date ngayKetThuc, Integer tinhTrang) {
       this.maGiamGia = maGiamGia;
       this.sanpham = sanpham;
       this.giaGiam = giaGiam;
       this.ngayBatDau = ngayBatDau;
       this.ngayKetThuc = ngayKetThuc;
       this.tinhTrang = tinhTrang;
    }
   
    public String getMaGiamGia() {
        return this.maGiamGia;
    }
    
    public void setMaGiamGia(String maGiamGia) {
        this.maGiamGia = maGiamGia;
    }
    public Sanpham getSanpham() {
        return this.sanpham;
    }
    
    public void setSanpham(Sanpham sanpham) {
        this.sanpham = sanpham;
    }
    public Integer getGiaGiam() {
        return this.giaGiam;
    }
    
    public void setGiaGiam(Integer giaGiam) {
        this.giaGiam = giaGiam;
    }
    public Date getNgayBatDau() {
        return this.ngayBatDau;
    }
    
    public void setNgayBatDau(Date ngayBatDau) {
        this.ngayBatDau = ngayBatDau;
    }
    public Date getNgayKetThuc() {
        return this.ngayKetThuc;
    }
    
    public void setNgayKetThuc(Date ngayKetThuc) {
        this.ngayKetThuc = ngayKetThuc;
    }
    public Integer getTinhTrang() {
        return this.tinhTrang;
    }
    
    public void setTinhTrang(Integer tinhTrang) {
        this.tinhTrang = tinhTrang;
    }




}


