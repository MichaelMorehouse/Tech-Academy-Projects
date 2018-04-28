using FirstChallenge.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace FirstChallenge.Controllers
{
    public class HomeController : Controller
    {
        List<ComicBook> comics = ComicBookManager.GetComicBooks();

        // GET: Home
        public ActionResult Index()
        {
            return View(comics);
        }

        // GET: Detail
        public ActionResult Detail(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ComicBook comic = comics.Find( x => x.ComicBookId == id);
            if (comic == null)
            {
                return HttpNotFound();
            }
            return View(comic);
        }
    }
}