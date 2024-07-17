using Microsoft.AspNetCore.Mvc;
using MVCDemo.Data;
using MVCDemo.Models;
using System.Diagnostics;
using Domain;
using static System.Runtime.InteropServices.JavaScript.JSType;

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
            return View();
        }

        public IActionResult Test()
        {
            List<Books> book = _dbContext.Books.ToList();
            return View(book);
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

        [HttpGet("Home/Gets")]
        public IActionResult Gets()
        {
            List<Books> book = _dbContext.Books.ToList();
            if (!book.Any())
            {
                return NotFound();
            }

            return Ok(book);
        }

        [HttpPost("Home/Add")]
        public IActionResult Add([FromBody] Books data)
        {
            try
            {
                var result = _dbContext.Books.Add(data);
                _dbContext.SaveChanges();

                return Ok();
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
