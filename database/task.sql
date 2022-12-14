USE [master]
GO
/****** Object:  Database [task]    Script Date: 28-07-2022 12:23:01 ******/
CREATE DATABASE [task]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'task', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\task.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'task_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\task_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [task] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [task].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [task] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [task] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [task] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [task] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [task] SET ARITHABORT OFF 
GO
ALTER DATABASE [task] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [task] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [task] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [task] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [task] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [task] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [task] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [task] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [task] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [task] SET  DISABLE_BROKER 
GO
ALTER DATABASE [task] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [task] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [task] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [task] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [task] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [task] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [task] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [task] SET RECOVERY FULL 
GO
ALTER DATABASE [task] SET  MULTI_USER 
GO
ALTER DATABASE [task] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [task] SET DB_CHAINING OFF 
GO
ALTER DATABASE [task] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [task] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [task] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'task', N'ON'
GO
ALTER DATABASE [task] SET QUERY_STORE = OFF
GO
USE [task]
GO
/****** Object:  Table [dbo].[city]    Script Date: 28-07-2022 12:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[city_name] [varchar](max) NULL,
	[state_id] [int] NULL,
 CONSTRAINT [PK_city] PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 28-07-2022 12:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](max) NULL,
	[Email] [varchar](max) NULL,
	[Phone_No] [bigint] NULL,
	[Address] [varchar](max) NULL,
	[state_id] [int] NULL,
	[city_id] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Emp_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[state]    Script Date: 28-07-2022 12:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[state](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [varchar](max) NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (1, N'Surat', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (2, N'Bardoli', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (3, N'Baroda', 1)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (4, N'Mumbai', 2)
INSERT [dbo].[city] ([city_id], [city_name], [state_id]) VALUES (5, N'Pune', 2)
SET IDENTITY_INSERT [dbo].[city] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Emp_id], [Name], [Email], [Phone_No], [Address], [state_id], [city_id]) VALUES (1, N'JeneesVasoya', N'jeneesvasoya@gmail.com', 9727842123, N'yamuna nagar society.', 1, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[state] ON 

INSERT [dbo].[state] ([state_id], [state_name]) VALUES (1, N'Gujarat')
INSERT [dbo].[state] ([state_id], [state_name]) VALUES (2, N'Maharashtra')
SET IDENTITY_INSERT [dbo].[state] OFF
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [FK_city_state] FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([state_id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [FK_city_state]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_city] FOREIGN KEY([city_id])
REFERENCES [dbo].[city] ([city_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_city]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_state] FOREIGN KEY([state_id])
REFERENCES [dbo].[state] ([state_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_state]
GO
/****** Object:  StoredProcedure [dbo].[Addemployee]    Script Date: 28-07-2022 12:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Addemployee] 
	@n varchar(MAX),@em varchar(MAX),@pn bigint,@ad varchar(MAX),@st int,@ci int
AS
BEGIN
	insert into Employee (Name,Email,Phone_No,Address,state_id,city_id)
     values(@n,@em,@pn,@ad,@st,@ci)
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 28-07-2022 12:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteEmployee] 
	@id int
AS
BEGIN
	delete from Employee where Emp_id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[Editemployee]    Script Date: 28-07-2022 12:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Editemployee] 
	@n varchar(MAX),@em varchar(MAX),@pn bigint,@ad varchar(MAX),@st int,@ci int,@id int
AS
BEGIN
	update Employee set Name=@n,Email=@em,Phone_No=@pn,Address=@ad,state_id=@st,city_id=@ci where Emp_id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeList]    Script Date: 28-07-2022 12:23:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetEmployeeList]
	@id int,
	@flag tinyint
AS
BEGIN
	if @flag=0
	begin
	select * from Employee
	end
	else
	begin
	select * from Employee where Emp_id=@id
	end
END
GO
USE [master]
GO
ALTER DATABASE [task] SET  READ_WRITE 
GO
