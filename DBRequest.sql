USE [master]
GO
/****** Object:  Database [DBZotovRequest21]    Script Date: 29.11.2024 15:31:28 ******/
CREATE DATABASE [DBZotovRequest21]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBZotovRequests21', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBZotovRequests21.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBZotovRequests21_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBZotovRequests21_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBZotovRequest21] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBZotovRequest21].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBZotovRequest21] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBZotovRequest21] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBZotovRequest21] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBZotovRequest21] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBZotovRequest21] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBZotovRequest21] SET  MULTI_USER 
GO
ALTER DATABASE [DBZotovRequest21] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBZotovRequest21] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBZotovRequest21] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBZotovRequest21] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBZotovRequest21] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBZotovRequest21] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBZotovRequest21] SET QUERY_STORE = OFF
GO
USE [DBZotovRequest21]
GO
/****** Object:  Table [dbo].[User]    Script Date: 29.11.2024 15:31:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,101) NOT NULL,
	[UserFullName] [nvarchar](150) NOT NULL,
	[UserLogin] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[UserRoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Device]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Device](
	[DeviceId] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Devices] PRIMARY KEY CLUSTERED 
(
	[DeviceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Defect]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Defect](
	[DefectId] [int] IDENTITY(1,1) NOT NULL,
	[DefectName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Defectes] PRIMARY KEY CLUSTERED 
(
	[DefectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Priory]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Priory](
	[PrioryId] [int] IDENTITY(1,1) NOT NULL,
	[PrioryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Prioritys] PRIMARY KEY CLUSTERED 
(
	[PrioryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stage]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage](
	[StageId] [int] IDENTITY(1,1) NOT NULL,
	[StageName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_phases] PRIMARY KEY CLUSTERED 
(
	[StageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[RequestDate] [date] NOT NULL,
	[RequestDeviceId] [int] NOT NULL,
	[RequestDefectId] [int] NOT NULL,
	[RequestClientId] [int] NOT NULL,
	[RequestDescription] [nvarchar](500) NOT NULL,
	[RequestStatusId] [int] NOT NULL,
	[RequestMasterId] [int] NOT NULL,
	[RequestTime] [int] NOT NULL,
	[RequestPrioryId] [int] NOT NULL,
	[RequestStageId] [int] NOT NULL,
	[RequestComment] [nvarchar](500) NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_All_Request]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_All_Request]
AS
SELECT dbo.Request.RequestID, dbo.Request.RequestDate, dbo.Device.DeviceName, dbo.Defect.DefecteName, dbo.[User].UserFullName AS Client, dbo.Request.RequestDescription, dbo.Status.StatusName, User_1.UserFullName AS Master, 
                  dbo.Request.RequestTime, dbo.Priory.PrioryName, dbo.Stage.StageName, dbo.Request.RequestComment
FROM     dbo.Defect INNER JOIN
                  dbo.Request ON dbo.Defect.DefecteId = dbo.Request.RequestDefectId INNER JOIN
                  dbo.Device ON dbo.Request.RequestDeviceId = dbo.Device.DeviceId INNER JOIN
                  dbo.Priory ON dbo.Request.RequestPrioryId = dbo.Priory.PrioryId INNER JOIN
                  dbo.Stage ON dbo.Request.RequestStageId = dbo.Stage.StageId INNER JOIN
                  dbo.Status ON dbo.Request.RequestStatusId = dbo.Status.StatusId INNER JOIN
                  dbo.[User] ON dbo.Request.RequestClientId = dbo.[User].UserId INNER JOIN
                  dbo.[User] AS User_1 ON dbo.Request.RequestMasterId = User_1.UserId
GO
/****** Object:  Table [dbo].[Role]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Defect] FOREIGN KEY([RequestDefectId])
REFERENCES [dbo].[Defect] ([DefectId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Defect]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Device] FOREIGN KEY([RequestDeviceId])
REFERENCES [dbo].[Device] ([DeviceId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Device]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Priory] FOREIGN KEY([RequestPrioryId])
REFERENCES [dbo].[Priory] ([PrioryId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Priory]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Stage] FOREIGN KEY([RequestStageId])
REFERENCES [dbo].[Stage] ([StageId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Stage]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Status] FOREIGN KEY([RequestStatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Status]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User] FOREIGN KEY([RequestClientId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_User1] FOREIGN KEY([RequestMasterId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_User1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles1] FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_Users_Roles1]
GO
/****** Object:  StoredProcedure [dbo].[GetRequestMasterId]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Хранимая процедура по номеру мастера
CREATE PROCEDURE [dbo].[GetRequestMasterId] (@MasterId int)

AS
BEGIN
	SELECT RequestID, RequestDate, RequestMasterId
	FROM     Request
	WHERE  (RequestMasterId = @MasterId)
END
GO
/****** Object:  StoredProcedure [dbo].[GetRequestMasterName]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRequestMasterName] (@MasterName nvarchar(150))

AS
BEGIN
	SELECT Request.RequestID, Request.RequestDate, Request.RequestMasterId
	FROM     Request INNER JOIN
                  [User] ON Request.RequestMasterId = [User].UserId 
				  Where   ([User].UserFullName = @MasterName)
End
GO
/****** Object:  StoredProcedure [dbo].[GetRequestMasterNameLike]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRequestMasterNameLike] (@MasterName nvarchar(150))

AS
BEGIN
	SELECT Request.RequestID, Request.RequestDate, Request.RequestMasterId
	FROM     Request INNER JOIN
                  [User] ON Request.RequestMasterId = [User].UserId 
				  Where   [User].UserFullName LIKE ('%'+@MasterName+'%')
End
GO
/****** Object:  StoredProcedure [dbo].[GetRequestMAterId]    Script Date: 29.11.2024 15:31:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetRequestMAterId] (@MasterId int)

AS
BEGIN
	SELECT RequestID, RequestDate, RequestMasterId
	FROM     Request
	WHERE  (RequestMasterId = @MasterId)
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[3] 2[29] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Defect"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Request"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 998
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Device"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 126
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Priory"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 126
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stage"
            Begin Extent = 
               Top = 7
               Left = 1046
               Bottom = 126
               Right = 1240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Status"
            Begin Extent = 
               Top = 7
               Left = 1288
               Bottom = 126
               Right = 1482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 206
               Left = 324
               Bottom = 369
               Right = 518
            End
            DisplayFlags = 280
           ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_All_Request'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' TopColumn = 0
         End
         Begin Table = "User_1"
            Begin Extent = 
               Top = 127
               Left = 48
               Bottom = 290
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_All_Request'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_All_Request'
GO
USE [master]
GO
ALTER DATABASE [DBZotovRequest21] SET  READ_WRITE 
GO
