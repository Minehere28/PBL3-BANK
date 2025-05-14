using Microsoft.AspNetCore.Mvc;

namespace PBL3.Controllers
{
    public class TransferController : Controller
    {
        public IActionResult Transfer()
        {
            return View("~/Views/User/Transfer.cshtml");
        }
    }
}
