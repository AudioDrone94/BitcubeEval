USE [master]
GO
/****** Object:  Database [AssessmentProject]    Script Date: 2021/01/09 21:42:18 ******/
CREATE DATABASE [AssessmentProject]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
