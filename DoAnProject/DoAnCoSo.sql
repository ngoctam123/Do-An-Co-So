USE [HocVu]
GO
/****** Object:  Table [dbo].[DanhMucs]    Script Date: 7/10/2020 09:21:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucs](
	[DanhMucID] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
	[DonViID] [int] NULL,
 CONSTRAINT [PK_dbo.DanhMucs] PRIMARY KEY CLUSTERED 
(
	[DanhMucID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonVis]    Script Date: 7/10/2020 09:21:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonVis](
	[DonViID] [int] IDENTITY(1,1) NOT NULL,
	[TenDonVi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.DonVis] PRIMARY KEY CLUSTERED 
(
	[DonViID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FunctionRoles]    Script Date: 7/10/2020 09:21:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FunctionRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FunctionID] [int] NULL,
	[RolesID] [int] NULL,
 CONSTRAINT [PK_dbo.FunctionRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Functions]    Script Date: 7/10/2020 09:21:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Functions](
	[FunctionID] [int] IDENTITY(1,1) NOT NULL,
	[FunctionName] [nvarchar](max) NULL,
	[Formname] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Functions] PRIMARY KEY CLUSTERED 
(
	[FunctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HocVus]    Script Date: 7/10/2020 09:21:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HocVus](
	[HocVuID] [int] IDENTITY(1,1) NOT NULL,
	[NgayTao] [date] NOT NULL,
	[NoiDung] [ntext] NULL,
	[TinhTrang] [bit] NOT NULL,
	[ParentID] [int] NOT NULL,
	[NgayHen] [date] NOT NULL,
	[DanhMucID] [int] NULL,
	[UserID] [int] NULL,
	[DonViID] [int] NULL,
	[YeuCauThem] [nvarchar](max) NULL,
	[HocKy] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.HocVus] PRIMARY KEY CLUSTERED 
(
	[HocVuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Lops]    Script Date: 7/10/2020 09:21:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lops](
	[LopID] [int] IDENTITY(1,1) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[DonViID] [int] NULL,
 CONSTRAINT [PK_dbo.Lops] PRIMARY KEY CLUSTERED 
(
	[LopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/10/2020 09:21:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RolesID] [int] IDENTITY(1,1) NOT NULL,
	[TenRole] [nvarchar](50) NOT NULL DEFAULT (''),
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[RolesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/10/2020 09:21:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Email] [nvarchar](30) NOT NULL,
	[DonViID] [int] NULL,
	[LopID] [int] NULL,
	[RolesID] [int] NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DanhMucs] ON 

INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (13, N'Giấy xác nhận sinh viên', 8)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (14, N'Miễn giảm học phí ', 8)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (15, N'Cấp lại thẻ SV', 8)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (16, N'Giảm học phí', 8)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (19, N'Khóa lập trình ngắn hạn', 2)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (20, N'Chứng chỉ tin học cơ bản và nâng cao', 2)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (21, N'Nội, rút sổ đoàn', 12)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (22, N'Các vấn đề công tác Đoàn, Hội, Đảng', 12)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (23, N'Đào đạo tin học theo chuẩn quốc tế ', 2)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (24, N'Cấp bảng điểm ', 10)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (25, N'Cấp giấy xác nhận hoàn tất khóa học', 10)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (26, N'Cấp bằng tốt nghiệp', 10)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (27, N'Đổi biên lai học phí', 13)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (28, N'Nộp học phí', 13)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (29, N'Tư vấn học vụ', 14)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (30, N'Tham vấn tâm lý học đường', 14)
INSERT [dbo].[DanhMucs] ([DanhMucID], [TenDanhMuc], [DonViID]) VALUES (31, N'Tiếp nhận giải quyết đơn yêu cầu học vụ', 14)
SET IDENTITY_INSERT [dbo].[DanhMucs] OFF
SET IDENTITY_INSERT [dbo].[DonVis] ON 

INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (2, N'Khoa Công nghệ Thông tin')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (5, N'Văn phòng')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (6, N'Khoa Vật Lý')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (7, N'Khoa Ngoại ngữ')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (8, N'Phòng Công tác Sinh viên')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (9, N'Khoa Viễn Thông')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (10, N'Phòng Đào tạo')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (11, N'Phòng khảo thí kiểm định chất lượng')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (12, N'Đoàn Thanh niên và Hội viên')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (13, N'Phòng Tài chính ')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (14, N'Văn phòng Tư vấn và Hỗ trợ')
INSERT [dbo].[DonVis] ([DonViID], [TenDonVi]) VALUES (15, N'Quản trị viên')
SET IDENTITY_INSERT [dbo].[DonVis] OFF
SET IDENTITY_INSERT [dbo].[FunctionRoles] ON 

INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (11, 5, 2)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (12, 9, 2)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (13, 7, 5)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (14, 9, 5)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (15, 6, 6)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (16, 9, 6)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (18, 13, 3)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (22, 12, 1)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (23, 11, 1)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (24, 10, 1)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (25, 9, 1)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (26, 8, 1)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (27, 7, 1)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (28, 6, 1)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (29, 5, 1)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (1019, 8, 6)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (1020, 7, 6)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (1025, 8, 7)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (1026, 8, 1008)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (1027, 5, 1008)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (1028, 9, 1008)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (1030, 8, 1009)
INSERT [dbo].[FunctionRoles] ([ID], [FunctionID], [RolesID]) VALUES (1031, 9, 1009)
SET IDENTITY_INSERT [dbo].[FunctionRoles] OFF
SET IDENTITY_INSERT [dbo].[Functions] ON 

INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [Formname]) VALUES (5, N'Quản lý đơn vị', N'DoAnCoSo.Modules.mdlDonvi')
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [Formname]) VALUES (6, N'Quản lý lớp', N'DoAnCoSo.Modules.mdlLop')
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [Formname]) VALUES (7, N'Quản lý danh mục', N'DoAnCoSo.Modules.mdlDanhmuc')
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [Formname]) VALUES (8, N'Quản lý học vụ', N'DoAnCoSo.frmSS')
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [Formname]) VALUES (9, N'Quản lý người dùng', N'DoAnCoSo.Modules.mdlUser')
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [Formname]) VALUES (10, N'Quản lý vai trò', N'DoAnCoSo.Controls.mdlRole')
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [Formname]) VALUES (11, N'Quản lý chức năng', N'DoAnCoSo.Controls.mdlFunction')
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [Formname]) VALUES (12, N'Vai trò - chức năng', N'DoAnCoSo.Controls.mdlFunctionRole')
INSERT [dbo].[Functions] ([FunctionID], [FunctionName], [Formname]) VALUES (13, N'Sinh viên', N'DoAnCoSo.Students')
SET IDENTITY_INSERT [dbo].[Functions] OFF
SET IDENTITY_INSERT [dbo].[HocVus] ON 

INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1070, CAST(N'2020-06-18' AS Date), N'', 1, 0, CAST(N'2020-06-25' AS Date), 13, 7, 8, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1071, CAST(N'2020-06-18' AS Date), N'', 0, 1070, CAST(N'2020-06-25' AS Date), 13, 7, 8, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1072, CAST(N'2020-06-18' AS Date), N'', 0, 1070, CAST(N'2020-06-25' AS Date), 13, 7, 8, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1073, CAST(N'2020-06-18' AS Date), NULL, 0, 1070, CAST(N'2020-06-18' AS Date), 13, 7, 8, N'hello', NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1074, CAST(N'2020-06-18' AS Date), NULL, 0, 1070, CAST(N'2020-06-18' AS Date), 13, 7, 8, N'hello 1', NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1075, CAST(N'2020-06-23' AS Date), N'', 1, 1070, CAST(N'2020-06-30' AS Date), 13, 7, 8, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1076, CAST(N'2020-06-23' AS Date), N'', 0, 0, CAST(N'2020-06-30' AS Date), 13, 7, 8, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1077, CAST(N'2020-06-24' AS Date), N'', 0, 0, CAST(N'2020-07-01' AS Date), 13, 1016, 8, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1078, CAST(N'2020-06-24' AS Date), N'', 0, 1077, CAST(N'2020-07-01' AS Date), 13, 1016, 8, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1079, CAST(N'2020-06-24' AS Date), N'', 1, 1077, CAST(N'2020-06-24' AS Date), 13, 1016, 8, N'hello', NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1080, CAST(N'2020-06-24' AS Date), N'', 0, 0, CAST(N'2020-07-01' AS Date), 19, 1016, 2, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1081, CAST(N'2020-06-24' AS Date), N'', 0, 0, CAST(N'2020-07-01' AS Date), 13, 1016, 8, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1082, CAST(N'2020-06-25' AS Date), N'', 0, 0, CAST(N'2020-07-02' AS Date), 20, 1016, 2, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1083, CAST(N'2020-06-25' AS Date), N'cần bổ sung thêm hình ', 0, 1082, CAST(N'2020-07-02' AS Date), 20, 1016, 2, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1084, CAST(N'2020-06-25' AS Date), N'', 0, 1082, CAST(N'2020-07-02' AS Date), 20, 1016, 2, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1085, CAST(N'2020-06-25' AS Date), N'', 0, 1084, CAST(N'2020-07-02' AS Date), 20, 1016, 2, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1086, CAST(N'2020-06-25' AS Date), N'', 0, 1081, CAST(N'2020-07-02' AS Date), 13, 1016, 8, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1087, CAST(N'2020-06-28' AS Date), N'', 0, 1080, CAST(N'2020-07-05' AS Date), 19, 1016, 2, NULL, NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1088, CAST(N'2020-07-08' AS Date), N'', 0, 1080, CAST(N'2020-07-15' AS Date), 19, 1016, 2, NULL, N'1')
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1089, CAST(N'2020-07-08' AS Date), N'', 0, 1080, CAST(N'2020-07-15' AS Date), 19, 1016, 2, NULL, N'Học Kỳ 2')
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1090, CAST(N'2020-07-08' AS Date), NULL, 0, 1076, CAST(N'2020-06-18' AS Date), 13, 7, 8, N'hello 2', NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1091, CAST(N'2020-07-08' AS Date), NULL, 0, 1076, CAST(N'2020-06-18' AS Date), 13, 7, 8, N'hello 2', NULL)
INSERT [dbo].[HocVus] ([HocVuID], [NgayTao], [NoiDung], [TinhTrang], [ParentID], [NgayHen], [DanhMucID], [UserID], [DonViID], [YeuCauThem], [HocKy]) VALUES (1092, CAST(N'2020-07-08' AS Date), N'hello', 0, 1082, CAST(N'2020-07-15' AS Date), 20, 1016, 2, NULL, N'Học Kỳ 1')
SET IDENTITY_INSERT [dbo].[HocVus] OFF
SET IDENTITY_INSERT [dbo].[Lops] ON 

INSERT [dbo].[Lops] ([LopID], [TenLop], [DonViID]) VALUES (1, N'CTK40', 2)
INSERT [dbo].[Lops] ([LopID], [TenLop], [DonViID]) VALUES (2, N'CTK42', 2)
INSERT [dbo].[Lops] ([LopID], [TenLop], [DonViID]) VALUES (3, N'CKT41', 2)
INSERT [dbo].[Lops] ([LopID], [TenLop], [DonViID]) VALUES (6, N'CTK43', 2)
INSERT [dbo].[Lops] ([LopID], [TenLop], [DonViID]) VALUES (8, N'Không phụ trách lớp', 15)
INSERT [dbo].[Lops] ([LopID], [TenLop], [DonViID]) VALUES (10, N'VTK41', 9)
INSERT [dbo].[Lops] ([LopID], [TenLop], [DonViID]) VALUES (12, N'Chuyên viên', 5)
INSERT [dbo].[Lops] ([LopID], [TenLop], [DonViID]) VALUES (13, N'NNK41', 7)
SET IDENTITY_INSERT [dbo].[Lops] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RolesID], [TenRole]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RolesID], [TenRole]) VALUES (2, N'Quản lý đơn vị')
INSERT [dbo].[Roles] ([RolesID], [TenRole]) VALUES (3, N'Sinh viên')
INSERT [dbo].[Roles] ([RolesID], [TenRole]) VALUES (5, N'Quản lý danh mục')
INSERT [dbo].[Roles] ([RolesID], [TenRole]) VALUES (6, N'Quản lý lớp')
INSERT [dbo].[Roles] ([RolesID], [TenRole]) VALUES (7, N'Quản lý học vụ')
INSERT [dbo].[Roles] ([RolesID], [TenRole]) VALUES (1008, N'Quan ly Hoc vu')
INSERT [dbo].[Roles] ([RolesID], [TenRole]) VALUES (1009, N'Giáo Viên')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1, N'Admin', N'ngoctam.love1999@gmail.com', 15, 8, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (7, N'Võ Ngọc Tâm', N'1710261@dlu.edu.vn', 2, 3, 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (8, N'Hứa Đình Doanh', N'1714234', 2, 3, 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (9, N'user3', N'user3@gmail.com', 11, 8, 1)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1009, N'user4', N'user4@gmail.com', 5, 8, 2)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1010, N'user5', N'1610123', 2, 1, 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1011, N'user6', N'1810345', 2, 2, 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1013, N'user8', N'1714123', 9, 10, 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1014, N'user9', N'1910543', 2, 6, 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1015, N'user', N'us', 8, 12, 1008)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1016, N'Võ Ngọc Tâm', N'ngoctamztt@gmail.com', 2, 3, 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1017, N'Phạm Hoàng Việt', N'zipra1999@gmail.com', 2, 3, 3)
INSERT [dbo].[Users] ([UserID], [UserName], [Email], [DonViID], [LopID], [RolesID]) VALUES (1018, N'Lê Gia Công', N'Conglg@dlu.edu.vn', 2, 3, 1009)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[DanhMucs]  WITH CHECK ADD  CONSTRAINT [FK_dbo.DanhMucs_dbo.DonVis_DonViID] FOREIGN KEY([DonViID])
REFERENCES [dbo].[DonVis] ([DonViID])
GO
ALTER TABLE [dbo].[DanhMucs] CHECK CONSTRAINT [FK_dbo.DanhMucs_dbo.DonVis_DonViID]
GO
ALTER TABLE [dbo].[FunctionRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FunctionRoles_dbo.Functions_FunctionID] FOREIGN KEY([FunctionID])
REFERENCES [dbo].[Functions] ([FunctionID])
GO
ALTER TABLE [dbo].[FunctionRoles] CHECK CONSTRAINT [FK_dbo.FunctionRoles_dbo.Functions_FunctionID]
GO
ALTER TABLE [dbo].[FunctionRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FunctionRoles_dbo.Roles_RolesID] FOREIGN KEY([RolesID])
REFERENCES [dbo].[Roles] ([RolesID])
GO
ALTER TABLE [dbo].[FunctionRoles] CHECK CONSTRAINT [FK_dbo.FunctionRoles_dbo.Roles_RolesID]
GO
ALTER TABLE [dbo].[HocVus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.HocVus_dbo.DanhMucs_DanhMucID] FOREIGN KEY([DanhMucID])
REFERENCES [dbo].[DanhMucs] ([DanhMucID])
GO
ALTER TABLE [dbo].[HocVus] CHECK CONSTRAINT [FK_dbo.HocVus_dbo.DanhMucs_DanhMucID]
GO
ALTER TABLE [dbo].[HocVus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.HocVus_dbo.DonVis_DonViID] FOREIGN KEY([DonViID])
REFERENCES [dbo].[DonVis] ([DonViID])
GO
ALTER TABLE [dbo].[HocVus] CHECK CONSTRAINT [FK_dbo.HocVus_dbo.DonVis_DonViID]
GO
ALTER TABLE [dbo].[HocVus]  WITH CHECK ADD  CONSTRAINT [FK_dbo.HocVus_dbo.Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[HocVus] CHECK CONSTRAINT [FK_dbo.HocVus_dbo.Users_UserID]
GO
ALTER TABLE [dbo].[Lops]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Lops_dbo.DonVis_DonViID] FOREIGN KEY([DonViID])
REFERENCES [dbo].[DonVis] ([DonViID])
GO
ALTER TABLE [dbo].[Lops] CHECK CONSTRAINT [FK_dbo.Lops_dbo.DonVis_DonViID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.DonVis_DonViID] FOREIGN KEY([DonViID])
REFERENCES [dbo].[DonVis] ([DonViID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.DonVis_DonViID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Lops_LopID] FOREIGN KEY([LopID])
REFERENCES [dbo].[Lops] ([LopID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Lops_LopID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.Roles_RolesID] FOREIGN KEY([RolesID])
REFERENCES [dbo].[Roles] ([RolesID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.Roles_RolesID]
GO
