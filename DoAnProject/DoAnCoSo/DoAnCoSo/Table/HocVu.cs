﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace DoAnCoSo.Table
{
    public partial class HocVu
    {
        public int HocVuID { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayTao { get; set; }

        [Column(TypeName = "ntext")]
        public string NoiDung { get; set; }
        public string YeuCauThem { get; set; }


        public bool TinhTrang { get; set; }
        public int ParentID { get; set; }

        [Column(TypeName = "date")]        
        public DateTime NgayHen { get; set; }
        public int? DanhMucID { get; set; }
        public int? UserID { get; set; }
        public string HocKy { get; set; }
        public int? DonViID { get; set; }

        public virtual DanhMuc DanhMuc { get; set; }
        public virtual DonVi DonVi { get; set; }
        public virtual User User { get; set; }
    }
}
