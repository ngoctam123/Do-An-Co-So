using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using DoAnCoSo.Table;
using System.Text.RegularExpressions;
using DoAnCoSo.ViewTable;

namespace DoAnCoSo.Modules
{
    public partial class thongkeuser : DevExpress.XtraEditors.XtraForm
    {
        database db = new database();
       

        public string searchString { get; private set; }
        public string searchYeuCau { get; private set; }
        public string searchTinhTrang { get; private set; }
        public string searchName { get; private set; }
        public string searchTenDanhMuc { get; private set; }
        public string searchTenDonVi { get; private set; }
        public string searchTenLop { get; private set; }
        public string searchEmail { get; private set; }
        public string searchTenVaiTro { get; private set; }

        public thongkeuser()
        {
            InitializeComponent();
        }

        private void thongkeuser_Load(object sender, EventArgs e)
        {

        }
        void xulydem()
        {
            //var dao = new dem();
            //var model = dao.ListThongKe(searchYeuCau, searchTinhTrang, searchName, searchTenDanhMuc,
            //    searchTenDonVi, searchTenLop, searchEmail, searchTenVaiTro, page, pageSize);
            //var dao1 = new DonViDao();
            //ViewBag.listDonVi = new SelectList(dao1.ListAll(), "TenDonVi", "TenDonVi");
            //ViewBag.listTinhTrang = new SelectList(dao.ListAll(), "TinhTrang", "TinhTrang");
            //var lop = new LopDao();
            //ViewBag.listLop = new SelectList(lop.ListAll(), "TenLop", "TenLop");
            //var vaitro = new VaiTroDao();
            //ViewBag.listVaiTro = new SelectList(vaitro.ListAll(), "TenVaiTro", "TenVaiTro");
            //ViewBag.searchYeuCau = searchYeuCau;
            //ViewBag.searchTinhTrang = searchTinhTrang;
            //ViewBag.searchName = searchName;
            //ViewBag.searchTenDanhMuc = searchTenDanhMuc;
            //ViewBag.searchTenDonVi = searchTenDonVi;
            //ViewBag.searchTenLop = searchTenLop;
            //ViewBag.searchEmail = searchEmail;
            //ViewBag.searchTenVaiTro = searchTenVaiTro;
        }
        public void dem()
        {
            //var model = from a in db.HocVus
            //        join b in db.DonVis on a.DonViID equals b.DonViID
            //        join c in db.Users on a.UserID equals c.UserID
            //        join d in db.DanhMucs on a.DanhMucID equals d.DanhMucID
            //        join e in db.Lops on c.LopID equals e.LopID
            //        join g in db.Roles on c.RolesID equals g.RolesID
            //        select new CustomViewThongKe()
            //        {
            //            HocVuID = a.HocVuID,
            //            NgayTao = a.NgayTao,
            //            YeuCauThem = a.YeuCauThem,
            //            TinhTrang = a.TinhTrang,
            //            UserName = c.UserName,
            //            ParentID = a.ParentID,
            //            NgayHen = a.NgayHen,
            //            TenDanhMuc = d.TenDanhMuc,
            //            TenDonVi = b.TenDonVi,
            //            TenLop = e.TenLop,
            //            Email = c.Email,
            //            TenVaiTro = g.TenRole
            //        };
            //if (!string.IsNullOrEmpty(searchYeuCau))
            //{
            //    model = model.Where(x => x.YeuCauThem.Contains(searchYeuCau));
            //}
            //if (!string.IsNullOrEmpty(searchTinhTrang))
            //{
            //    model = model.Where(x => x.TinhTrang.ToString().Contains(searchTinhTrang));
            //}
            //if (!string.IsNullOrEmpty(searchName))
            //{
            //    model = model.Where(x => x.UserName.Contains(searchName));
            //}
            //if (!string.IsNullOrEmpty(searchTenDanhMuc))
            //{
            //    model = model.Where(x => x.TenDanhMuc.Contains(searchTenDanhMuc));
            //}
            //if (!string.IsNullOrEmpty(searchTenDonVi))
            //{
            //    model = model.Where(x => x.TenDonVi.Contains(searchTenDonVi));
            //}
            //if (!string.IsNullOrEmpty(searchTenLop))
            //{
            //    model = model.Where(x => x.TenLop.Contains(searchTenLop));
            //}
            //if (!string.IsNullOrEmpty(searchEmail))
            //{
            //    model = model.Where(x => x.Email.Contains(searchEmail));
            //}
            //if (!string.IsNullOrEmpty(searchTenVaiTro))
            //{
            //    model = model.Where(x => x.TenVaiTro.Contains(searchTenVaiTro));
            //}
            //gridControl1.DataSource = model.OrderBy(x => x.HocVuID).ToList();
        }
        //private string ConvertToUnSign(string input)
        //{
        //    input = input.Trim();
        //    for (int i = 0x20; i < 0x30; i++)
        //    {
        //        input = input.Replace(((char)i).ToString(), " ");
        //    }
        //    Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");
        //    string str = input.Normalize(NormalizationForm.FormD);
        //    string str2 = regex.Replace(str, string.Empty).Replace('đ', 'd').Replace('Đ', 'D');
        //    while (str2.IndexOf("?") >= 0)
        //    {
        //        str2 = str2.Remove(str2.IndexOf("?"), 1);
        //    }
        //    return str2;
        //}
        private void materialFlatButton1_Click(object sender, EventArgs e)
        {
            //dem();
        }

        private void materialFlatButton1_Click_1(object sender, EventArgs e)
        {
            dem();
        }
        //public void _loadProducts()
        //{
        //    var a = (from p in db.Users
        //             select p).ToList();

        //    if (txtname.Text.Length <= 0)
        //    {

        //    }
        //    else
        //    {
        //        //var a = (from p in db.Products
        //        // select p).ToList();
        //        switch (ddlConditionSearch.SelectedValue)
        //        {
        //            case “”:
        //                break;
        //            case “ItemMaster”:
        //                a = a.Where(p => p.ItemMasterNo.ToLower().Contains(txtSearch.Text.Trim().ToLower())).ToList();
        //                break;
        //            case “NameVN”:
        //                a = a.Where(p => p.NameVN.ToLower().Contains(txtSearch.Text.Trim().ToLower())).ToList();
        //                break;
        //            case “NameENG”:
        //                a = a.Where(p => p.NameEN.ToLower().Contains(txtSearch.Text.Trim().ToLower())).ToList();
        //                break;
        //            default:
        //                break;
        //        }

        //    }
        //    gridControl1.DataSource = a;
        //    //gridView1.DataBind();
        //    lblKetQuaTimKiem.Text = a.Count().ToString();

        //}
    }
}