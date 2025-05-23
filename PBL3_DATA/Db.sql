USE [master]
GO
/****** Object:  Database [bankManagement_Data]    Script Date: 4/28/2025 4:08:33 PM ******/
CREATE DATABASE [bankManagement_Data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bankManagement_Data', FILENAME = N'D:\App_SetUp\SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bankManagement_Data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bankManagement_Data_log', FILENAME = N'D:\App_SetUp\SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\bankManagement_Data_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bankManagement_Data] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bankManagement_Data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bankManagement_Data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bankManagement_Data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bankManagement_Data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bankManagement_Data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bankManagement_Data] SET ARITHABORT OFF 
GO
ALTER DATABASE [bankManagement_Data] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [bankManagement_Data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bankManagement_Data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bankManagement_Data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bankManagement_Data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bankManagement_Data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bankManagement_Data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bankManagement_Data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bankManagement_Data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bankManagement_Data] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bankManagement_Data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bankManagement_Data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bankManagement_Data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bankManagement_Data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bankManagement_Data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bankManagement_Data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bankManagement_Data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bankManagement_Data] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bankManagement_Data] SET  MULTI_USER 
GO
ALTER DATABASE [bankManagement_Data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bankManagement_Data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bankManagement_Data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bankManagement_Data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bankManagement_Data] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bankManagement_Data] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bankManagement_Data] SET QUERY_STORE = ON
GO
ALTER DATABASE [bankManagement_Data] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200)
GO
USE [bankManagement_Data]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/28/2025 4:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 4/28/2025 4:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[Sdt] [nvarchar](450) NOT NULL,
	[Hoten] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[Sdt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 4/28/2025 4:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[CreatedDate] [nvarchar](max) NOT NULL,
	[Balance] [float] NOT NULL,
	[IsFrozen1] [bit] NOT NULL,
	[IsFlagged] [bit] NOT NULL,
	[AccountType] [nvarchar](13) NOT NULL,
	[UserSdt] [nvarchar](450) NULL,
	[LoanLimit] [float] NULL,
	[LatePaymentInterestRate] [float] NULL,
	[CurrentLoan] [float] NULL,
	[MonthlyFee] [float] NULL,
	[TransactionFee] [float] NULL,
	[InterestRate] [real] NULL,
	[MinimumBalance] [float] NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 4/28/2025 4:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [decimal](20, 0) IDENTITY(1,1) NOT NULL,
	[TransactionDate] [nvarchar](max) NOT NULL,
	[TransactionType] [nvarchar](max) NOT NULL,
	[FromAccountId] [int] NOT NULL,
	[ToAccountId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/28/2025 4:08:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Sdt] [nvarchar](450) NOT NULL,
	[NS] [datetime2](7) NOT NULL,
	[Gender] [bit] NOT NULL,
	[Hoten] [nvarchar](max) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Sdt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250425014843_initial migration', N'9.0.4')
GO
INSERT [dbo].[Users] ([Sdt], [NS], [Gender], [Hoten], [PasswordHash]) VALUES (N'0703134392', CAST(N'2005-06-06T00:00:00.0000000' AS DateTime2), 1, N'Phan Nhan Vy', N'ptnv1234')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BankAccount_UserSdt]    Script Date: 4/28/2025 4:08:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_BankAccount_UserSdt] ON [dbo].[BankAccount]
(
	[UserSdt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_FromAccountId]    Script Date: 4/28/2025 4:08:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_FromAccountId] ON [dbo].[Transactions]
(
	[FromAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_ToAccountId]    Script Date: 4/28/2025 4:08:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_ToAccountId] ON [dbo].[Transactions]
(
	[ToAccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BankAccount]  WITH CHECK ADD  CONSTRAINT [FK_BankAccount_Users_UserSdt] FOREIGN KEY([UserSdt])
REFERENCES [dbo].[Users] ([Sdt])
GO
ALTER TABLE [dbo].[BankAccount] CHECK CONSTRAINT [FK_BankAccount_Users_UserSdt]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_BankAccount_FromAccountId] FOREIGN KEY([FromAccountId])
REFERENCES [dbo].[BankAccount] ([AccountId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_BankAccount_FromAccountId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_BankAccount_ToAccountId] FOREIGN KEY([ToAccountId])
REFERENCES [dbo].[BankAccount] ([AccountId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_BankAccount_ToAccountId]
GO
USE [master]
GO
ALTER DATABASE [bankManagement_Data] SET  READ_WRITE 
GO
