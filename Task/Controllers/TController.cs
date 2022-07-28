using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Task.Models;
using Task.Service;

namespace Task.Controllers
{
    public class TController : Controller
    {
        // GET: T
        CompanyService s1 = new CompanyService();
        taskEntities e1 = new taskEntities();

        void fillstate()
        {
            var states = from s in e1.states
                         select new SelectListItem { Value = s.state_id.ToString(), Text = s.state_name };
            ViewBag.state = states.ToList();

        }
        public JsonResult Getcitybystateid(int id)
        {
            e1.Configuration.ProxyCreationEnabled = false;
            var cities = e1.cities.Where(c => c.state_id == id).ToList();
            return Json(cities, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Create()
        {
            fillstate();
            return View();
        }
        [HttpPost]
        public ActionResult Create(Employee obj)
        {
            s1.RegisterEmployee(obj);
            return RedirectToAction("Index");
        }
        public ActionResult Index()
        {
            return View(s1.GetEmployees());
        }
       
        public ActionResult Edit(int id)
        {
            fillstate();
            return View(s1.GetEmployeesbyid(id));
        }
        [HttpPost]
        public ActionResult Edit(Employee obj)
        {
            s1.UpdateEmployee(obj);
            return RedirectToAction("Index");
        }
       
        public string Delete(int id)
        {
            s1.DeleteEmployee(id);
            return  "Delete Success";
        }
    }
}