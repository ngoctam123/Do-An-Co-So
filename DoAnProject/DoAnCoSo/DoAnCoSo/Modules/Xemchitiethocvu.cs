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
using DoAnCoSo.ViewTable;

namespace DoAnCoSo.Modules
{
    public partial class Xemchitiethocvu : DevExpress.XtraEditors.XtraForm
    {
        database db = new database();
        public Xemchitiethocvu()
        {
            InitializeComponent();
        }
        public int ID = -1;

        public string searchString { get; private set; }

        private void laydata()
        {
            if (ID > 0)
            {
                
                var hocvu = db.HocVus.Where(p => p.HocVuID == ID).SingleOrDefault();
                if(hocvu != null)
                {

                }

                
            }
        }
        void xemchitiethocvu()
        {
            var model = from a in db.HocVus
                        where (a.ParentID == ID)
                        join b in db.DonVis on a.DonViID equals b.DonViID
                        join c in db.Users on a.UserID equals c.UserID
                        join d in db.DanhMucs on a.DanhMucID equals d.DanhMucID
                        select new HocVuview()
                        {
                            HocVuID = a.HocVuID,
                            NgayTao = a.NgayTao,
                            NoiDung = a.NoiDung,
                            YeuCauThem = a.YeuCauThem,
                            TinhTrang = a.TinhTrang,
                            ParentID = a.ParentID,
                            NgayHen = a.NgayHen,

                            UserName = c.UserName,
                            TenDanhMuc = d.TenDanhMuc,

                            TenDonVi = b.TenDonVi,

                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.TenDonVi.Contains(searchString));
            }
            gridControl1.DataSource = model.ToList();
        }

        private void Xemchitiethocvu_Load(object sender, EventArgs e)
        {
            xemchitiethocvu();
            laydata();
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            int row_index = gridView1.FocusedRowHandle;
            string col_field_name = "HocVuID";
            object value = gridView1.GetRowCellValue(row_index, col_field_name);
            if (value != null)
            {
                frmHocVu hocvu1 = new frmHocVu();

                hocvu1.ID1 = (int)value;
                hocvu1.ShowDialog();
            }
            else
            {
                XtraMessageBox.Show("Bạn chưa chọn đối tượng để chỉnh sửa ", "cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            xemchitiethocvu();
        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            int row_index = gridView1.FocusedRowHandle;
            string col_field_name = "HocVuID";
            object value = gridView1.GetRowCellValue(row_index, col_field_name);
            if (value != null)
            {
                frmHocVu hocvu = new frmHocVu();

                hocvu.ID = (int)value;
                hocvu.ShowDialog();
            }
            else
            {
                XtraMessageBox.Show("Bạn chưa chọn đối tượng để chỉnh sửa ", "cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            xemchitiethocvu();
        }
    }
}