/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [Practica3]
GO
/****** Object:  Table [dbo].[COUNTRIES]    Script Date: 11/14/2017 11:36:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COUNTRIES](
	[country_id] [uniqueidentifier] NOT NULL,
	[country_name] [nchar](10) NOT NULL,
	[region_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_COUNTRIES] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPARTMENTS]    Script Date: 11/14/2017 11:36:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPARTMENTS](
	[department_id] [uniqueidentifier] NOT NULL,
	[department_name] [varchar](50) NOT NULL,
	[manager_id] [uniqueidentifier] NOT NULL,
	[location_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_DEPARTMENTS] PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLOYEES]    Script Date: 11/14/2017 11:36:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPLOYEES](
	[employee_id] [uniqueidentifier] NOT NULL,
	[first_name] [nchar](10) NOT NULL,
	[last_name] [nchar](10) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[phone_number] [nchar](10) NOT NULL,
	[hire_date] [date] NOT NULL,
	[job_id] [uniqueidentifier] NOT NULL,
	[salary] [money] NOT NULL,
	[comission_pct] [money] NOT NULL,
	[manager_id] [uniqueidentifier] NOT NULL,
	[department_id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOB_HISTORY]    Script Date: 11/14/2017 11:36:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOB_HISTORY](
	[employee_id] [uniqueidentifier] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NOT NULL,
	[job_id] [uniqueidentifier] NOT NULL,
	[department_id] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JOBS]    Script Date: 11/14/2017 11:36:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JOBS](
	[job_id] [uniqueidentifier] NOT NULL,
	[job_title] [varchar](50) NOT NULL,
	[min_salary] [money] NOT NULL,
	[max_salary] [money] NOT NULL,
 CONSTRAINT [PK_JOBS] PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOCATIONS]    Script Date: 11/14/2017 11:36:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOCATIONS](
	[location_id] [uniqueidentifier] NOT NULL,
	[street_address] [varchar](50) NOT NULL,
	[postal_code] [nchar](10) NOT NULL,
	[city] [varchar](50) NOT NULL,
	[state_province] [varchar](50) NOT NULL,
	[country_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LOCATIONS] PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REGIONS]    Script Date: 11/14/2017 11:36:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REGIONS](
	[region_id] [uniqueidentifier] NOT NULL,
	[region_name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_REGIONS] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[COUNTRIES]  WITH CHECK ADD  CONSTRAINT [FK_COUNTRIES_REGIONS] FOREIGN KEY([region_id])
REFERENCES [dbo].[REGIONS] ([region_id])
GO
ALTER TABLE [dbo].[COUNTRIES] CHECK CONSTRAINT [FK_COUNTRIES_REGIONS]
GO
ALTER TABLE [dbo].[DEPARTMENTS]  WITH CHECK ADD  CONSTRAINT [FK_DEPARTMENTS_LOCATIONS] FOREIGN KEY([location_id])
REFERENCES [dbo].[LOCATIONS] ([location_id])
GO
ALTER TABLE [dbo].[DEPARTMENTS] CHECK CONSTRAINT [FK_DEPARTMENTS_LOCATIONS]
GO
ALTER TABLE [dbo].[EMPLOYEES]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEES_DEPARTMENTS] FOREIGN KEY([department_id])
REFERENCES [dbo].[DEPARTMENTS] ([department_id])
GO
ALTER TABLE [dbo].[EMPLOYEES] CHECK CONSTRAINT [FK_EMPLOYEES_DEPARTMENTS]
GO
ALTER TABLE [dbo].[EMPLOYEES]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEES_JOBS] FOREIGN KEY([job_id])
REFERENCES [dbo].[JOBS] ([job_id])
GO
ALTER TABLE [dbo].[EMPLOYEES] CHECK CONSTRAINT [FK_EMPLOYEES_JOBS]
GO
ALTER TABLE [dbo].[JOB_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_JOB_HISTORY_DEPARTMENTS] FOREIGN KEY([department_id])
REFERENCES [dbo].[DEPARTMENTS] ([department_id])
GO
ALTER TABLE [dbo].[JOB_HISTORY] CHECK CONSTRAINT [FK_JOB_HISTORY_DEPARTMENTS]
GO
ALTER TABLE [dbo].[JOB_HISTORY]  WITH CHECK ADD  CONSTRAINT [FK_JOB_HISTORY_JOBS] FOREIGN KEY([job_id])
REFERENCES [dbo].[JOBS] ([job_id])
GO
ALTER TABLE [dbo].[JOB_HISTORY] CHECK CONSTRAINT [FK_JOB_HISTORY_JOBS]
GO
ALTER TABLE [dbo].[LOCATIONS]  WITH CHECK ADD  CONSTRAINT [FK_LOCATIONS_COUNTRIES] FOREIGN KEY([country_id])
REFERENCES [dbo].[COUNTRIES] ([country_id])
GO
ALTER TABLE [dbo].[LOCATIONS] CHECK CONSTRAINT [FK_LOCATIONS_COUNTRIES]
GO
