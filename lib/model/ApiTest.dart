class Result {
  final String timeXayRaPa;
  final String noiDung;
  final String tinhTrangPa;
  final String tenViTri;
  final String hinhnguoidung;
  final String hinhtraloi;
  final int phanAnhId;

  Result(
      {this.timeXayRaPa,
      this.noiDung,
      this.tinhTrangPa,
      this.tenViTri,
      this.hinhnguoidung,
      this.hinhtraloi,
      this.phanAnhId,});

  factory Result.fromJson(Map<String, dynamic> json) => Result(
      timeXayRaPa: json['thoi_gian_xay_ra'],
      noiDung: json['noi_dung'],
      tinhTrangPa: json['tinh_trang_pa'],
      phanAnhId: json['phan_anh_id'],

      tenViTri: json['ten_vi_tri'],
      hinhnguoidung: json['anh_nguoi_dung'],
      hinhtraloi: json['anh_nguoi_tl'],
      );
}