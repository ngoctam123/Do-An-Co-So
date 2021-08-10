using DevExpress.XtraEditors;
using DoAnCoSo.Table;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DoAnCoSo
{
    public partial class frmHocVu : DevExpress.XtraEditors.XtraForm
    {
        database db = new database();
        public frmHocVu()
        {
            InitializeComponent();
        }

        private void barButtonItem1_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            ////LuuHV();
            //XtraMessageBox.Show("Đã Lưu!");
            //this.Close();
        }

        private void barButtonItem2_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            Edithocvu();
            XtraMessageBox.Show("Đã Cập nhật!");
            this.Close();
        }

        private void textTinhtrang_CheckedChanged(object sender, EventArgs e)
        {

        }
        public int ID = -1;
        private void laydata()
        {
            if (ID > 0)
            {
                barButtonItem4.Enabled = false;
                textBox1.Enabled = false;
                comboBox3.Enabled = false;
                textBox3.Enabled = false;
                var hocvu = db.HocVus.Where(p => p.HocVuID == ID).SingleOrDefault();

                if (hocvu != null)
                {
                    dateTimePicker1.Value = hocvu.NgayTao;
                    dateTimePicker2.Value = hocvu.NgayHen;
                    textNoiDung.Text = hocvu.NoiDung;
                    checkEdit1.EditValue = hocvu.TinhTrang;
                    comboBox2.SelectedValue = hocvu.DonViID.Value;
                    comboBox1.SelectedValue = hocvu.DanhMucID.Value;
                    textBox1.Text = hocvu.YeuCauThem;
                    comboBox3.SelectedValue = hocvu.UserID.Value;
                    textBox3.Text = Convert.ToString(hocvu.UserID);
                }
            }
        }
        
        public int ID1 = -1;
        private void laydata1()
        {
            if (ID1 > 0)
            {
                barButtonItem2.Enabled = false;
                textBox3.Enabled = false;
                dateTimePicker1.Enabled = false;
                comboBox3.Enabled = false;
                textNoiDung.Enabled = false;
                checkEdit1.Enabled = false;
                comboBox2.Enabled = false;
                comboBox1.Enabled = false;
                var hocvu1 = db.HocVus.Where(x => x.HocVuID == ID1).SingleOrDefault();

                if (hocvu1 != null)
                {
                    dateTimePicker1.Value = hocvu1.NgayTao;
                    dateTimePicker2.Value = hocvu1.NgayHen;
                    textNoiDung.Text = hocvu1.NoiDung;
                    checkEdit1.EditValue = hocvu1.TinhTrang;
                    comboBox2.SelectedValue = hocvu1.DonViID.Value;
                    comboBox1.SelectedValue = hocvu1.DanhMucID.Value;
                    textBox1.Text = hocvu1.YeuCauThem;
                    comboBox3.SelectedValue = hocvu1.UserID.Value;
                    textBox3.Text = Convert.ToString(hocvu1.UserID);
                }
            }
        }
        public void laytensinhvien()
        {
            List<User> lstsv = db.Users.ToList();

            comboBox3.DisplayMember = "UserName";
            comboBox3.ValueMember = "UserID";
            comboBox3.DataSource = lstsv;
        }
        private void DanhSachDonVi()
        {
            List<DonVi> lstdonvi = db.DonVis.ToList();
            
            comboBox2.DisplayMember = "TenDonVi";
            comboBox2.ValueMember = "DonViID";
            comboBox2.DataSource = lstdonvi;
        }

        private void frmHocVu_Load(object sender, EventArgs e)
        {
            laytensinhvien();
            DanhSachDonVi();
            laydata1();
            laydata();
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
        void Edithocvu()
        {
            var hocvu = db.HocVus.Where(p => p.HocVuID == ID).SingleOrDefault();
            hocvu.NgayHen = dateTimePicker2.Value;
            hocvu.NoiDung = textNoiDung.Text;
            hocvu.TinhTrang = Convert.ToBoolean(checkEdit1.EditValue.ToString());
            hocvu.DonViID = Convert.ToInt32(comboBox2.SelectedValue.ToString());
            hocvu.DanhMucID = Convert.ToInt32(comboBox1.SelectedValue.ToString());
            db.SaveChanges();
        }
        void dangkyhocvu(HocVu hocvu, int dem)
        {

            db.HocVus.Add(hocvu);
            hocvu.UserID = Convert.ToInt32(textBox3.Text);
            hocvu.NgayTao = DateTime.Now;
            hocvu.YeuCauThem = textBox1.Text;
            hocvu.NgayHen = dateTimePicker2.Value;
            hocvu.ParentID = dem;
            hocvu.NgayHen = dateTimePicker1.Value;
            hocvu.TinhTrang = Convert.ToBoolean(checkEdit1.EditValue.ToString());
            hocvu.DonViID = Convert.ToInt32(comboBox2.SelectedValue.ToString());
            hocvu.DanhMucID = Convert.ToInt32(comboBox1.SelectedValue.ToString());
            db.SaveChanges();
        }
        private void barButtonItem4_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            HocVu hocvu = new HocVu();
            int UserID = Convert.ToInt32(textBox3.Text);
            int DanhMucID = Convert.ToInt32(comboBox1.SelectedValue.ToString());
            int dem;
            var child = db.HocVus.Where(x => x.UserID + x.DanhMucID == UserID + DanhMucID && x.UserID == UserID);
            var getHVID = from q in db.HocVus
                          where (q.UserID + q.DanhMucID == UserID + DanhMucID && q.UserID == UserID)
                          select q.HocVuID;
            var moc = from q in db.HocVus
                      where (q.UserID + q.DanhMucID == UserID + DanhMucID && q.UserID == UserID && q.TinhTrang == true)
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
                var xyz = db.HocVus.Where(x => x.UserID + x.DanhMucID == UserID + DanhMucID && x.UserID == UserID && x.HocVuID > mocMax);
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
            XtraMessageBox.Show("Đã Lưu!");
            this.Close();
        }
    }
}