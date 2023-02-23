raiserror('Creating PerfumeStore database....',0,1)
SET NOCOUNT ON
GO

USE [master]
GO

CREATE DATABASE [PerfumeStore]
GO

USE [PerfumeStore]
GO

CREATE TABLE [dbo].[Account](
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[name] [varchar](50) NOT NULL,
	[address] [varchar](50) NOT NULL,
	[phone] [varchar](12) NOT NULL,
	[email] [varchar](30) NOT NULL,
	--password: default = 1
	[password] [char](64) NOT NULL default('6B86B273FF34FCE19D6B804EFF5A3F5747ADA4EAA22F1D49C01E52DDB7875B4B'),
	[enabled] [bit] NOT NULL default(1),
	[role] [varchar](255) NOT NULL
)
GO

CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[name] [varchar](50) NOT NULL
)
GO

CREATE TABLE [dbo].[Customer](
	[id] [int] PRIMARY KEY references [Account](id) NOT NULL,
	[category] varchar(50) NOT NULL CHECK([category] IN ('Titanium','Diamond','Platinum','Gold','Silver','Copper')),
	[deliveryAddress] [varchar](50) NOT NULL
)
GO

CREATE TABLE [dbo].[Employee](
	[id] [int] PRIMARY KEY references [Account](id) NOT NULL,
	[salary] [money] NOT NULL,
	[departmentId] [int] NOT NULL
)
GO


CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[orderHeaderId] [int] references OrderHeader(id) NOT NULL,
	[productId] [int] references Product(id) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[discount] [float] NOT NULL
)
GO

CREATE TABLE [dbo].[OrderHeader](
	[id] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[date] [datetime] NOT NULL,
	[status] [varchar](30) NULL,
	[customerId] [int] references Customer(id) NOT NULL,
	[employeeId] [int] references Employee(id) NOT NULL
)
GO

CREATE TABLE [dbo].[Product](
	[id] [INT] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[name] [NVARCHAR](100) NOT NULL,
	[description] [VARCHAR] NOT NULL,
	[price] [FLOAT] NOT NULL,
	[discount] [FLOAT] NOT NULL,
	[categoryId] [INT] REFERENCES Category(id) NOT NULL
)
GO

-- DROP DATABASE PerfumeStore

-- Insert Value Category
SET IDENTITY_INSERT [dbo].[Category] ON

-- Example INSERT [dbo].[Category] ([id], [name]) VALUES (1,'Louis Vuitton')
INSERT [dbo].[Category] ([id], [name]) VALUES (1,)
INSERT [dbo].[Category] ([id], [name]) VALUES (2,)
INSERT [dbo].[Category] ([id], [name]) VALUES (3,)
SET IDENTITY_INSERT [dbo].[Category] OFF

-- Insert Value Product
SET IDENTITY_INSERT [dbo].[Product] ON

-- Example INSERT [dbo].[Product] ([id], [description], [price], [discount], [categoryId]) VALUES (1, N'Name', N'Description', 204.99, 0.1, 1)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (2,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (3,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (4,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (5,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)
INSERT [dbo].[Product] ([id], [name] , [description], [price], [discount], [categoryId]) VALUES (1,,,,,)

SET IDENTITY_INSERT [dbo].[Product] OFF

SET IDENTITY_INSERT [dbo].[Account] ON 
-- INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role]) VALUES (1, N'Admin', N'9652 Los Angeles', N'0123456789', N'a@petstore.com', 'ROLE_ADMIN')
INSERT [dbo].[Account] ([id], [name], [address], [phone], [email], [role]) VALUES
(1, N'Admin', N'9652 Los Angeles', N'0123456789', N'a@petstore.com', 'ROLE_ADMIN'),
(2, N'Employee1', N'5747 Shirley Drive', N'1234567890', N'e1@petstore.com', 'ROLE_EMPLOYEE'),
(3, N'Employee2', N'3841 Silver Oaks Place', N'2345678901', N'e2@petstore.com', 'ROLE_EMPLOYEE'),
(4, N'Customer1', N'1873 Lion Circle', N'5678901234', N'c1@gmail.com','ROLE_CUSTOMER'),
(5, N'Customer2', N'5747 Shirley Drive', N'6789872314', N'c2@gmail.com', 'ROLE_CUSTOMER')
SET IDENTITY_INSERT [dbo].[Account] OFF

-- Insert Table Customer
-- Example INSERT [dbo].[Customer] ([id], [category], [deliveryAddress]) VALUES (4, 'Copper', N'1873 Lion Circle')
INSERT [dbo].[Customer] ([id], [category], [deliveryAddress]) VALUES (,,,)

-- Insert Table Employee
-- Example INSERT [dbo].[Employee] ([id], [salary], [departmentId]) VALUES (1, 1200, 1)
INSERT [dbo].[Employee] ([id], [salary], [departmentId]) VALUES 
(1, 1200, 1),
(2, 1000, 2),
(3, 800, 2)
GO

SET NOCOUNT OFF
raiserror('The PetStore database in now ready for use.',0,1)
GO