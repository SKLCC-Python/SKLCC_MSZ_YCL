USE [master]
GO
/****** Object:  Database [RMI]    Script Date: 03/10/2016 15:05:09 ******/
CREATE DATABASE [RMI] ON  PRIMARY 
( NAME = N'RMI_Data', FILENAME = N'D:\study\MSSQLSERVER08\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RMI_Data.mdf' , SIZE = 14976KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'RMI_Log', FILENAME = N'D:\study\MSSQLSERVER08\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\RMI_Log.ldf' , SIZE = 16384KB , MAXSIZE = 2048GB , FILEGROWTH = 1024KB )
GO
ALTER DATABASE [RMI] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RMI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RMI] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [RMI] SET ANSI_NULLS OFF
GO
ALTER DATABASE [RMI] SET ANSI_PADDING OFF
GO
ALTER DATABASE [RMI] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [RMI] SET ARITHABORT OFF
GO
ALTER DATABASE [RMI] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [RMI] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [RMI] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [RMI] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [RMI] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [RMI] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [RMI] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [RMI] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [RMI] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [RMI] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [RMI] SET  ENABLE_BROKER
GO
ALTER DATABASE [RMI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [RMI] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [RMI] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [RMI] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [RMI] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [RMI] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [RMI] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [RMI] SET  READ_WRITE
GO
ALTER DATABASE [RMI] SET RECOVERY FULL
GO
ALTER DATABASE [RMI] SET  MULTI_USER
GO
ALTER DATABASE [RMI] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [RMI] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'RMI', N'ON'
GO
USE [RMI]
GO
/****** Object:  Table [dbo].[django_site]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_site](
	[id] [int] NOT NULL,
	[domain] [nvarchar](100) NOT NULL,
	[name] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] NOT NULL,
	[username] [nvarchar](30) NOT NULL,
	[first_name] [nvarchar](30) NOT NULL,
	[last_name] [nvarchar](30) NOT NULL,
	[email] [nvarchar](75) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[is_superuser] [bit] NOT NULL,
	[last_login] [datetime] NOT NULL,
	[date_joined] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] NOT NULL,
	[name] [nvarchar](80) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RMI_WORK_FLOW]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_WORK_FLOW](
	[FlowID] [uniqueidentifier] NOT NULL,
	[FlowName] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[LastModifiedTime] [datetime] NULL,
 CONSTRAINT [PK_RMI_WORKFLOW] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_WORK_FLOW', @level2type=N'COLUMN',@level2name=N'FlowID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流程名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_WORK_FLOW', @level2type=N'COLUMN',@level2name=N'FlowName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_WORK_FLOW', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_WORK_FLOW', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一次修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_WORK_FLOW', @level2type=N'COLUMN',@level2name=N'LastModifiedTime'
GO
/****** Object:  Table [dbo].[RMI_TASK_PROCESS_STEP]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_TASK_PROCESS_STEP](
	[SerialNo] [uniqueidentifier] NOT NULL,
	[ProcessID] [varchar](50) NOT NULL,
	[StepID] [uniqueidentifier] NOT NULL,
	[Finished] [tinyint] NULL,
	[FinishTime] [datetime] NULL,
	[LastModifiedTime] [datetime] NULL,
	[note] [varchar](max) NULL,
 CONSTRAINT [PK_RMI_TASK_PROCESS_STEP] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC,
	[ProcessID] ASC,
	[StepID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK_PROCESS_STEP', @level2type=N'COLUMN',@level2name=N'SerialNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK_PROCESS_STEP', @level2type=N'COLUMN',@level2name=N'ProcessID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单步骤ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK_PROCESS_STEP', @level2type=N'COLUMN',@level2name=N'StepID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单步骤完成状态，0未完成，1已完成,2表示正在编辑' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK_PROCESS_STEP', @level2type=N'COLUMN',@level2name=N'Finished'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'完成时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK_PROCESS_STEP', @level2type=N'COLUMN',@level2name=N'FinishTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一次修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK_PROCESS_STEP', @level2type=N'COLUMN',@level2name=N'LastModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK_PROCESS_STEP', @level2type=N'COLUMN',@level2name=N'note'
GO
/****** Object:  Table [dbo].[RMI_STEP]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_STEP](
	[StepID] [uniqueidentifier] NOT NULL,
	[StepName] [varchar](50) NULL,
	[CreateTime] [datetime] NULL,
	[LastModifiedTime] [datetime] NULL,
	[UserID] [varchar](50) NULL,
	[note] [varchar](max) NULL,
 CONSTRAINT [PK_RMI_STEP] PRIMARY KEY CLUSTERED 
(
	[StepID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_STEP', @level2type=N'COLUMN',@level2name=N'StepID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_STEP', @level2type=N'COLUMN',@level2name=N'StepName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_STEP', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最近一次修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_STEP', @level2type=N'COLUMN',@level2name=N'LastModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_STEP', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_STEP', @level2type=N'COLUMN',@level2name=N'note'
GO
/****** Object:  Table [dbo].[RMI_PROCESS_TYPE]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_PROCESS_TYPE](
	[Id] [varchar](50) NOT NULL,
	[Class] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检验表格类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_PROCESS_TYPE', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检验材料的类型（主料、辅料等）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_PROCESS_TYPE', @level2type=N'COLUMN',@level2name=N'Class'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检验材料名称（表格名称）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_PROCESS_TYPE', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相关说明和描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_PROCESS_TYPE', @level2type=N'COLUMN',@level2name=N'Description'
GO
/****** Object:  Table [dbo].[RMI_PROCESS_STEP]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_PROCESS_STEP](
	[ProcessID] [varchar](50) NOT NULL,
	[StepID] [uniqueidentifier] NOT NULL,
	[StepSeq] [int] NOT NULL,
 CONSTRAINT [PK_RMI_PROCESS_SETP] PRIMARY KEY CLUSTERED 
(
	[ProcessID] ASC,
	[StepID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'步骤顺序，该值越大，顺序越前' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_PROCESS_STEP', @level2type=N'COLUMN',@level2name=N'StepSeq'
GO
/****** Object:  Table [dbo].[RMI_JOB]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_JOB](
	[JobID] [varchar](50) NOT NULL,
	[Job] [varchar](50) NOT NULL,
	[Classification] [varchar](50) NULL,
 CONSTRAINT [PK_RMI_JOB] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RMI_FLOW_PROCESS]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_FLOW_PROCESS](
	[FlowID] [uniqueidentifier] NOT NULL,
	[ProcessID] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RMI_FLOW_PROCESS] PRIMARY KEY CLUSTERED 
(
	[FlowID] ASC,
	[ProcessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流程ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_FLOW_PROCESS', @level2type=N'COLUMN',@level2name=N'FlowID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理表单类型的ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_FLOW_PROCESS', @level2type=N'COLUMN',@level2name=N'ProcessID'
GO
/****** Object:  Table [dbo].[RMI_FEEDBACK]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_FEEDBACK](
	[Id] [varchar](50) NULL,
	[Content] [varchar](max) NULL,
	[Subject] [varchar](50) NULL,
	[SubmitTime] [varchar](50) NULL,
	[SubmitUserId] [varchar](50) NULL,
	[SubmitUserName] [varchar](50) NULL,
	[SubmitIP] [varchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RMI_F02_DATA]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_F02_DATA](
	[SerialNo] [uniqueidentifier] NULL,
	[JuanHao] [varchar](50) NULL,
	[GangHao] [varchar](50) NULL,
	[DaoLiaoZongShu] [float] NULL,
	[JianYanShu] [float] NULL,
	[CaiLiaoMingCheng] [varchar](50) NULL,
	[ShuLiang] [varchar](max) NULL,
	[ShuLiangPiBiao1] [float] NULL,
	[ShuLiangShiCe1] [float] NULL,
	[ShuLiangPiBiao2] [float] NULL,
	[ShuLiangShiCe2] [float] NULL,
	[GuiGeOrKuanDu] [varchar](50) NULL,
	[KuanDuOrGuiGeBiaoZhunZhi] [varchar](50) NULL,
	[KuanDuOrGuiGeBiaoZhunPianCha] [varchar](50) NULL,
	[KuanDuOrGuiGeShiCe1] [float] NULL,
	[KuanDuOrGuiGeShiCe2] [float] NULL,
	[KuanDuOrGuiGeShiCe3] [float] NULL,
	[CiDianJiDian] [int] NULL,
	[CiDianJiFen] [float] NULL,
	[DuiChenXingOrWanQuDu] [varchar](50) NULL,
	[DuiChenXingOrWanQuDuBiaoZhunZhi] [varchar](50) NULL,
	[DuiChenXingOrWanQuDuBiaoZhunPianCha] [varchar](50) NULL,
	[DuiChenXingOrWanQuDuShiCe] [float] NULL,
	[KeZhongBiaoZhunZhi] [varchar](50) NULL,
	[KeZhongBiaoZhunPianCha] [varchar](50) NULL,
	[KeZhongShiCe] [float] NULL,
	[KaiDuBiaoZhunZhi] [varchar](50) NULL,
	[KaiDuBiaoZhunPianCha] [varchar](50) NULL,
	[KaiDuShiCe] [float] NULL,
	[HouDuBiaoZhunZhi] [varchar](50) NULL,
	[HouDuBiaoZhunPianCha] [varchar](50) NULL,
	[HouDuShiCe] [float] NULL,
	[HuaXingBiaoZhunZhi] [varchar](50) NULL,
	[HuaXingBiaoZhunPianCha] [varchar](50) NULL,
	[HuaXingShiCe] [float] NULL,
	[DengJiPanDing] [varchar](10) NULL,
	[BeiZhu] [varchar](max) NULL,
	[InspectorNo] [varchar](50) NULL,
	[GongYingShang] [varchar](50) NULL,
	[GuiGeOrKuanDuDanWei] [varchar](50) NULL,
	[DuiChenXingOrWanQuDuDanWei] [varchar](50) NULL,
	[LeiBie] [varchar](50) NULL,
	[ShouRouHuiSuoLv] [varchar](50) NULL,
	[ZiRanHuiSuoLv] [varchar](50) NULL,
	[CaiLiaoCiDianZhuYaoWenTi] [varchar](max) NULL,
	[QiWei] [varchar](50) NULL,
	[QiWeiBeiZhu] [varchar](50) NULL,
	[AnLunShiYan] [varchar](50) NULL,
	[YanZhenJieGuo] [varchar](max) NULL,
	[hasBiaoZhunSeKa] [bit] NULL,
	[BiaoZhunSeKa] [varchar](max) NULL,
	[hasCaiLiaoFengYang] [bit] NULL,
	[CaiLiaoFengYang] [varchar](max) NULL,
	[JieLun] [varchar](50) NULL,
	[JieLunBeiZhu] [varchar](max) NULL,
	[YinBiaoWeiZhi] [varchar](50) NULL,
	[ShaXiang] [varchar](50) NULL,
	[ShouGan] [varchar](max) NULL,
	[ZhengFanMian] [varchar](50) NULL,
	[Id] [uniqueidentifier] NOT NULL,
	[XiangMuFlag] [varchar](max) NULL,
	[ChanPinZhongLei] [varchar](50) NULL,
 CONSTRAINT [PK_RMI_F02_DATA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'SerialNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'卷号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'JuanHao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'缸号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'GangHao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到料总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'DaoLiaoZongShu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'材料名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'CaiLiaoMingCheng'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量皮标1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'ShuLiangPiBiao1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量实测1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'ShuLiangShiCe1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量皮标2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'ShuLiangPiBiao2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'数量实测2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'ShuLiangShiCe2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'选择了规格或者宽度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'GuiGeOrKuanDu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'宽度或者规格标准值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KuanDuOrGuiGeBiaoZhunZhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'宽度或者规格偏差值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KuanDuOrGuiGeBiaoZhunPianCha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'宽度或者规格实测值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KuanDuOrGuiGeShiCe1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'宽度或者规格实测值2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KuanDuOrGuiGeShiCe2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'宽度或者规格实测值3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KuanDuOrGuiGeShiCe3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'疵点记点' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'CiDianJiDian'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'疵点记分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'CiDianJiFen'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对称性或者弯曲度选择' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'DuiChenXingOrWanQuDu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对称性或者弯曲度标准值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'DuiChenXingOrWanQuDuBiaoZhunZhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对称性或者弯曲度偏差' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'DuiChenXingOrWanQuDuBiaoZhunPianCha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对称性或者弯曲度实测值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'DuiChenXingOrWanQuDuShiCe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'克重标准值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KeZhongBiaoZhunZhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'克重标准偏差' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KeZhongBiaoZhunPianCha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'克重实测值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KeZhongShiCe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开度标准值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KaiDuBiaoZhunZhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开度标准偏差' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KaiDuBiaoZhunPianCha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开度实测值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'KaiDuShiCe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'厚度标准值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'HouDuBiaoZhunZhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'厚度标准偏差' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'HouDuBiaoZhunPianCha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'厚度实测值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'HouDuShiCe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'花型标准值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'HuaXingBiaoZhunZhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'花型标准值偏差' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'HuaXingBiaoZhunPianCha'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'花型实测' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'HuaXingShiCe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'BeiZhu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'录入人工号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'InspectorNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供应商' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'GongYingShang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格或者宽度的单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'GuiGeOrKuanDuDanWei'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'对称性或者弯曲度单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'DuiChenXingOrWanQuDuDanWei'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'材料疵点主要问题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'CaiLiaoCiDianZhuYaoWenTi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气味：正常或不正常' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'QiWei'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'气味备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'QiWeiBeiZhu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'氨纶试验结果：合格或不合格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'AnLunShiYan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'验针结果' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'YanZhenJieGuo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否勾选标准色卡比对' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'hasBiaoZhunSeKa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标准色卡级数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'BiaoZhunSeKa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否勾选材料封样比对' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'hasCaiLiaoFengYang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'材料封样比对级数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'CaiLiaoFengYang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检验结论：不做判定或者合格或者不合格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'JieLun'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'结论备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'JieLunBeiZhu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'印标位置：正确或不正确' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'YinBiaoWeiZhi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纱向：正确或不正确' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'ShaXiang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手感' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'ShouGan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'行主键标志' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'项目标记（用于表格缩短）' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'XiangMuFlag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产品种类' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F02_DATA', @level2type=N'COLUMN',@level2name=N'ChanPinZhongLei'
GO
/****** Object:  Table [dbo].[RMI_F01_DATA]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_F01_DATA](
	[SerialNo] [uniqueidentifier] NOT NULL,
	[GongYingShang] [varchar](50) NULL,
	[DaoLiaoZongShu] [int] NULL,
	[DingDanHao] [varchar](50) NULL,
	[GuiGe] [varchar](50) NOT NULL,
	[BiaoZhiShu] [int] NULL,
	[ShiCeShu] [int] NULL,
	[HeGeShu] [int] NULL,
	[WaiGuan] [bit] NULL,
	[JianYanHao] [varchar](50) NULL,
	[TouChanShu] [int] NULL,
	[DingDanShu] [int] NULL,
	[QiTa] [varchar](max) NULL,
	[ID] [uniqueidentifier] NOT NULL,
	[InspectorNo] [varchar](50) NULL,
	[MaterialType] [varchar](50) NULL,
 CONSTRAINT [PK_RMI_F01_DATA_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'供应商' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'GongYingShang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到料总数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'DaoLiaoZongShu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'DingDanHao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'规格' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'GuiGe'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标识数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'BiaoZhiShu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'实测数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'ShiCeShu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'合格数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'HeGeShu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外观' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'WaiGuan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'检验号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'JianYanHao'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'投产数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'TouChanShu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'DingDanShu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'QiTa'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'填写该数据的检验员' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_F01_DATA', @level2type=N'COLUMN',@level2name=N'InspectorNo'
GO
/****** Object:  Table [dbo].[RMI_DEPARTMENT]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_DEPARTMENT](
	[DepartmentID] [varchar](50) NOT NULL,
	[Department] [varchar](50) NOT NULL,
	[Classification] [varchar](50) NULL,
 CONSTRAINT [PK_RMI_DEPARTMENT] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'Department'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门类别' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_DEPARTMENT', @level2type=N'COLUMN',@level2name=N'Classification'
GO
/****** Object:  Table [dbo].[RMI_ACCOUNT_USER]    Script Date: 03/10/2016 15:05:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_ACCOUNT_USER](
	[ID] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[DepartmentID] [varchar](50) NOT NULL,
	[JobID] [varchar](50) NOT NULL,
	[Permission] [varchar](max) NULL,
	[CreateTime] [datetime] NULL,
	[LastModifiedTime] [datetime] NULL,
 CONSTRAINT [PK_RMI_ACCOUNT_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'员工ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_ACCOUNT_USER', @level2type=N'COLUMN',@level2name=N'ID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_ACCOUNT_USER', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户密码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_ACCOUNT_USER', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部门ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_ACCOUNT_USER', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职位ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_ACCOUNT_USER', @level2type=N'COLUMN',@level2name=N'JobID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限JSON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_ACCOUNT_USER', @level2type=N'COLUMN',@level2name=N'Permission'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_ACCOUNT_USER', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修订时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_ACCOUNT_USER', @level2type=N'COLUMN',@level2name=N'LastModifiedTime'
GO
/****** Object:  UserDefinedFunction [dbo].[getCurrentFinishedStep]    Script Date: 03/10/2016 15:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getCurrentFinishedStep](@serialno uniqueidentifier, @process varchar(50))
RETURNS varchar(50)
AS
BEGIN
DECLARE @step uniqueidentifier,@finish int, @stepName varchar(50);
SELECT TOP 1 @step = a.StepID, @finish = Finished FROM RMI_TASK_PROCESS_STEP a WITH(NOLOCK) JOIN RMI_PROCESS_STEP b WITH(NOLOCK)
ON a.StepID = b.StepID AND a.ProcessID = b.ProcessID WHERE SerialNo = @serialno
ORDER BY a.Finished DESC , b.StepSeq;
IF @finish != 1
	SELECT TOP 1 @stepName = StepName FROM RMI_STEP a WITH(NOLOCK) JOIN RMI_PROCESS_STEP b WITH(NOLOCK)
	 ON a.StepID = b.StepID
	 WHERE ProcessID = @process
	 ORDER BY StepSeq DESC;
ELSE
	SELECT @stepName = StepName FROM RMI_STEP WITH(NOLOCK) WHERE StepID = @step;
RETURN @stepName;
END
GO
/****** Object:  UserDefinedFunction [dbo].[getUserNameByUserID]    Script Date: 03/10/2016 15:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getUserNameByUserID](@UserID varchar(50))
RETURNS varchar(50)
AS
BEGIN
DECLARE @name varchar(50);
SELECT TOP 1 @name = name FROM RMI_ACCOUNT_USER WITH(NOLOCK) WHERE ID = @UserID;
RETURN @name;
END
GO
/****** Object:  Table [dbo].[RMI_TASK_PROCESS]    Script Date: 03/10/2016 15:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_TASK_PROCESS](
	[Serialno] [uniqueidentifier] NOT NULL,
	[ProcessID] [varchar](50) NOT NULL,
	[LastModifiedTime] [datetime] NULL,
	[LastModifiedUser] [varchar](50) NULL,
	[AssessTime] [datetime] NULL,
	[Assessor] [varchar](50) NULL,
 CONSTRAINT [PK_RMI_TASK_PROCESS] PRIMARY KEY CLUSTERED 
(
	[Serialno] ASC,
	[ProcessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK_PROCESS', @level2type=N'COLUMN',@level2name=N'Serialno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'表单类型ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK_PROCESS', @level2type=N'COLUMN',@level2name=N'ProcessID'
GO
/****** Object:  Table [dbo].[RMI_TASK]    Script Date: 03/10/2016 15:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RMI_TASK](
	[SerialNo] [uniqueidentifier] NOT NULL,
	[CreateTime] [datetime] NULL,
	[LastModifiedTime] [datetime] NULL,
	[ProductNo] [varchar](50) NULL,
	[ColorNo] [varchar](50) NULL,
	[ArriveTime] [datetime] NULL,
	[UserID] [varchar](50) NULL,
	[FlowID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RMI_TASK] PRIMARY KEY CLUSTERED 
(
	[SerialNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'任务流水号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK', @level2type=N'COLUMN',@level2name=N'SerialNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK', @level2type=N'COLUMN',@level2name=N'CreateTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最后一次修改时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK', @level2type=N'COLUMN',@level2name=N'LastModifiedTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'货号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK', @level2type=N'COLUMN',@level2name=N'ProductNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'色号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK', @level2type=N'COLUMN',@level2name=N'ColorNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'到料日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK', @level2type=N'COLUMN',@level2name=N'ArriveTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'创建人ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'工作流程ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RMI_TASK', @level2type=N'COLUMN',@level2name=N'FlowID'
GO
/****** Object:  UserDefinedFunction [dbo].[getLastModifiedUserNameByProcessID]    Script Date: 03/10/2016 15:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getLastModifiedUserNameByProcessID](@serialno uniqueidentifier, @process varchar(50))
RETURNS varchar(50)
AS
BEGIN
DECLARE @name varchar(50);
SELECT TOP 1 @name = name FROM RMI_TASK_PROCESS a WITH(NOLOCK)JOIN RMI_ACCOUNT_USER b WITH(NOLOCK)
ON a.LastModifiedUser = b.ID WHERE SerialNo = @serialno AND ProcessID = @process;
RETURN @name;
END
GO
/****** Object:  UserDefinedFunction [dbo].[getLastModifiedTimeByProcessID]    Script Date: 03/10/2016 15:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[getLastModifiedTimeByProcessID](@serialno uniqueidentifier, @process varchar(50))
RETURNS datetime
AS
BEGIN
DECLARE @lastModifiedTime datetime;
SELECT TOP 1 @lastModifiedTime = lastModifiedTime FROM RMI_TASK_PROCESS WITH(NOLOCK)WHERE SerialNo = @serialno AND ProcessID = @process;
RETURN @lastModifiedTime;
END
GO
/****** Object:  Default [DF_RMI_WORKFLOW_FlowID]    Script Date: 03/10/2016 15:05:11 ******/
ALTER TABLE [dbo].[RMI_WORK_FLOW] ADD  CONSTRAINT [DF_RMI_WORKFLOW_FlowID]  DEFAULT (newid()) FOR [FlowID]
GO
/****** Object:  Default [DF_RMI_WORK_FLOW_LastModifiedTime]    Script Date: 03/10/2016 15:05:11 ******/
ALTER TABLE [dbo].[RMI_WORK_FLOW] ADD  CONSTRAINT [DF_RMI_WORK_FLOW_LastModifiedTime]  DEFAULT (getdate()) FOR [LastModifiedTime]
GO
/****** Object:  Default [DF_RMI_STEP_StepID]    Script Date: 03/10/2016 15:05:11 ******/
ALTER TABLE [dbo].[RMI_STEP] ADD  CONSTRAINT [DF_RMI_STEP_StepID]  DEFAULT (newid()) FOR [StepID]
GO
/****** Object:  Default [DF_RMI_F02_DATA_Id]    Script Date: 03/10/2016 15:05:11 ******/
ALTER TABLE [dbo].[RMI_F02_DATA] ADD  CONSTRAINT [DF_RMI_F02_DATA_Id]  DEFAULT (newid()) FOR [Id]
GO
/****** Object:  Default [DF_RMI_F01_DATA_ID]    Script Date: 03/10/2016 15:05:11 ******/
ALTER TABLE [dbo].[RMI_F01_DATA] ADD  CONSTRAINT [DF_RMI_F01_DATA_ID]  DEFAULT (newid()) FOR [ID]
GO
/****** Object:  Default [DF_RMI_TASK_SerialNo]    Script Date: 03/10/2016 15:05:12 ******/
ALTER TABLE [dbo].[RMI_TASK] ADD  CONSTRAINT [DF_RMI_TASK_SerialNo]  DEFAULT (newid()) FOR [SerialNo]
GO
