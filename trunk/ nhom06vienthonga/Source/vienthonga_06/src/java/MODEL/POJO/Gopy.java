package MODEL.POJO;
// Generated Oct 6, 2011 5:23:49 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Gopy generated by hbm2java
 */
public class Gopy  implements java.io.Serializable {


     private String maGopY;
     private String hoTen;
     private String diaChi;
     private String email;
     private String tieuDe;
     private String noiDung;
     private Date ngayGopY;
     private Integer tinhTrang;

    public Gopy() {
    }

	
    public Gopy(String maGopY) {
        this.maGopY = maGopY;
    }
    public Gopy(String maGopY, String hoTen, String diaChi, String email, String tieuDe, String noiDung, Date ngayGopY, Integer tinhTrang) {
       this.maGopY = maGopY;
       this.hoTen = hoTen;
       this.diaChi = diaChi;
       this.email = email;
       this.tieuDe = tieuDe;
       this.noiDung = noiDung;
       this.ngayGopY = ngayGopY;
       this.tinhTrang = tinhTrang;
    }
   
    public String getMaGopY() {
        return this.maGopY;
    }
    
    public void setMaGopY(String maGopY) {
        this.maGopY = maGopY;
    }
    public String getHoTen() {
        return this.hoTen;
    }
    
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    public String getDiaChi() {
        return this.diaChi;
    }
    
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getTieuDe() {
        return this.tieuDe;
    }
    
    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }
    public String getNoiDung() {
        return this.noiDung;
    }
    
    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }
    public Date getNgayGopY() {
        return this.ngayGopY;
    }
    
    public void setNgayGopY(Date ngayGopY) {
        this.ngayGopY = ngayGopY;
    }
    public Integer getTinhTrang() {
        return this.tinhTrang;
    }
    
    public void setTinhTrang(Integer tinhTrang) {
        this.tinhTrang = tinhTrang;
    }




}


