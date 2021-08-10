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
    public partial class mdlDanhmuc : DevExpress.XtraEditors.XtraForm
    {
        database db = new database();
        public mdlDanhmuc()
        {
            InitializeComponent();
        }

        public string searchString { get; private set; }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            frmDanhMuc dm = new frmDanhMuc();
            dm.ShowDialog();
            loaddatadanhmuc();
        }
        private void loaddatadanhmuc()
        {
            //loaddatadanhmuc();
            var model = from a in db.DanhMucs
                        join b in db.DonVis on a.DonViID equals b.DonViID
                        select new danhmucview()
                        {
                            DanhMucID = a.DanhMucID,
                            TenDanhMuc = a.TenDanhMuc,
                            TenDonVi = b.TenDonVi,

                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.TenDanhMuc.Contains(searchString) || x.TenDonVi.Contains(searchString));
            }
            gridControl.DataSource = model.ToList();//OrderBy(x => x.DanhMucID);

        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            int row_index = gridView1.FocusedRowHandle;
            string col_field_name = "DanhMucID";
            object value = gridView1.GetRowCellValue(row_index, col_field_name);
            if (value != null)
            {
                frmDanhMuc dm = new frmDanhMuc();

                dm.ID = (int)value;
                dm.ShowDialog();
            }
            else
            {
                XtraMessageBox.Show("Bạn chưa chọn đối tượng để chỉnh sửa ", "cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            loaddatadanhmuc();
        }

        private void barButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            if (XtraMessageBox.Show("Bạn muốn xóa dòng dữ liệu đang chọn không?", "Cảnh Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                int row_index = gridView1.FocusedRowHandle;
                string col_field_name = "DanhMucID";
                object value = gridView1.GetRowCellValue(row_index, col_field_name);
                if (value != null)
                {
                    var danhmuc = db.DanhMucs.Where(p => p.DanhMucID == (int)value).SingleOrDefault();
                    if (danhmuc != null)
                    {
                        db.DanhMucs.Remove(danhmuc);
                        db.SaveChanges();
                        XtraMessageBox.Show("Đã xóa thành công.", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        loaddatadanhmuc();
                    }
                }
                else
                {
                    XtraMessageBox.Show("Bạn chưa chọn đối tượng để xóa ", "Cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void barButtonItem4_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            SaveFileDialog saveFileDialogExcel = new SaveFileDialog();
            saveFileDialogExcel.Filter = "Excel files (*.xlsx)|*.xlsx";
            if (saveFileDialogExcel.ShowDialog() == DialogResult.OK)
            {
                string exportFilePath = saveFileDialogExcel.FileName;
                loaddatadanhmuc();
                gridControl.ExportToXlsx(exportFilePath);
            }
        }

        private void mdlDanhmuc_Load(object sender, EventArgs e)
        {
            loaddatadanhmuc();
        }
    }
}