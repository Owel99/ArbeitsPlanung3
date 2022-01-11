using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ArbeitsPlanung3_Lib;
using ArbeitsPlanungWeb.Controllers;

namespace ArbeitsPlanung3_Web.Controllers
{
    public class FlugzeugeController : BaseController
    {

        // GET: Flugzeuge
        public ActionResult Index()
        {
            return View(db.FlugzeugeSet.ToList());
        }

        // GET: Flugzeuge/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Flugzeuge flugzeuge = db.FlugzeugeSet.Find(id);
            if (flugzeuge == null)
            {
                return HttpNotFound();
            }
            return View(flugzeuge);
        }

        // GET: Flugzeuge/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Flugzeuge/Create
        // Aktivieren Sie zum Schutz vor Angriffen durch Overposting die jeweiligen Eigenschaften, mit denen eine Bindung erfolgen soll. Weitere Informationen 
        // finden Sie unter https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "FlugzeugId,Kennzeichen,Typ")] Flugzeuge flugzeuge)
        {
            if (ModelState.IsValid)
            {
                db.FlugzeugeSet.Add(flugzeuge);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(flugzeuge);
        }

        // GET: Flugzeuge/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Flugzeuge flugzeuge = db.FlugzeugeSet.Find(id);
            if (flugzeuge == null)
            {
                return HttpNotFound();
            }
            return View(flugzeuge);
        }

        // POST: Flugzeuge/Edit/5
        // Aktivieren Sie zum Schutz vor Angriffen durch Overposting die jeweiligen Eigenschaften, mit denen eine Bindung erfolgen soll. Weitere Informationen 
        // finden Sie unter https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "FlugzeugId,Kennzeichen,Typ")] Flugzeuge flugzeuge)
        {
            if (ModelState.IsValid)
            {
                db.Entry(flugzeuge).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(flugzeuge);
        }

        // GET: Flugzeuge/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Flugzeuge flugzeuge = db.FlugzeugeSet.Find(id);
            if (flugzeuge == null)
            {
                return HttpNotFound();
            }
            return View(flugzeuge);
        }

        // POST: Flugzeuge/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Flugzeuge flugzeuge = db.FlugzeugeSet.Find(id);
            db.FlugzeugeSet.Remove(flugzeuge);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
