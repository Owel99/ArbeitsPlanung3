using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ArbeitsPlanung3_Lib;

namespace ArbeitsPlanung3_Web.Models
{
    public class Zuweisung
    {
        [Key]
        [Column(Order = 0)]
        public int BenutzerId { get; set; }
        [Key]
        [Column(Order = 1)]
        public int ArbeitId { get; set; }
        public Benutzer Benutzer { get; set; }
        public Arbeiten Arbeit { get; set; }
    }
}