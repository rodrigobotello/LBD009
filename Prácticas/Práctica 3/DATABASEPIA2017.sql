USE [DATABASEPIA2017]
GO
/****** Object:  Table [dbo].[CUSTOMERS]    Script Date: 18/09/2017 09:33:19 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMERS](
	[customer_id] [uniqueidentifier] NOT NULL,
	[cust_first_name] [nchar](10) NULL,
	[cust_last_name] [nchar](10) NULL,
	[cust_address] [nchar](10) NULL,
	[phone_numbers] [nchar](10) NULL,
	[nls_language] [nchar](10) NULL,
	[nls_territory] [nchar](10) NULL,
	[credit_limit] [nchar](10) NULL,
	[cust_email] [nchar](10) NULL,
	[account_mgr_id] [nchar](10) NULL,
	[cust_geo_location] [nchar](10) NULL,
	[date_of_birth] [nchar](10) NULL,
	[marital_status] [nchar](10) NULL,
	[gender] [nchar](10) NULL,
	[income_level] [nchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDER_ITEMS]    Script Date: 18/09/2017 09:33:19 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_ITEMS](
	[order_id] [uniqueidentifier] NOT NULL,
	[line_item_id] [uniqueidentifier] NOT NULL,
	[product_id] [uniqueidentifier] NOT NULL,
	[unit_price] [money] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 18/09/2017 09:33:19 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[order_id] [uniqueidentifier] NULL,
	[order_date] [date] NULL,
	[order_mode] [nchar](50) NULL,
	[customer_id] [uniqueidentifier] NULL,
	[order_status] [nchar](50) NULL,
	[order_total] [money] NULL,
	[sales_rep_id] [uniqueidentifier] NULL,
	[promotion_id] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
