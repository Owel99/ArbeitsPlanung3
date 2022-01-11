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
    public class ArbeitenController : BaseController
    {

        // GET: Arbeiten
        public ActionResult Index()
        {
            return View(db.ArbeitenSet.ToList());
        }

        // GET: Arbeiten/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arbeiten arbeiten = db.ArbeitenSet.Find(id);
            if (arbeiten == null)
            {
                return HttpNotFound();
            }
            return View(arbeiten);
        }

        // GET: Arbeiten/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Arbeiten/Create
        // Aktivieren Sie zum Schutz vor Angriffen durch Overposting die jeweiligen Eigenschaften, mit denen eine Bindung erfolgen soll. Weitere Informationen 
        // finden Sie unter https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ArbeitId,Name")] Arbeiten arbeiten)
        {
            if (ModelState.IsValid)
            {
                db.ArbeitenSet.Add(arbeiten);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(arbeiten);
        }

        // GET: Arbeiten/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arbeiten arbeiten = db.ArbeitenSet.Find(id);
            if (arbeiten == null)
            {
                return HttpNotFound();
            }
            return View(arbeiten);
        }

        // POST: Arbeiten/Edit/5
        // Aktivieren Sie zum Schutz vor Angriffen durch Overposting die jeweiligen Eigenschaften, mit denen eine Bindung erfolgen soll. Weitere Informationen 
        // finden Sie unter https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ArbeitId,Name")] Arbeiten arbeiten)
        {
            if (ModelState.IsValid)
            {
                db.Entry(arbeiten).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(arbeiten);
        }

        // GET: Arbeiten/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Arbeiten arbeiten = db.ArbeitenSet.Find(id);
            if (arbeiten == null)
            {
                return HttpNotFound();
            }
            return View(arbeiten);
        }

        // POST: Arbeiten/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Arbeiten arbeiten = db.ArbeitenSet.Find(id);
            db.ArbeitenSet.Remove(arbeiten);
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
