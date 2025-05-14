using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.EntityFrameworkCore;
using PBL3.Data;
using PBL3.Models;

namespace PBL3.Controllers
{
    public class UserController : Controller
    {
        private readonly BMContext _context; // Sửa ApplicationDbContext thành BMContext

        public UserController(BMContext context) // Sửa ApplicationDbContext thành BMContext
        {
            _context = context;
        }

        public IActionResult User()
        {
            var phoneNumber = HttpContext.Session.GetString("UserSdt");

            if (string.IsNullOrEmpty(phoneNumber))
            {
                return RedirectToAction("Login", "Home");
            }

            var account = _context.BankAccounts
                .Where(b => b.Sdt == phoneNumber).FirstOrDefault(); // Corrected to use Sdt from BankAccoun


            if (account == null)
            {
                Console.WriteLine($"No account found for phone number: {phoneNumber}");
                ViewBag.Balance = 0;
                return View();
            }

            ViewBag.Balance = account.Balance;

            return View();
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult UserInfo()
        {
            var phoneNumber = HttpContext.Session.GetString("UserSdt");

            if (string.IsNullOrEmpty(phoneNumber))
            {
                return RedirectToAction("Login", "Home");
            }

            var user = _context.Users.FirstOrDefault(u => u.Sdt == phoneNumber);

            if (user == null)
            {
                return RedirectToAction("User", "User");
            }

            var model = new UserInfoViewModel
            {
                FullName = user.Hoten, // Changed from user.FullName to user.Hoten
                Username = user.Sdt,  // Changed from user.Username to user.Sdt
                DateOfBirth = user.NS, // Changed from user.DateOfBirth to user.NS
                AccountType = "Standard" // Assuming AccountType exists in User
            };

            return View(model);
        }
    }
}