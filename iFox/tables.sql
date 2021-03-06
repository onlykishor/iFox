IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iFox].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [iFox] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [iFox] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [iFox] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [iFox] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [iFox] SET ARITHABORT OFF 
GO

ALTER DATABASE [iFox] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [iFox] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [iFox] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [iFox] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [iFox] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [iFox] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [iFox] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [iFox] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [iFox] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [iFox] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [iFox] SET  DISABLE_BROKER 
GO

ALTER DATABASE [iFox] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [iFox] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [iFox] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [iFox] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [iFox] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [iFox] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [iFox] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [iFox] SET  READ_WRITE 
GO

ALTER DATABASE [iFox] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [iFox] SET  MULTI_USER 
GO

ALTER DATABASE [iFox] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [iFox] SET DB_CHAINING OFF 
GO


USE [iFox]
GO

/****** Object:  Table [dbo].[address]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[address](
	[rowid] [int] NOT NULL,
	[name] [char](30) NOT NULL,
	[address] [char](30) NULL,
	[street] [char](30) NULL,
	[city] [char](30) NULL,
	[wphone] [char](20) NULL,
	[hphone] [char](20) NULL,
	[email] [char](50) NULL,
	[mobile] [char](40) NULL,
	[groupname] [nchar](30) NULL,
	[title] [nchar](6) NULL,
	[company] [nchar](30) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[admflds]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[admflds](
	[rowid] [int] NOT NULL,
	[checked] [bit] NOT NULL,
	[descri] [char](20) NULL,
	[fieldname] [char](15) NULL,
	[expression] [char](100) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[attendance]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[attendance](
	[rowid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[attdate] [datetime] NOT NULL,
	[admno] [int] NOT NULL,
	[class] [nchar](20) NULL,
	[status] [int] NOT NULL,
	[rsncode] [int] NULL,
	[userid] [int] NOT NULL,
	[entrydate] [datetime] NULL,
	[hr1] [bit] NULL,
	[hr2] [bit] NULL,
	[hr3] [bit] NULL,
	[hr4] [bit] NULL,
	[hr5] [bit] NULL,
	[hr6] [bit] NULL,
	[hr7] [bit] NULL,
	[hr8] [bit] NULL,
	[hr9] [bit] NULL,
	[ptotal] [int] NULL,
	[wtotal] [int] NULL,
	[studyyear] [int] NULL,
	[semester] [char](10) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[AttSubjects]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[AttSubjects](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[registerid] [int] NOT NULL,
	[class] [char](20) NOT NULL,
	[studyyear] [int] NULL,
	[semester] [char](10) NULL,
	[colid] [int] NULL,
	[colname] [char](10) NULL,
	[coldesc] [char](20) NULL,
	[colcode] [char](4) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[autosubjects]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[autosubjects](
	[rowid] [int] NOT NULL,
	[subject] [char](20) NULL,
	[shortname] [char](10) NULL,
	[maxmarks] [int] NULL,
	[minmarks] [float] NULL,
	[total] [bit] NULL,
	[selected] [bit] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[billdetails]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[billdetails](
	[rowid] [int] NOT NULL,
	[referer] [int] NOT NULL,
	[billno] [int] NOT NULL,
	[itemid] [int] NULL,
	[productid] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[rate] [float] NOT NULL,
	[total] [float] NOT NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[bills]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[bills](
	[billno] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[name] [char](40) NULL,
	[total] [float] NOT NULL,
	[discount] [float] NULL,
	[amount] [float] NOT NULL,
	[cons] [float] NULL,
	[vat] [float] NULL,
	[admno] [int] NULL,
	[registerid] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[billtemp]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[billtemp](
	[rowid] [int] NOT NULL,
	[billno] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[mfr] [char](5) NULL,
	[code] [char](10) NULL,
	[packing] [char](6) NULL,
	[batchno] [char](10) NULL,
	[expirydate] [datetime] NULL,
	[qty] [int] NOT NULL,
	[free] [int] NULL,
	[rate] [float] NOT NULL,
	[mrp] [float] NULL,
	[total] [float] NOT NULL,
	[referer] [int] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[books]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[books](
	[bookid] [int] NOT NULL,
	[subjectcode] [char](3) NULL,
	[author] [char](100) NULL,
	[title] [char](100) NULL,
	[publisher] [text] NULL,
	[pur_date] [datetime] NULL,
	[price] [float] NULL,
	[bookinfo] [text] NULL,
	[grants] [char](20) NULL,
	[classification] [char](10) NULL,
	[isbn] [char](15) NULL,
	[discarded] [bit] NULL,
	[discdate] [datetime] NULL,
	[disctype] [tinyint] NULL,
	[billno] [char](5) NULL,
	[remarks] [char](30) NULL,
	[status] [bit] NULL,
	[source] [char](25) NULL,
	[invno] [char](6) NULL,
	[pubyear] [int] NULL,
	[edition] [nchar](10) NULL,
	[discount] [nchar](10) NULL,
	[pages] [nchar](20) NULL,
	[author2] [char](100) NULL,
	[supplier] [char](50) NULL,
	[invdate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[cgrades]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[cgrades](
	[rowid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[range1] [float] NULL,
	[range2] [float] NULL,
	[grade] [char](15) NULL,
	[fail] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[classes]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[classes](
	[classid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[sequence] [int] NULL,
	[classname] [char](5) NULL,
	[subjects] [char](100) NULL,
	[shortname] [char](10) NOT NULL,
	[duration] [int] NULL,
	[active] [tinyint] NULL,
	[description] [char](100) NULL,
	[rowid] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[daybook]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[daybook](
	[rowid] [int] NOT NULL,
	[date] [datetime] NULL,
	[headid] [int] NULL,
	[alias] [char](10) NULL,
	[narration] [char](80) NULL,
	[debit] [float] NULL,
	[credit] [float] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[documents]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[documents](
	[docid] [int] NOT NULL,
	[context] [nchar](30) NULL,
	[groupname] [nchar](50) NULL,
	[description] [nchar](150) NULL,
	[filename] [nchar](100) NULL,
	[filetype] [nchar](6) NULL,
	[filedata] [varbinary](max) NOT NULL,
	[fdatetime] [datetime] NULL,
	[filesize] [float] NULL,
	[userid] [int] NULL,
	[shared] [bit] NULL,
	[lastmod] [datetime] NULL,
	[rootid] [int] NULL,
	[admno] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[duedates]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[duedates](
	[rowid] [int] NOT NULL,
	[feeid] [int] NOT NULL,
	[duedate] [datetime] NULL,
	[amount] [float] NULL,
	[class] [char](20) NULL,
	[status] [char](12) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[employee]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[employee](
	[empid] [int] NOT NULL,
	[sno] [int] NULL,
	[groupid] [int] NOT NULL,
	[name] [char](25) NOT NULL,
	[dob] [datetime] NULL,
	[address] [text] NULL,
	[phones] [char](10) NULL,
	[mobile] [char](10) NULL,
	[qualification] [text] NULL,
	[experience] [text] NULL,
	[doj] [datetime] NULL,
	[desig] [char](15) NULL,
	[dept] [char](15) NULL,
	[type] [tinyint] NULL,
	[parttime] [tinyint] NULL,
	[accnum] [char](15) NULL,
	[pfnumber] [char](10) NULL,
	[pan] [char](15) NULL,
	[scale] [tinyint] NULL,
	[basic] [float] NULL,
	[fpi] [float] NULL,
	[sp] [float] NULL,
	[da] [float] NULL,
	[hra] [float] NULL,
	[others] [float] NULL,
	[gross] [float] NULL,
	[pfund] [float] NULL,
	[pfloan] [float] NULL,
	[lic] [float] NULL,
	[itax] [float] NULL,
	[ptax] [float] NULL,
	[gslis] [float] NULL,
	[other] [float] NULL,
	[total] [float] NULL,
	[ppay] [float] NULL,
	[allowance] [float] NULL,
	[epf] [float] NULL,
	[mgmt] [float] NULL,
	[loan1] [float] NULL,
	[loan2] [float] NULL,
	[netsal] [float] NULL,
	[cleaves] [float] NULL,
	[eleaves] [float] NULL,
	[sleaves] [float] NULL,
	[oleaves] [float] NULL,
	[dropped] [bit] NULL,
	[photo] [image] NULL,
	[incrdate] [char](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[emptrans]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[emptrans](
	[slipnum] [int] NOT NULL,
	[sno] [int] NULL,
	[empid] [int] NOT NULL,
	[groupid] [int] NOT NULL,
	[month] [char](10) NOT NULL,
	[wdays] [int] NULL,
	[paydate] [datetime] NULL,
	[amount] [float] NULL,
	[basic] [float] NULL,
	[fpi] [float] NULL,
	[sp] [float] NULL,
	[da] [float] NULL,
	[hra] [float] NULL,
	[others] [float] NULL,
	[gross] [float] NULL,
	[pfund] [float] NULL,
	[pfloan] [float] NULL,
	[lic] [float] NULL,
	[itax] [float] NULL,
	[ptax] [float] NULL,
	[gslis] [float] NULL,
	[other] [float] NULL,
	[total] [float] NULL,
	[ppay] [float] NULL,
	[allowance] [float] NULL,
	[epf] [float] NULL,
	[mgmt] [float] NULL,
	[loan1] [float] NULL,
	[loan2] [float] NULL,
	[netsalary] [float] NULL,
	[particulars] [char](60) NULL,
	[tchtrust] [float] NULL,
	[tchassn] [float] NULL,
	[ntstrust] [float] NULL,
	[ntsassn] [float] NULL,
	[bankloan] [float] NULL,
	[totalded] [float] NULL,
	[salarybal] [float] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[enq]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[enq](
	[enqno] [int] NOT NULL,
	[enqdate] [datetime] NOT NULL,
	[name] [char](30) NOT NULL,
	[sex] [char](10) NULL,
	[dob] [datetime] NULL,
	[father] [char](30) NULL,
	[occupation] [char](20) NULL,
	[mother] [char](10) NULL,
	[admtoclass] [char](12) NULL,
	[preclass] [char](12) NULL,
	[preschool] [char](30) NULL,
	[paddress] [char](30) NULL,
	[pstreet] [char](30) NULL,
	[parea] [char](30) NULL,
	[caddress] [char](30) NULL,
	[cstreet] [char](30) NULL,
	[carea] [char](30) NULL,
	[phones] [char](30) NULL,
	[idmark1] [char](30) NULL,
	[idmark2] [char](30) NULL,
	[religion] [char](15) NULL,
	[caste] [char](15) NULL,
	[class] [char](20) NULL,
	[remarks] [text] NULL,
	[coordinator] [char](20) NULL,
	[application] [bit] NOT NULL,
	[admtest] [bit] NOT NULL,
	[admission] [bit] NOT NULL,
	[applno] [int] NULL,
	[appldate] [datetime] NULL,
	[applamount] [float] NULL,
	[examname] [char](20) NULL,
	[examdate] [datetime] NULL,
	[examtoclass] [char](12) NULL,
	[marks] [int] NULL,
	[rank] [int] NULL,
	[concession] [int] NULL,
	[status] [char](15) NULL,
	[reexamdate] [datetime] NULL,
	[comments] [char](50) NULL,
	[registerid] [int] NULL,
	[admno] [int] NULL,
	[admdate] [datetime] NULL,
	[admgivenby] [char](10) NULL,
	[admfee] [float] NULL,
	[sent] [bit] NOT NULL,
	[receipt] [int] NULL,
	[mobile] [nchar](15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[eventlog]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[eventlog](
	[logid] [int] IDENTITY(1,1) NOT NULL,
	[logdate] [datetime] NOT NULL,
	[userid] [int] NOT NULL,
	[logaction] [char](10) NOT NULL,
	[logdescr] [char](150) NULL,
	[module] [char](100) NULL,
	[registerid] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[examgroups]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[examgroups](
	[groupid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[name] [char](20) NULL,
	[shortname] [char](10) NULL,
	[grouppercent] [float] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[exams]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[exams](
	[exam_id] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[exam] [char](20) NOT NULL,
	[description] [char](70) NULL,
	[shortname] [char](5) NULL,
	[groupid] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[fbooks]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fbooks](
	[bookid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[name] [char](20) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[fee]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[fee](
	[rowid] [int] NOT NULL,
	[bookid] [int] NOT NULL,
	[receipt] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[descri] [char](100) NULL,
	[admno] [int] NOT NULL,
	[class] [char](20) NULL,
	[amount] [float] NOT NULL,
	[concession] [float] NULL,
	[netamount] [float] NOT NULL,
	[dddetails] [char](15) NULL,
	[paid] [bit] NOT NULL,
	[paidamount] [float] NULL,
	[balance] [float] NULL,
	[userid] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[feeitems]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[feeitems](
	[rowid] [int] NOT NULL,
	[bookid] [int] NOT NULL,
	[receipt] [int] NOT NULL,
	[feeid] [int] NOT NULL,
	[name] [char](25) NOT NULL,
	[amount] [float] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[feetemp]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[feetemp](
	[feeid] [int] NOT NULL,
	[name] [char](50) NOT NULL,
	[amount] [float] NULL,
	[checked] [bit] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[feetemplatedetail]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[feetemplatedetail](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[templateid] [int] NOT NULL,
	[sequence] [int] NOT NULL,
	[feeid] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[duedate] [datetime] NULL,
	[remarks] [char](30) NULL,
	[selected] [bit] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[feetemplates]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[feetemplates](
	[templateid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[templatename] [char](50) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[feetypes]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[feetypes](
	[feeid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[name] [char](30) NOT NULL,
	[admfee] [bit] NOT NULL,
	[nodues] [bit] NOT NULL,
	[amount] [int] NULL,
	[selected] [int] NULL,
	[shortname] [char](10) NULL,
	[headid] [int] NULL,
	[groupid] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[filters]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[filters](
	[filterid] [int] NOT NULL,
	[name] [char](60) NOT NULL,
	[recordfilter] [char](100) NOT NULL,
	[disporder] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[grades]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[grades](
	[rowid] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[class] [char](20) NULL,
	[range1] [int] NULL,
	[range2] [int] NULL,
	[grade] [char](5) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[groups]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[groups](
	[groupid] [int] NOT NULL,
	[name] [char](20) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[heads]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[heads](
	[headid] [int] NOT NULL,
	[rootid] [int] NULL,
	[alias] [char](10) NOT NULL,
	[name] [char](40) NOT NULL,
	[type] [char](10) NULL,
	[balance] [float] NULL,
	[sign] [char](2) NULL,
	[base] [bit] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[holidays]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[holidays](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[registerid] [int] NOT NULL,
	[holidaydate] [datetime] NOT NULL,
	[description] [char](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[invoice]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[invoice](
	[invoiceid] [int] NOT NULL,
	[supplierid] [int] NOT NULL,
	[invoiceno] [char](10) NULL,
	[date] [datetime] NULL,
	[total] [float] NULL,
	[discount] [float] NULL,
	[amount] [float] NULL,
	[sno] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[invoicedetails]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[invoicedetails](
	[rowid] [int] NOT NULL,
	[invoiceid] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[mfr] [char](5) NULL,
	[batchno] [char](10) NULL,
	[expirydate] [datetime] NULL,
	[qty] [int] NOT NULL,
	[free] [int] NULL,
	[rate] [float] NOT NULL,
	[mrp] [float] NOT NULL,
	[total] [float] NULL,
	[sold] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[issues]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[issues](
	[issueid] [int] NOT NULL,
	[issuedate] [datetime] NOT NULL,
	[admno] [int] NULL,
	[card] [tinyint] NULL,
	[bookid] [int] NULL,
	[returned] [bit] NULL,
	[retdate] [datetime] NULL,
	[fine] [float] NULL,
	[remarks] [char](10) NULL,
	[registerid] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[marks]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[marks](
	[rowid] [int] NOT NULL,
	[admno] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[class] [char](20) NULL,
	[rollno] [int] NULL,
	[col1] [char](5) NULL,
	[col2] [char](5) NULL,
	[col3] [char](5) NULL,
	[col4] [char](5) NULL,
	[col5] [char](5) NULL,
	[col6] [char](5) NULL,
	[col7] [char](5) NULL,
	[col8] [char](5) NULL,
	[col9] [char](5) NULL,
	[col10] [char](5) NULL,
	[col11] [char](5) NULL,
	[col12] [char](5) NULL,
	[col13] [char](5) NULL,
	[col14] [char](5) NULL,
	[col15] [char](5) NULL,
	[col16] [char](5) NULL,
	[col17] [char](5) NULL,
	[col18] [char](5) NULL,
	[col19] [char](5) NULL,
	[col20] [char](5) NULL,
	[total] [float] NULL,
	[average] [float] NULL,
	[rank] [int] NULL,
	[grade] [char](3) NULL,
	[percentage] [float] NULL,
	[status] [char](6) NULL,
	[remarks] [char](50) NULL,
	[checked] [bit] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[modules]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[modules](
	[rowid] [int] NOT NULL,
	[userid] [int] NULL,
	[modcode] [char](5) NULL,
	[modname] [char](40) NULL,
	[canopen] [bit] NULL,
	[canadd] [bit] NULL,
	[canedit] [bit] NULL,
	[candelete] [bit] NULL,
	[canview] [bit] NULL,
	[cansms] [bit] NULL,
	[vouchlimit] [float] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[msgcontrol]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[msgcontrol](
	[srvid] [tinyint] NOT NULL,
	[srvstatus] [nchar](10) NOT NULL,
	[srvmessage] [nchar](100) NULL,
	[comport] [nchar](10) NULL,
	[baud] [char](20) NULL,
	[smspause] [int] NULL,
	[sendoption] [nchar](10) NULL,
	[provider] [nchar](100) NULL,
	[username] [nchar](30) NULL,
	[passwd] [nchar](30) NULL,
	[serviceurl] [nchar](200) NULL,
	[balanceurl] [char](200) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[msgoutbox]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[msgoutbox](
	[msgid] [int] NOT NULL,
	[msgdate] [datetime] NOT NULL,
	[recipient] [nchar](80) NOT NULL,
	[message] [nchar](200) NOT NULL,
	[status] [nchar](10) NOT NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[msgsent]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[msgsent](
	[msgid] [int] IDENTITY(1,1) NOT NULL,
	[msgdate] [datetime] NOT NULL,
	[recipient] [nchar](80) NOT NULL,
	[message] [nchar](200) NOT NULL,
	[status] [nchar](10) NOT NULL,
	[sentdate] [datetime] NULL,
	[retries] [tinyint] NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[notes]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[notes](
	[noteid] [int] NOT NULL,
	[entrydate] [datetime] NOT NULL,
	[userid] [int] NULL,
	[note] [varchar](max) NULL,
	[context] [nchar](10) NOT NULL,
	[lastmod] [datetime] NOT NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[options]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[options](
	[rowid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[schoolname] [char](40) NULL,
	[address] [char](60) NULL,
	[phones] [char](60) NULL,
	[title1] [char](60) NULL,
	[title2] [char](60) NULL,
	[title3] [char](120) NULL,
	[feefoot1] [char](60) NULL,
	[feefoot2] [char](60) NULL,
	[examfoot1] [char](150) NULL,
	[examfoot2] [char](150) NULL,
	[skipranks] [int] NULL,
	[includeabsent] [int] NULL,
	[includefailure] [int] NULL,
	[ranktofail] [int] NULL,
	[failstring] [char](1) NULL,
	[reportpause] [int] NULL,
	[autoremarks] [int] NULL,
	[preprinted] [int] NULL,
	[grading] [int] NULL,
	[printmode] [int] NULL,
	[rep1head] [text] NULL,
	[rep1foot] [text] NULL,
	[rep2head] [text] NULL,
	[rep2foot] [text] NULL,
	[rep3head] [text] NULL,
	[rep3foot] [text] NULL,
	[rep4head] [text] NULL,
	[rep4foot] [text] NULL,
	[rep5head] [text] NULL,
	[rep5foot] [text] NULL,
	[rep6head] [text] NULL,
	[rep6foot] [text] NULL,
	[rep7head] [text] NULL,
	[rep7foot] [text] NULL,
	[rep8head] [text] NULL,
	[rep8foot] [text] NULL,
	[rep9head] [text] NULL,
	[rep9foot] [text] NULL,
	[rep10head] [text] NULL,
	[rep10foot] [text] NULL,
	[rep11head] [text] NULL,
	[rep11foot] [text] NULL,
	[rep12head] [text] NULL,
	[rep12foot] [text] NULL,
	[rep13head] [text] NULL,
	[rep13foot] [text] NULL,
	[rep14head] [text] NULL,
	[rep14foot] [text] NULL,
	[printgrade] [int] NULL,
	[gradetofail] [int] NULL,
	[letterhead] [text] NULL,
	[letterfoot] [text] NULL,
	[compressmode] [int] NULL,
	[printranks] [int] NULL,
	[repc1head] [text] NULL,
	[repc1foot] [text] NULL,
	[billheader] [text] NULL,
	[billfooter] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[preturn_details]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[preturn_details](
	[rowid] [int] NOT NULL,
	[retno] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[free] [int] NULL,
	[rate] [float] NULL,
	[total] [float] NULL,
	[referer] [int] NOT NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[preturns]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[preturns](
	[retno] [int] NOT NULL,
	[supplierid] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[narration] [char](50) NULL,
	[total] [float] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[products]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[products](
	[productid] [int] NOT NULL,
	[groupid] [int] NULL,
	[productcode] [char](10) NULL,
	[name] [char](25) NOT NULL,
	[packing] [char](6) NULL,
	[price] [numeric](5, 2) NULL,
	[opening] [int] NULL,
	[sale] [int] NULL,
	[balance] [int] NULL,
	[dropped] [bit] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[reason]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[reason](
	[rowid] [int] NOT NULL,
	[reason] [char](50) NOT NULL,
	[module] [char](30) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[register]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[register](
	[rowid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[admno] [int] NOT NULL,
	[name] [char](40) NULL,
	[sex] [char](6) NOT NULL,
	[dob] [datetime] NULL,
	[father] [char](40) NULL,
	[occupation] [char](20) NULL,
	[mother] [char](30) NULL,
	[paddress] [char](30) NULL,
	[pstreet] [char](30) NULL,
	[parea] [char](30) NULL,
	[caddress] [char](30) NULL,
	[cstreet] [char](30) NULL,
	[carea] [char](30) NULL,
	[phones] [char](30) NULL,
	[admittedin] [char](10) NULL,
	[tc] [bit] NULL,
	[bc] [bit] NULL,
	[pr] [bit] NULL,
	[idmark1] [char](100) NULL,
	[idmark2] [char](100) NULL,
	[religion] [char](10) NULL,
	[caste] [char](20) NULL,
	[class] [char](20) NULL,
	[doa] [datetime] NULL,
	[discontinu] [bit] NULL,
	[tcnum] [int] NULL,
	[tcdate] [datetime] NULL,
	[status] [char](20) NULL,
	[selected] [bit] NULL,
	[photo] [image] NULL,
	[transport] [int] NULL,
	[prevschool] [char](100) NULL,
	[ssid] [char](16) NULL,
	[address] [text] NULL,
	[dueamount] [float] NOT NULL,
	[stopid] [int] NULL,
	[concession] [float] NULL,
	[notes] [text] NULL,
	[shortname] [char](15) NULL,
	[email] [char](80) NULL,
	[mobile] [char](60) NULL,
	[feetype] [tinyint] NULL,
	[subcaste] [char](20) NULL,
	[studenttype] [char](20) NULL,
	[hosteltype] [char](20) NULL,
	[sscnum] [char](20) NULL,
	[sscyear] [char](4) NULL,
	[sscmarks] [int] NULL,
	[sscdivision] [char](10) NULL,
	[internum] [char](20) NULL,
	[interyear] [char](4) NULL,
	[intermarks] [int] NULL,
	[interdivision] [char](10) NULL,
	[sscmemo] [bit] NULL,
	[intermemo] [bit] NULL,
	[ccstudycert] [bit] NULL,
	[castecert] [bit] NULL,
	[incomecert] [bit] NULL,
	[eamcetrankcard] [bit] NULL,
	[eamcethtkt] [bit] NULL,
	[regdnum] [char](30) NULL,
	[sscpercent] [float] NULL,
	[interpercent] [float] NULL,
	[house] [char](10) NULL,
	[activity] [char](20) NULL,
	[iitcoaching] [char](1) NULL,
	[rollnum] [int] NULL,
	[optional] [char](10) NULL,
	[studyyear] [int] NULL,
	[stdue] [float] NULL,
	[pmdue] [float] NULL,
	[newadm] [bit] NULL,
	[semester] [char](10) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[registers]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[registers](
	[registerid] [int] NOT NULL,
	[name] [char](60) NULL,
	[lastused] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[rmodels]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[rmodels](
	[model] [int] NOT NULL,
	[name] [char](30) NULL,
	[header] [text] NULL,
	[footer] [text] NULL,
	[bodywidth] [char](10) NULL,
	[serial] [bit] NOT NULL,
	[numwords] [bit] NOT NULL,
	[selected] [bit] NOT NULL,
	[repname] [char](100) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[routedates]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[routedates](
	[rowid] [int] NOT NULL,
	[routeid] [int] NOT NULL,
	[duedate] [datetime] NOT NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[routemaster]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[routemaster](
	[routeid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[name] [char](20) NOT NULL,
	[vehicle] [char](30) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[routes]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[routes](
	[rowid] [int] NULL,
	[stopid] [int] NOT NULL,
	[routeid] [int] NOT NULL,
	[name] [char](30) NOT NULL,
	[termamount] [float] NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[settings]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[settings](
	[pkey] [int] NOT NULL,
	[settingname] [char](100) NOT NULL,
	[settingvalue] [char](200) NULL,
	[description] [nchar](200) NOT NULL,
	[useraccess] [char](1) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[sreturn_details]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sreturn_details](
	[rowid] [int] NOT NULL,
	[retno] [int] NOT NULL,
	[productid] [int] NOT NULL,
	[qty] [int] NOT NULL,
	[rate] [float] NOT NULL,
	[amount] [float] NOT NULL,
	[referer] [int] NOT NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[sreturns]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[sreturns](
	[retno] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[amount] [float] NOT NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[studentfee]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[studentfee](
	[rowid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[admno] [int] NOT NULL,
	[feeid] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[duedate] [datetime] NULL,
	[remarks] [nchar](30) NULL,
	[addnlfee] [tinyint] NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[studentfeetemp]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[studentfeetemp](
	[rowid] [int] NOT NULL,
	[registerid] [int] NOT NULL,
	[admno] [int] NOT NULL,
	[feeid] [int] NOT NULL,
	[amount] [float] NOT NULL,
	[duedate] [datetime] NULL,
	[remarks] [nchar](30) NULL
) ON [PRIMARY]

GO

USE [iFox]
GO

/****** Object:  Table [dbo].[subjects]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[subjects](
	[rowid] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[class] [char](20) NULL,
	[colname] [char](5) NOT NULL,
	[subject] [char](20) NOT NULL,
	[shortname] [char](10) NOT NULL,
	[maxmarks] [int] NOT NULL,
	[minmarks] [float] NOT NULL,
	[total] [bit] NOT NULL,
	[teacher] [char](20) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[suppliers]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[suppliers](
	[supplierid] [int] NOT NULL,
	[supplier] [char](25) NOT NULL,
	[address] [text] NULL,
	[contactname] [char](30) NULL,
	[phone] [char](10) NULL,
	[tin] [char](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[SysReports]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[SysReports](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[registerid] [int] NOT NULL,
	[reporttype] [char](10) NOT NULL,
	[reportname] [char](30) NULL,
	[reportfile] [char](200) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[Table1]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Table1](
	[name] [varchar](50) NULL,
	[mobile] [varchar](50) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[tc]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tc](
	[tcnum] [int] NOT NULL,
	[tcdate] [datetime] NULL,
	[tcappldate] [datetime] NULL,
	[admno] [int] NULL,
	[name] [char](35) NULL,
	[father] [char](30) NULL,
	[dob] [datetime] NULL,
	[religion] [char](10) NULL,
	[caste] [char](5) NULL,
	[subcaste] [char](20) NULL,
	[leavingclass] [char](10) NULL,
	[subjects] [char](45) NULL,
	[medium] [char](7) NULL,
	[doa] [datetime] NULL,
	[yearjoined] [int] NULL,
	[class] [char](10) NULL,
	[leavingdate] [datetime] NULL,
	[leavingreason] [char](35) NULL,
	[idmark1] [char](45) NULL,
	[idmark2] [char](45) NULL,
	[tctype] [tinyint] NULL,
	[selected] [bit] NULL,
	[qualified] [char](60) NULL,
	[studyyear] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[templates]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[templates](
	[templateid] [int] IDENTITY(1,1) NOT NULL,
	[context] [char](30) NOT NULL,
	[active] [bit] NOT NULL,
	[name] [char](50) NOT NULL,
	[description] [char](100) NOT NULL,
	[message] [char](200) NOT NULL,
	[userid] [int] NOT NULL,
	[createdon] [datetime] NOT NULL,
	[lastmod] [datetime] NULL,
	[lastmoduser] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[users]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[users](
	[userid] [int] NOT NULL,
	[name] [char](20) NOT NULL,
	[password] [char](10) NULL,
	[disabled] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[voucher]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[voucher](
	[vrno] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[headid] [int] NOT NULL,
	[alias] [char](10) NULL,
	[narration] [char](250) NULL,
	[debit] [float] NULL,
	[credit] [float] NULL,
	[registerid] [int] NULL,
	[rowid] [int] NULL,
	[userid] [int] NULL,
	[lastmod] [datetime] NULL,
	[approveid] [int] NULL,
	[approvedate] [datetime] NULL,
	[remarks] [varchar](max) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

USE [iFox]
GO

/****** Object:  Table [dbo].[workingdays]    Script Date: 03/02/2012 11:49:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[workingdays](
	[rowid] [int] IDENTITY(1,1) NOT NULL,
	[registerid] [tinyint] NOT NULL,
	[class] [char](20) NOT NULL,
	[jan] [tinyint] NULL,
	[feb] [tinyint] NULL,
	[mar] [tinyint] NULL,
	[apr] [tinyint] NULL,
	[may] [tinyint] NULL,
	[jun] [tinyint] NULL,
	[jul] [tinyint] NULL,
	[aug] [tinyint] NULL,
	[sep] [tinyint] NULL,
	[oct] [tinyint] NULL,
	[nov] [tinyint] NULL,
	[dec] [tinyint] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[autosubjects] ADD  CONSTRAINT [DF_autosubjects_total]  DEFAULT (1) FOR [total]
GO

ALTER TABLE [dbo].[autosubjects] ADD  CONSTRAINT [DF_autosubjects_selected]  DEFAULT (0) FOR [selected]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_referer]  DEFAULT ((0)) FOR [referer]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_billno]  DEFAULT ((0)) FOR [billno]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_productid]  DEFAULT ((0)) FOR [productid]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_qty]  DEFAULT ((0)) FOR [qty]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_rate]  DEFAULT ((0)) FOR [rate]
GO

ALTER TABLE [dbo].[billdetails] ADD  CONSTRAINT [DF_billdetails_total]  DEFAULT ((0)) FOR [total]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_name]  DEFAULT ('') FOR [name]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_total]  DEFAULT ((0)) FOR [total]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_discount]  DEFAULT ((0)) FOR [discount]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_amount]  DEFAULT ((0)) FOR [amount]
GO

ALTER TABLE [dbo].[bills] ADD  CONSTRAINT [DF_bills_cons]  DEFAULT ((0)) FOR [cons]
GO

ALTER TABLE [dbo].[feetemp] ADD  CONSTRAINT [DF_feetemp_amount]  DEFAULT (0) FOR [amount]
GO

ALTER TABLE [dbo].[feetemp] ADD  CONSTRAINT [DF_feetemp_checked]  DEFAULT (0) FOR [checked]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_batchno]  DEFAULT ('') FOR [batchno]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_qty]  DEFAULT ((0)) FOR [qty]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_free]  DEFAULT ((0)) FOR [free]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_rate]  DEFAULT ((0)) FOR [rate]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_mrp]  DEFAULT ((0)) FOR [mrp]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_total]  DEFAULT ((0)) FOR [total]
GO

ALTER TABLE [dbo].[invoicedetails] ADD  CONSTRAINT [DF_invoicedetails_sold]  DEFAULT ((0)) FOR [sold]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [admno]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [card]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [bookid]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [returned]
GO

ALTER TABLE [dbo].[issues] ADD  DEFAULT ((0)) FOR [fine]
GO

ALTER TABLE [dbo].[products] ADD  CONSTRAINT [DF_products_dropped]  DEFAULT ((0)) FOR [dropped]
GO

ALTER TABLE [dbo].[register] ADD  CONSTRAINT [DF_register_selected]  DEFAULT (0) FOR [selected]
GO

ALTER TABLE [dbo].[register] ADD  CONSTRAINT [DF_register_dueamount]  DEFAULT (0) FOR [dueamount]
GO

ALTER TABLE [dbo].[register] ADD  CONSTRAINT [DF_register_routeid]  DEFAULT (0) FOR [stopid]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_father]  DEFAULT ('') FOR [father]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_religion]  DEFAULT (' ') FOR [religion]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_caste]  DEFAULT ('') FOR [caste]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_subcaste]  DEFAULT ('') FOR [subcaste]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_leavingclass]  DEFAULT ('') FOR [leavingclass]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_subjects]  DEFAULT ('') FOR [subjects]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_medium]  DEFAULT ('') FOR [medium]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_class]  DEFAULT ('') FOR [class]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_leavingreason]  DEFAULT ('') FOR [leavingreason]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_idmark1]  DEFAULT ('') FOR [idmark1]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_idmark2]  DEFAULT ('') FOR [idmark2]
GO

ALTER TABLE [dbo].[tc] ADD  CONSTRAINT [DF_tc_qualified]  DEFAULT ('') FOR [qualified]
GO


CREATE TRIGGER [dbo].[trUpdMoveSentToOutBox]
ON [dbo].[msgoutbox]
AFTER UPDATE
AS

SET NOCOUNT ON
INSERT INTO
	msgsent
	(msgdate, recipient, message, status, sentdate, retries)
SELECT msgdate, recipient, message, status, getdate(), 1
  FROM inserted
 WHERE status = 'SENT'

DELETE FROM msgoutbox 
 WHERE msgid IN (SELECT msgid 
                   FROM inserted 
                  WHERE status = 'SENT')
GO
