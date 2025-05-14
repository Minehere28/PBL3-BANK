using Microsoft.AspNetCore.Mvc;

public class AdminController : Controller
{
    public ActionResult DanhSachTaiKhoan() => View();
    public ActionResult MoKhoaTaiKhoan() => View();
    public ActionResult LichSuGiaoDich() => View();
    public ActionResult ThongTinAdmin() => View();
}
