USE [master]
GO
/****** Object:  Database [AssessmentProject]    Script Date: 2021/01/09 21:42:18 ******/
CREATE DATABASE [AssessmentProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssessmentProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AssessmentProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssessmentProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AssessmentProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AssessmentProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssessmentProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssessmentProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssessmentProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssessmentProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssessmentProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssessmentProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssessmentProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AssessmentProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssessmentProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssessmentProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssessmentProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssessmentProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssessmentProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssessmentProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssessmentProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssessmentProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AssessmentProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssessmentProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssessmentProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssessmentProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssessmentProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssessmentProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssessmentProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssessmentProject] SET RECOVERY FULL 
GO
ALTER DATABASE [AssessmentProject] SET  MULTI_USER 
GO
ALTER DATABASE [AssessmentProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssessmentProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssessmentProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssessmentProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssessmentProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssessmentProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AssessmentProject', N'ON'
GO
ALTER DATABASE [AssessmentProject] SET QUERY_STORE = OFF
GO
USE [AssessmentProject]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2021/01/09 21:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](100) NOT NULL,
	[CourseDuration] [int] NOT NULL,
	[DegreeID] [int] NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Degree]    Script Date: 2021/01/09 21:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Degree](
	[DegreeID] [int] IDENTITY(1,1) NOT NULL,
	[DegreeName] [nvarchar](100) NOT NULL,
	[DegreeDuration] [int] NOT NULL,
	[LecturerID] [int] NOT NULL,
 CONSTRAINT [PK_Degree] PRIMARY KEY CLUSTERED 
(
	[DegreeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 2021/01/09 21:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[LecturerID] [int] IDENTITY(1,1) NOT NULL,
	[Forenames] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[LecturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2021/01/09 21:42:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[Forenames] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[DegreeID] [int] NOT NULL,
	[EmailAddress] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Degree] FOREIGN KEY([DegreeID])
REFERENCES [dbo].[Degree] ([DegreeID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Degree]
GO
ALTER TABLE [dbo].[Degree]  WITH CHECK ADD  CONSTRAINT [FK_Degree_Lecturer] FOREIGN KEY([LecturerID])
REFERENCES [dbo].[Lecturer] ([LecturerID])
GO
ALTER TABLE [dbo].[Degree] CHECK CONSTRAINT [FK_Degree_Lecturer]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Degree] FOREIGN KEY([DegreeID])
REFERENCES [dbo].[Degree] ([DegreeID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Degree]
GO
USE [master]
GO
ALTER DATABASE [AssessmentProject] SET  READ_WRITE 
GO
