USE [master]
GO
/****** Object:  Database [ExamMappingDB]    Script Date: 09/01/2018 23:15:51 ******/
CREATE DATABASE [ExamMappingDB]
 CONTAINMENT = NONE
GO
ALTER DATABASE [ExamMappingDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamMappingDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamMappingDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExamMappingDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExamMappingDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExamMappingDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExamMappingDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExamMappingDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExamMappingDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamMappingDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamMappingDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamMappingDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExamMappingDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExamMappingDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamMappingDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExamMappingDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamMappingDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExamMappingDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamMappingDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamMappingDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamMappingDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamMappingDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamMappingDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExamMappingDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamMappingDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ExamMappingDB] SET  MULTI_USER 
GO
ALTER DATABASE [ExamMappingDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamMappingDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamMappingDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamMappingDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ExamMappingDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ExamMappingDB] SET QUERY_STORE = OFF
GO
USE [ExamMappingDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ExamMappingDB]
GO
/****** Object:  Table [dbo].[Config]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SettingKey] [nvarchar](150) NOT NULL,
	[SettingValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamInstances]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamInstances](
	[ExamInstanceId] [int] IDENTITY(1,1) NOT NULL,
	[ExamId] [int] NOT NULL,
	[ExamSideId] [int] NOT NULL,
 CONSTRAINT [PK_ExamInstances_1] PRIMARY KEY CLUSTERED 
(
	[ExamInstanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exams]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Grades]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grades](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Grades] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PointLevels]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PointLevels](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Value] [decimal](3, 1) NOT NULL,
 CONSTRAINT [PK_PointLevels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionPointLevels]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionPointLevels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[PointLevelId] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_QuestionPointLevels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] NOT NULL,
	[E‎xamInstanceId] [int] NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[PrimarySkillId] [int] NOT NULL,
	[SecondarySkillId] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuestionScores]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionScores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Score] [decimal](3, 1) NOT NULL,
 CONSTRAINT [PK_QuestionScores] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolClasses]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolClasses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_SchoolClasses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schools]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schools](
	[SchoolId] [int] NOT NULL,
	[Name] [nvarchar](150) NULL,
 CONSTRAINT [PK_Schools] PRIMARY KEY CLUSTERED 
(
	[SchoolId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SkillLevels]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SkillLevels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[LevelId] [int] NOT NULL,
	[LevelName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_SkillLevels] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentExams]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentExams](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[ExamInstanceId] [int] NOT NULL,
 CONSTRAINT [PK_StudentExams] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Students]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](150) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[IdNumber] [nvarchar](10) NULL,
	[StudentType] [int] NOT NULL,
	[SchoolId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
	[ClassId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentTypes]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentTypes](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_StudentTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 09/01/2018 23:15:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[QuestionPointLevels] ADD  CONSTRAINT [DF_QuestionPointLevels_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Exams]  WITH NOCHECK ADD  CONSTRAINT [FK_Exams_Subjects] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[Exams] NOCHECK CONSTRAINT [FK_Exams_Subjects]
GO
ALTER TABLE [dbo].[QuestionPointLevels]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPointLevels_PointLevels] FOREIGN KEY([PointLevelId])
REFERENCES [dbo].[PointLevels] ([Id])
GO
ALTER TABLE [dbo].[QuestionPointLevels] CHECK CONSTRAINT [FK_QuestionPointLevels_PointLevels]
GO
ALTER TABLE [dbo].[QuestionPointLevels]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPointLevels_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[QuestionPointLevels] CHECK CONSTRAINT [FK_QuestionPointLevels_Questions]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_ExamInstances] FOREIGN KEY([E‎xamInstanceId])
REFERENCES [dbo].[ExamInstances] ([ExamInstanceId])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_ExamInstances]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_SkillLevels] FOREIGN KEY([PrimarySkillId])
REFERENCES [dbo].[SkillLevels] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_SkillLevels]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_SkillLevels1] FOREIGN KEY([SecondarySkillId])
REFERENCES [dbo].[SkillLevels] ([Id])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_SkillLevels1]
GO
ALTER TABLE [dbo].[QuestionScores]  WITH CHECK ADD  CONSTRAINT [FK_QuestionScores_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
GO
ALTER TABLE [dbo].[QuestionScores] CHECK CONSTRAINT [FK_QuestionScores_Questions]
GO
ALTER TABLE [dbo].[QuestionScores]  WITH CHECK ADD  CONSTRAINT [FK_QuestionScores_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[QuestionScores] CHECK CONSTRAINT [FK_QuestionScores_Students]
GO
ALTER TABLE [dbo].[SkillLevels]  WITH CHECK ADD  CONSTRAINT [FK_SkillLevels_Subjects] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([Id])
GO
ALTER TABLE [dbo].[SkillLevels] CHECK CONSTRAINT [FK_SkillLevels_Subjects]
GO
ALTER TABLE [dbo].[StudentExams]  WITH CHECK ADD  CONSTRAINT [FK_StudentExams_ExamInstances] FOREIGN KEY([ExamInstanceId])
REFERENCES [dbo].[ExamInstances] ([ExamInstanceId])
GO
ALTER TABLE [dbo].[StudentExams] CHECK CONSTRAINT [FK_StudentExams_ExamInstances]
GO
ALTER TABLE [dbo].[StudentExams]  WITH CHECK ADD  CONSTRAINT [FK_StudentExams_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[StudentExams] CHECK CONSTRAINT [FK_StudentExams_Students]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Grades] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grades] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Grades]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_SchoolClasses] FOREIGN KEY([ClassId])
REFERENCES [dbo].[SchoolClasses] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_SchoolClasses]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Schools] FOREIGN KEY([SchoolId])
REFERENCES [dbo].[Schools] ([SchoolId])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Schools]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_StudentTypes] FOREIGN KEY([StudentType])
REFERENCES [dbo].[StudentTypes] ([Id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_StudentTypes]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds the side of the exam: 1 for A, 2 for B;
Null if no sides in the exam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExamInstances', @level2type=N'COLUMN',@level2name=N'ExamSideId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds an instance of an exam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ExamInstances'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Holds a template for an exam' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Exams'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The number of the level: 1,2,3,4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SkillLevels', @level2type=N'COLUMN',@level2name=N'LevelId'
GO
USE [master]
GO
ALTER DATABASE [ExamMappingDB] SET  READ_WRITE 
GO
