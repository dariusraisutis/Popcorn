USE [master]
GO
/****** Object:  Database [Popcorn]    Script Date: 06/12/2017 11:19:33 ******/
CREATE DATABASE [Popcorn] ON  PRIMARY 
( NAME = N'Popcorn', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Popcorn.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Popcorn_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Popcorn_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Popcorn] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Popcorn].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Popcorn] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Popcorn] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Popcorn] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Popcorn] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Popcorn] SET ARITHABORT OFF
GO
ALTER DATABASE [Popcorn] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Popcorn] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Popcorn] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Popcorn] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Popcorn] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Popcorn] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Popcorn] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Popcorn] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Popcorn] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Popcorn] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Popcorn] SET  DISABLE_BROKER
GO
ALTER DATABASE [Popcorn] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Popcorn] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Popcorn] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Popcorn] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Popcorn] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Popcorn] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Popcorn] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Popcorn] SET  READ_WRITE
GO
ALTER DATABASE [Popcorn] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Popcorn] SET  MULTI_USER
GO
ALTER DATABASE [Popcorn] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Popcorn] SET DB_CHAINING OFF
GO
USE [Popcorn]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movie](
	[Movie_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Genre] [varchar](50) NULL,
	[RunTime] [time](7) NULL,
	[Poster] [image] NULL,
	[Price] [money] NOT NULL,
	[Cast] [varchar](50) NULL,
	[Director] [varchar](50) NULL,
	[TimeShown1] [time](7) NULL,
	[TimeShows2] [time](7) NULL,
	[TimeShown3] [time](7) NULL,
	[TimeShown4] [time](7) NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[Movie_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[User_Name] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserType] [nchar](10) NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [name] UNIQUE NONCLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [unqueUserNamesConstraint] UNIQUE NONCLUSTERED 
(
	[User_Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Auditorium]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Auditorium](
	[Audtorium_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[NumberOfSeats] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Auditorium] PRIMARY KEY CLUSTERED 
(
	[Audtorium_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_getUsedSession1]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getUsedSession1]
as begin
declare @query as varchar(max)
set @query = 'select Auditorium_ID, time from session'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getSeatPlanID]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getSeatPlanID]
as begin
declare @query varchar(max) = 'select top 1 * from seatplan order by seatplan_id desc'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getNumberOfSeats]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getNumberOfSeats]
(@auditoriumId varchar(50))
as begin
declare @query varchar(max) = 'Select NumberOfSeats from Auditorium where Audtorium_ID = '''+@auditoriumId+''''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getMovieId]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getMovieId]
as begin
declare @query varchar(max) = 'select top 1 * from movie order by movie_id desc'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_editMovie1]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_editMovie1]
(@id varchar(10), @title varchar(100), @genre varchar (100), @runTime varchar(100),@ticketPrice varchar(100))
as begin
declare @query as varchar(max)
set @query = 'update movie set Title = '''+@title+''', Genre = '''+@genre+''', RunTime = '''+@runTime+''',
Price =  '''+@ticketPrice+'''
where Movie_ID = '+@id+''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_editMovie]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_editMovie]
(@id varchar(10), @title varchar(100), @genre varchar (100), @runTime varchar(100),@ticketPrice varchar(100),
 @timeShown1 varchar(50), @timeShown2 varchar(50), @timeShown3 varchar(50))
as begin
declare @query as varchar(max)
set @query = 'update movie set Title = '''+@title+''', Genre = '''+@genre+''', RunTime = '''+@runTime+''',
Price =  '''+@ticketPrice+''', TimeShown1 = '''+@timeShown1+''',
TimeShows2 = '''+@timeShown2+''', Timeshown3 = '''+@timeShown3+'''
where Movie_ID = '+@id+''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addUser2]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_addUser2]
(@username varchar(50), @password varchar(50), @userType varchar(50), @name varchar(50))
as begin
declare @query as varchar(max)
set @query = 'insert into Employee (User_Name, Password, UserType, Name) values ('''+@username+''', '''+@password+''', '''+@userType+''', '''+@name+''')'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addUser1]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_addUser1]
(@username varchar(50), @password varchar(50), @userType varchar(50))
as begin
declare @query as varchar(max)
set @query = 'insert into Employee (User_Name, Password, UserType) values ('''+@username+''', '''+@password+''', '''+@userType+''')'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addUser]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_addUser]
(@username varchar(50), @password varchar(50), @userType varchar(50))
as begin
declare @query as varchar(max)
set @query = 'insert into Employee (User_Name, Password, UserType) values ('''+@username+''', '''+@password+''', '''+@userType+''')'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addSession]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_addSession]
(@movieID varchar(50),@planID varchar(50), @audit varchar(50),@time varchar(50))
as begin
declare @query as varchar(max)
set @query = 'insert into Session (Movie_ID, SeatPlan_ID, Auditorium_ID, Time) values ('''+@movieID+''',
'''+@planID+''', '''+@audit+''', '''+@time+''')'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addSeatPlan]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_addSeatPlan]
(@auditoriumId varchar(50))
as begin 
declare @query varchar(max) = 'insert into seatplan(auditorium_id) values('''+@auditoriumId+''')'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addSeat]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_addSeat]
(@number varchar(50), @reserved varchar(50), @planId varchar(50))
as begin
declare @query varchar(max) = 'insert into seat (number, reserved, seatplan_id) values
							  ('''+@number+''', '''+@reserved+''', '''+@planId+''')'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addMovie6]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_addMovie6]
(@title varchar(50),@genre varchar(50), @runTime varchar(50), 
@ticketPrice varchar(50), @timeShown1 varchar(50), @timeShown2 varchar(50), @timeShown3 varchar(50))
as begin
declare @query as varchar(max)
set @query = 'insert into movie (Title, Genre, RunTime, Price, TimeShown1, TimeShows2, TimeShown3) values ('''+@title+''',
'''+@genre+''', '''+@runTime+''', '''+@ticketPrice+''', '''+@timeShown1+''', '''+@timeShown2+''', '''+@timeShown3+''')'
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_addMovie2]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_addMovie2]
(@poster varchar(100), @id varchar(10))
as begin
declare @query as varchar(max)
set @query = 'update Movie set Poster = bulkcolumn from openrowset
(bulk  '''+@poster +''' , single_blob) as MoviePoster
where Movie.Movie_ID = '+@id+''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_viewEditMovie]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_viewEditMovie]
(@id varchar(100))
as begin
declare @query as varchar(max)
set @query = 'select * from movie where Movie_ID = '+@id+''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectSession2]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_selectSession2]
(@movieId varchar(50))
as begin
declare @query as varchar(max)
set @query = 'select Time from session where movie_ID = '+@movieID+''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectSession1]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_selectSession1]
(@movieId varchar(50))
as begin
declare @query as varchar(max)
set @query = 'select session_ID from session where movie_ID = '+@movieID+''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_selectSession]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_selectSession]
(@movieId varchar(50))
as begin
declare @query as varchar(max)
set @query = 'select session_ID from session where movie_ID = '''+@movieID+''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_seatPlanToDelete]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_seatPlanToDelete]
(@id varchar(50))
as begin
declare @query varchar(max)= 'select seatplan_id from session where movie_id = '''+@id+''''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_removeUser1]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_removeUser1]
(@employeeId varchar(50))
as begin
declare @query varchar(max) = 'delete from employee where Employee_ID = '''+@employeeId+''''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_removeUser]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_removeUser]
(@employeeId varchar(50))
as begin
declare @query varchar(max) = 'delete from employee where Employee_ID = '+@employeeId+''
execute (@query)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_removeMovie]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_removeMovie]
(@movieId varchar(50), @seatplanId varchar(50))
as begin
declare @queryMovie varchar(max) = 'delete * from movie where Movie_ID = '''+@movieId+''''
declare @querySession varchar(max) = 'delete * from session where Movie_ID = '''+@movieId+''''
declare @querySeatPlan varchar(max) = 'delete * from seatplan where seatplan_d = '''+@seatplanId+''''
declare @querySeat varchar(max) = 'delete * seat where seatplan_id = '''+@seatplanid+''''
execute (@querySeat)
execute (@querySeatPlan)
execute (@querySession)
execute (@queryMovie)
end
GO
/****** Object:  StoredProcedure [dbo].[sp_movieList1]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_movieList1]
as begin 
select * from Movie
end
GO
/****** Object:  StoredProcedure [dbo].[sp_logIn4]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_logIn4]
(@Username varchar(50) , @Password varchar(50),
@Result varchar(50) OUTput, @result2 varchar(50) output, @result3 varchar(50)output, @result4 varchar(50) output)
as
begin
select @Result = User_name+' '+Password from employee where User_Name=@Username and Password=@Password
select @result2 = Name from employee where User_Name=@Username and Password=@Password
select @result3 = employee_Id from employee where User_Name=@Username and Password=@Password
select @result4 = userType from employee where User_Name=@Username and Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_logIn3]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_logIn3]
(@Username varchar(50) , @Password varchar(50),
@Result varchar(50) OUTput, @result2 varchar(50) output, @result3 varchar(50), @result4 varchar(50) output)
as
begin
select @Result = User_name+' '+Password from employee where User_Name=@Username and Password=@Password
select @result2 = Name from employee where User_Name=@Username and Password=@Password
select @result3 = employee_Id from employee where User_Name=@Username and Password=@Password
select @result4 = userType from employee where User_Name=@Username and Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_logIn2]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_logIn2]
(@Username varchar(50) , @Password varchar(50),
@Result varchar(50) OUTput, @result2 varchar(50) output, @result3 varchar(50), @result4 varchar(50) output)
as
begin
select @Result = User_name+' '+Password from employee where User_Name=@Username and Password=@Password
select @result2 = Name from employee where User_Name=@Username and Password=@Password
select @result3 = employee_Id from employee where User_Name=@Username and Password=@Password
select @result4 = userType from employee where User_Name=@Username and Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_logIn1]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_logIn1]
(@Username varchar(50) , @Password varchar(50),
@Result varchar(50) OUTput, @result2 varchar(50) output, @result3 varchar(50))
as
begin
select @Result = User_name+' '+Password from employee where User_Name=@Username and Password=@Password
select @result2 = Name from employee where User_Name=@Username and Password=@Password
select @result3 = employee_Id from employee where User_Name=@Username and Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_logIn]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_logIn]
(@Username varchar(50) , @Password varchar(50),
@Result varchar(50) OUTput)
as
begin
select @Result= User_name+' '+Password from employee where User_Name=@Username and Password=@Password
end
GO
/****** Object:  StoredProcedure [dbo].[sp_showAllUsers]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_showAllUsers]
as begin
select * from employee
end
GO
/****** Object:  Table [dbo].[SeatPlan]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatPlan](
	[SeatPlan_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Auditorium_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_SeatPlan] PRIMARY KEY CLUSTERED 
(
	[SeatPlan_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Seat]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Seat](
	[Seat_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Number] [numeric](18, 0) NOT NULL,
	[Reserved] [bit] NOT NULL,
	[SeatPlan_ID] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Seat] PRIMARY KEY CLUSTERED 
(
	[Seat_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 06/12/2017 11:19:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[Session_ID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Movie_ID] [numeric](18, 0) NOT NULL,
	[SeatPlan_ID] [numeric](18, 0) NOT NULL,
	[Auditorium_ID] [numeric](18, 0) NOT NULL,
	[Time] [time](7) NOT NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[Session_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_SeatPlan_Auditorium]    Script Date: 06/12/2017 11:19:34 ******/
ALTER TABLE [dbo].[SeatPlan]  WITH CHECK ADD  CONSTRAINT [FK_SeatPlan_Auditorium] FOREIGN KEY([Auditorium_ID])
REFERENCES [dbo].[Auditorium] ([Audtorium_ID])
GO
ALTER TABLE [dbo].[SeatPlan] CHECK CONSTRAINT [FK_SeatPlan_Auditorium]
GO
/****** Object:  ForeignKey [FK_Seat_SeatPlan]    Script Date: 06/12/2017 11:19:34 ******/
ALTER TABLE [dbo].[Seat]  WITH CHECK ADD  CONSTRAINT [FK_Seat_SeatPlan] FOREIGN KEY([SeatPlan_ID])
REFERENCES [dbo].[SeatPlan] ([SeatPlan_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Seat] CHECK CONSTRAINT [FK_Seat_SeatPlan]
GO
/****** Object:  ForeignKey [FK_Session_Auditorium]    Script Date: 06/12/2017 11:19:34 ******/
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Auditorium] FOREIGN KEY([Auditorium_ID])
REFERENCES [dbo].[Auditorium] ([Audtorium_ID])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Auditorium]
GO
/****** Object:  ForeignKey [FK_Session_Movie]    Script Date: 06/12/2017 11:19:34 ******/
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Movie] FOREIGN KEY([Movie_ID])
REFERENCES [dbo].[Movie] ([Movie_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Movie]
GO
/****** Object:  ForeignKey [FK_Session_SeatPlan]    Script Date: 06/12/2017 11:19:34 ******/
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_SeatPlan] FOREIGN KEY([SeatPlan_ID])
REFERENCES [dbo].[SeatPlan] ([SeatPlan_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_SeatPlan]
GO
