using Microsoft.AspNetCore.Mvc;
using MVCDemo.Data;
using MVCDemo.Models;
using System.Diagnostics;
using Domain;

namespace MVCDemo.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly MVCDemoContext _dbContext;

        public HomeController(ILogger<HomeController> logger, MVCDemoContext dbContext)
        {
            _logger = logger;
            _dbContext = dbContext;
        }

        public IActionResult Index()
        {
            List<Books> book = _dbContext.Books.ToList();
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
