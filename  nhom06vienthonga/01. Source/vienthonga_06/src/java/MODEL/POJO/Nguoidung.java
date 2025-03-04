package MODEL.POJO;
// Generated Oct 13, 2011 8:14:39 AM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Nguoidung generated by hbm2java
 */
public class Nguoidung  implements java.io.Serializable {


     private String maNguoiDung;
     private Loainguoidung loainguoidung;
     private String tenDangNhap;
     private String matKhau;
     private String tenNguoiDung;
     private String email;
     private String cmnd;
     private String dienThoai;
     private String diaChi;
     private Date ngayDangKy;
     private Integer tinhTrang;
     private Set donhangs = new HashSet(0);
     private Set giohangs = new HashSet(0);

    public Nguoidung() {
    }

	
    public Nguoidung(String maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }
    public Nguoidung(String maNguoiDung, Loainguoidung loainguoidung, String tenDangNhap, String matKhau, String tenNguoiDung, String email, String cmnd, String dienThoai, String diaChi, Date ngayDangKy, Integer tinhTrang, Set donhangs, Set giohangs) {
       this.maNguoiDung = maNguoiDung;
       this.loainguoidung = loainguoidung;
       this.tenDangNhap = tenDangNhap;
       this.matKhau = matKhau;
       this.tenNguoiDung = tenNguoiDung;
       this.email = email;
       this.cmnd = cmnd;
       this.dienThoai = dienThoai;
       this.diaChi = diaChi;
       this.ngayDangKy = ngayDangKy;
       this.tinhTrang = tinhTrang;
       this.donhangs = donhangs;
       this.giohangs = giohangs;
    }
   
    public String getMaNguoiDung() {
        return this.maNguoiDung;
    }
    
    public void setMaNguoiDung(String maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }
    public Loainguoidung getLoainguoidung() {
        return this.loainguoidung;
    }
    
    public void setLoainguoidung(Loainguoidung loainguoidung) {
        this.loainguoidung = loainguoidung;
    }
    public String getTenDangNhap() {
        return this.tenDangNhap;
    }
    
    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }
    public String getMatKhau() {
        return this.matKhau;
    }
    
    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }
    public String getTenNguoiDung() {
        return this.tenNguoiDung;
    }
    
    public void setTenNguoiDung(String tenNguoiDung) {
        this.tenNguoiDung = tenNguoiDung;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getCmnd() {
        return this.cmnd;
    }
    
    public void setCmnd(String cmnd) {
        this.cmnd = cmnd;
    }
    public String getDienThoai() {
        return this.dienThoai;
    }
    
    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }
    public String getDiaChi() {
        return this.diaChi;
    }
    
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    public Date getNgayDangKy() {
        return this.ngayDangKy;
    }
    
    public void setNgayDangKy(Date ngayDangKy) {
        this.ngayDangKy = ngayDangKy;
    }
    public Integer getTinhTrang() {
        return this.tinhTrang;
    }
    
    public void setTinhTrang(Integer tinhTrang) {
        this.tinhTrang = tinhTrang;
    }
    public Set getDonhangs() {
        return this.donhangs;
    }
    
    public void setDonhangs(Set donhangs) {
        this.donhangs = donhangs;
    }
    public Set getGiohangs() {
        return this.giohangs;
    }
    
    public void setGiohangs(Set giohangs) {
        this.giohangs = giohangs;
    }
}


