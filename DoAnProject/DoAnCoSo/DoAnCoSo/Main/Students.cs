using DevExpress.XtraEditors;
using DoAnCoSo.Modules;
using DoAnCoSo.Table;
using DoAnCoSo.ViewTable;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using ComboBox = System.Windows.Forms.ComboBox;

namespace DoAnCoSo
{
    public partial class Students : DevExpress.XtraEditors.XtraForm
    {
        database db = new database();
        
        public string searchString { get; private set; }
        

        public Students()
        {
            InitializeComponent();
        }

        private void Students_Load(object sender, EventArgs e)
        {
            hocky();
            DanhSachDonVi();
            ngaytao.Enabled = false;
            lop.Enabled = false;
            tensv.Enabled = false;
            masosv.Enabled = false;
            
            tensv.Text = $"{Login.Instance.UserInfo.UserName}";
            lop.Text = $"{Login.Instance.UserInfo.Lop.TenLop}";
            masosv.Text = $"{Login.Instance.UserInfo.UserID}";
            loaddataHocVu();
        }

        private void Students_FormClosed(object sender, System.Windows.Forms.FormClosedEventArgs e)
        {
            //Application.Exit();
        }

        private void tensv_TextChanged(object sender, EventArgs e)
        {

        }
        
        private void DanhSachDonVi()
        {
            List<DonVi> lstdonvi = db.DonVis.ToList();
            comboBox2.DisplayMember = "TenDonVi";
            comboBox2.ValueMember = "DonViID";
            comboBox2.DataSource = lstdonvi;
        }
        void loaddataHocVu()
        {
            var model = from a in db.HocVus
                        join b in db.DonVis on a.DonViID equals b.DonViID
                        join c in db.Users on a.UserID equals c.UserID
                        where (c.UserID == Login.Instance.UserInfo.UserID)
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

                            HocKy = a.HocKy,
                            TenDonVi = b.TenDonVi,

                        };
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString) || x.TenDonVi.Contains(searchString) || x.TenDanhMuc.Contains(searchString));
            }
            treeList1.DataSource = model.ToList();
            treeList1.ForceInitialize();
            treeList1.ExpandAll();
            treeList1.BestFitColumns();
        }
        void dangkyhocvu(HocVu hocvu , int dem)
        {
            db.HocVus.Add(hocvu);
            hocvu.UserID = Login.Instance.UserInfo.UserID;
            hocvu.DonViID = Convert.ToInt32(comboBox2.SelectedValue.ToString());
            hocvu.DanhMucID = Convert.ToInt32(comboBox1.SelectedValue.ToString());
            hocvu.TinhTrang = false;
            hocvu.ParentID = dem;
            hocvu.HocKy = comboBox3.SelectedValue.ToString();
            hocvu.NgayTao = DateTime.Now;
            hocvu.NgayHen = DateTime.Today.AddDays(7);
            hocvu.NoiDung = noidung.Text;
            db.SaveChanges();

        }
        private void comboBox1_SelectedValueChanged(object sender, EventArgs e)
        {
            
        }
        

        private void materialFlatButton1_Click(object sender, EventArgs e)
        {
            if (XtraMessageBox.Show("Bạn muốn đăng ký không?", "Cảnh Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                HocVu hocvu = new HocVu();
                int DanhMucID = Convert.ToInt32(comboBox1.SelectedValue.ToString());
                int dem;
                var child = db.HocVus.Where(x => x.UserID + x.DanhMucID == Login.Instance.UserInfo.UserID + DanhMucID && x.UserID == Login.Instance.UserInfo.UserID);
                var getHVID = from q in db.HocVus
                              where (q.UserID + q.DanhMucID == Login.Instance.UserInfo.UserID + DanhMucID && q.UserID == Login.Instance.UserInfo.UserID)
                              select q.HocVuID;
                var moc = from q in db.HocVus
                          where (q.UserID + q.DanhMucID == Login.Instance.UserInfo.UserID + DanhMucID && q.UserID == Login.Instance.UserInfo.UserID && q.TinhTrang == true)
                          select q.HocVuID;
                if (child.Count() == 0)
                {
                    dem = 0;
                }
                else
                {
                    dem = getHVID.Min();
                }
                if (moc.Count() != 0)
                {
                    int mocMax = moc.Max();
                    var xyz = db.HocVus.Where(x => x.UserID + x.DanhMucID == Login.Instance.UserInfo.UserID + DanhMucID && x.UserID == Login.Instance.UserInfo.UserID && x.HocVuID > mocMax);
                    if (xyz.Count() > 0)
                    {
                        dem = getHVID.Where(x => x > mocMax).Min();
                    }
                    else
                    {
                        dem = 0;
                    }
                }

                dangkyhocvu(hocvu, dem);
                XtraMessageBox.Show($"Đã đăng ký. Ngày nhận giấy {DateTime.Today.AddDays(7)}");
                loaddataHocVu();                
            }
        }
        private void hocky()
        {
            List<string> listhocky = new List<string>() { "Học Kỳ 1", "Học Kỳ 2" };
            comboBox3.DataSource = listhocky;
        }
        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int DonViID;
            bool chuyen = Int32.TryParse(comboBox2.SelectedValue.ToString(), out DonViID);
            var danhmuc = from dm in db.DanhMucs where dm.DonViID.Value.Equals(DonViID) select new { dm.DanhMucID, dm.TenDanhMuc };
            var donvi = danhmuc.ToList();
            if (donvi.Count > 0)
            {
                comboBox1.DataSource = donvi;
                comboBox1.DisplayMember = "TenDanhMuc";
                comboBox1.ValueMember = "DanhmucID";
            }
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            SaveFileDialog saveFileDialogExcel = new SaveFileDialog();
            saveFileDialogExcel.Filter = "Excel files (*.xlsx)|*.xlsx";
            if (saveFileDialogExcel.ShowDialog() == DialogResult.OK)
            {
                string exportFilePath = saveFileDialogExcel.FileName;
                loaddataHocVu();
                treeList1.ExportToXlsx(exportFilePath);
            }
            //int row_index = treeList1.FocusedNode;
            //string col_field_name = "HocVuID";
            //object value = treeList1.GetRowCellValue(row_index, col_field_name);
            //if (value != null)
            //{
            //    Xemchitiethocvusinhvien hocvu1 = new Xemchitiethocvusinhvien();
            //    hocvu1.ID = (int)value;
            //    hocvu1.ShowDialog();
            //}
            //else
            //{
            //    XtraMessageBox.Show("Bạn chưa chọn đối tượng để xem chi tiết ", "cảnh báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            //}
            //loaddataHocVu();
        }

        private void treeList1_FocusedNodeChanged(object sender, DevExpress.XtraTreeList.FocusedNodeChangedEventArgs e)
        {

        }
    }
}