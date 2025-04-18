USE [master]
GO
/****** Object:  Database [SportSectionAccounting]    Script Date: 08.04.2025 9:33:34 ******/
CREATE DATABASE [SportSectionAccounting]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportSectionAccounting', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SportSectionAccounting.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportSectionAccounting_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SportSectionAccounting_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SportSectionAccounting] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportSectionAccounting].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportSectionAccounting] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportSectionAccounting] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportSectionAccounting] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SportSectionAccounting] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportSectionAccounting] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET RECOVERY FULL 
GO
ALTER DATABASE [SportSectionAccounting] SET  MULTI_USER 
GO
ALTER DATABASE [SportSectionAccounting] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportSectionAccounting] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportSectionAccounting] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportSectionAccounting] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportSectionAccounting] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportSectionAccounting] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SportSectionAccounting', N'ON'
GO
ALTER DATABASE [SportSectionAccounting] SET QUERY_STORE = ON
GO
ALTER DATABASE [SportSectionAccounting] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SportSectionAccounting]
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 08.04.2025 9:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievements](
	[AchievementId] [int] IDENTITY(1,1) NOT NULL,
	[ParticipantId] [int] NOT NULL,
	[SectionId] [int] NOT NULL,
	[AchievementDate] [date] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Points] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AchievementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 08.04.2025 9:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[AttendanceId] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleId] [int] NOT NULL,
	[ParticipantId] [int] NOT NULL,
	[AttendanceDate] [date] NOT NULL,
	[IsPresent] [bit] NULL,
	[Notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompetitionParticipants]    Script Date: 08.04.2025 9:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompetitionParticipants](
	[CompetitionParticipantId] [int] IDENTITY(1,1) NOT NULL,
	[CompetitionId] [int] NOT NULL,
	[ParticipantId] [int] NOT NULL,
	[Result] [nvarchar](100) NULL,
	[Place] [int] NULL,
	[Award] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompetitionParticipantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Competitions]    Script Date: 08.04.2025 9:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Competitions](
	[CompetitionId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[Location] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompetitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 08.04.2025 9:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[TrainerId] [int] NOT NULL,
	[DayOfWeek] [int] NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Location] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionParticipants]    Script Date: 08.04.2025 9:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionParticipants](
	[SectionParticipantId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[ParticipantId] [int] NOT NULL,
	[JoinDate] [datetime] NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SectionParticipantId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sections]    Script Date: 08.04.2025 9:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sections](
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SectionTrainers]    Script Date: 08.04.2025 9:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SectionTrainers](
	[SectionTrainerId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[TrainerId] [int] NOT NULL,
	[IsMainTrainer] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[SectionTrainerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 08.04.2025 9:33:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[Phone] [nvarchar](20) NULL,
	[Email] [nvarchar](100) NULL,
	[UserType] [int] NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Achievements] ADD  DEFAULT ((0)) FOR [Points]
GO
ALTER TABLE [dbo].[Attendance] ADD  DEFAULT ((0)) FOR [IsPresent]
GO
ALTER TABLE [dbo].[SectionParticipants] ADD  DEFAULT (getdate()) FOR [JoinDate]
GO
ALTER TABLE [dbo].[SectionParticipants] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Sections] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SectionTrainers] ADD  DEFAULT ((0)) FOR [IsMainTrainer]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Achievements]  WITH CHECK ADD FOREIGN KEY([ParticipantId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Achievements]  WITH CHECK ADD FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([SectionId])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([ParticipantId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([ScheduleId])
GO
ALTER TABLE [dbo].[CompetitionParticipants]  WITH CHECK ADD FOREIGN KEY([CompetitionId])
REFERENCES [dbo].[Competitions] ([CompetitionId])
GO
ALTER TABLE [dbo].[CompetitionParticipants]  WITH CHECK ADD FOREIGN KEY([ParticipantId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Competitions]  WITH CHECK ADD FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([SectionId])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([SectionId])
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[SectionParticipants]  WITH CHECK ADD FOREIGN KEY([ParticipantId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[SectionParticipants]  WITH CHECK ADD FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([SectionId])
GO
ALTER TABLE [dbo].[SectionTrainers]  WITH CHECK ADD FOREIGN KEY([SectionId])
REFERENCES [dbo].[Sections] ([SectionId])
GO
ALTER TABLE [dbo].[SectionTrainers]  WITH CHECK ADD FOREIGN KEY([TrainerId])
REFERENCES [dbo].[Users] ([UserId])
GO
USE [master]
GO
ALTER DATABASE [SportSectionAccounting] SET  READ_WRITE 
GO
