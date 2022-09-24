package entity;

public class ChiTietHoaDon {

	private HoaDon maHoaDon;
	private Sach maSach;
	private int soLuong;
	private double donGia;
	private double thanhTien;

	public ChiTietHoaDon(HoaDon maHoaDon, Sach maSach, int soLuong, double donGia, double thanhTien) {
		super();
		this.maHoaDon = maHoaDon;
		this.maSach = maSach;
		this.soLuong = soLuong;
		this.donGia = donGia;
		this.thanhTien = thanhTien;
	}

	public ChiTietHoaDon() {
		super();
	}

	public HoaDon getMaHoaDon() {
		return maHoaDon;
	}

	public void setMaHoaDon(HoaDon maHoaDon) {
		this.maHoaDon = maHoaDon;
	}

	public Sach getMaSach() {
		return maSach;
	}

	public void setMaSach(Sach maSach) {
		this.maSach = maSach;
	}

	public int getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(int soLuong) {
		this.soLuong = soLuong;
	}

	public double getDonGia() {
		return donGia;
	}

	public void setDonGia(double donGia) {
		this.donGia = donGia;
	}

	public double getThanhTien() {
		return thanhTien;
	}

	public void setThanhTien(double thanhTien) {
		this.thanhTien = thanhTien;
	}

	@Override
	public String toString() {
		return "ChiTietHoaDon [maHoaDon=" + maHoaDon + ", maSach=" + maSach + ", soLuong=" + soLuong + ", donGia="
				+ donGia + ", thanhTien=" + thanhTien + "]";
	}

}
