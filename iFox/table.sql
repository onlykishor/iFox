USE [iFox]
GO
/****** Object:  Table [dbo].[address]    Script Date: 07/08/2009 23:34:05 ******/
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
	[mobile] [char](40) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[admflds]    Script Date: 07/08/2009 23:34:05 ******/
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
	[fieldname] [char](15) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[autosubjects]    Script Date: 07/08/2009 23:34:05 ******/
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
	[total] [bit] NULL CONSTRAINT [DF_autosubjects_total]  DEFAULT (1),
	[selected] [bit] NULL CONSTRAINT [DF_autosubjects_selected]  DEFAULT (0)
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[books]    Script Date: 07/08/2009 23:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[books](
	[bookid] [int] NOT NULL,
	[subjectcode] [char](3) NULL,
	[author] [char](35) NULL,
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
	[invno] [char](6) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cgrades]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[daybook]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[duedates]    Script Date: 07/08/2009 23:34:05 ******/
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
	[class] [char](12) NOT NULL,
	[status] [char](12) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[enq]    Script Date: 07/08/2009 23:34:05 ******/
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
	[class] [char](12) NULL,
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
	[receipt] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[eventlog]    Script Date: 07/08/2009 23:34:05 ******/
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
	[logdescr] [char](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[examgroups]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[exams]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[fbooks]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[fee]    Script Date: 07/08/2009 23:34:05 ******/
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
	[class] [char](12) NOT NULL,
	[amount] [float] NOT NULL,
	[concession] [float] NULL,
	[netamount] [float] NOT NULL,
	[dddetails] [char](15) NULL,
	[paid] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feeitems]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[feetemp]    Script Date: 07/08/2009 23:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[feetemp](
	[feeid] [int] NOT NULL,
	[name] [char](50) NOT NULL,
	[amount] [float] NULL CONSTRAINT [DF_feetemp_amount]  DEFAULT (0),
	[checked] [bit] NULL CONSTRAINT [DF_feetemp_checked]  DEFAULT (0)
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[feetypes]    Script Date: 07/08/2009 23:34:05 ******/
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
	[shortname] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[filters]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[grades]    Script Date: 07/08/2009 23:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grades](
	[rowid] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[class] [char](10) NOT NULL,
	[range1] [int] NULL,
	[range2] [int] NULL,
	[grade] [char](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[heads]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[issues]    Script Date: 07/08/2009 23:34:05 ******/
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
	[remarks] [char](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[marks]    Script Date: 07/08/2009 23:34:05 ******/
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
	[class] [char](10) NOT NULL,
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
/****** Object:  Table [dbo].[modules]    Script Date: 07/08/2009 23:34:05 ******/
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
	[canview] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[options]    Script Date: 07/08/2009 23:34:05 ******/
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
	[repc1foot] [text] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[register]    Script Date: 07/08/2009 23:34:05 ******/
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
	[name] [char](30) NOT NULL,
	[sex] [char](6) NOT NULL,
	[dob] [datetime] NULL,
	[father] [char](30) NULL,
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
	[idmark1] [char](30) NULL,
	[idmark2] [char](30) NULL,
	[religion] [char](10) NULL,
	[caste] [char](20) NULL,
	[class] [char](10) NOT NULL,
	[doa] [datetime] NULL,
	[discontinu] [bit] NULL,
	[tcnum] [int] NULL,
	[tcdate] [datetime] NULL,
	[status] [char](20) NULL,
	[selected] [bit] NULL CONSTRAINT [DF_register_selected]  DEFAULT (0),
	[photo] [image] NULL,
	[transport] [int] NULL,
	[prevschool] [char](25) NULL,
	[ssid] [char](16) NULL,
	[address] [text] NULL,
	[dueamount] [float] NOT NULL CONSTRAINT [DF_register_dueamount]  DEFAULT (0),
	[stopid] [int] NULL CONSTRAINT [DF_register_routeid]  DEFAULT (0),
	[concession] [float] NOT NULL CONSTRAINT [DF_register_concession]  DEFAULT (0),
	[notes] [text] NULL,
	[shortname] [char](15) NULL,
	[email] [char](80) NULL,
	[mobile] [char](60) NULL,
	[picture] [varbinary](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[registers]    Script Date: 07/08/2009 23:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registers](
	[registerid] [int] NOT NULL,
	[name] [char](60) NOT NULL,
	[lastused] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rmodels]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[routedates]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[routemaster]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[routes]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[settings]    Script Date: 07/08/2009 23:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[settings](
	[pkey] [int] NOT NULL,
	[settingname] [char](100) NOT NULL,
	[settingvalue] [char](50) NOT NULL,
	[description] [nchar](200) NOT NULL CONSTRAINT [DF_settings_description]  DEFAULT (''),
	[useraccess] [char](1) NOT NULL CONSTRAINT [DF_settings_useraccess]  DEFAULT ('Y')
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[subjects]    Script Date: 07/08/2009 23:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subjects](
	[rowid] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[class] [char](10) NOT NULL,
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
/****** Object:  Table [dbo].[test]    Script Date: 07/08/2009 23:34:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[test](
	[picture] [varbinary](max) NULL,
	[id] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 07/08/2009 23:34:05 ******/
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
/****** Object:  Table [dbo].[voucher]    Script Date: 07/08/2009 23:34:05 ******/
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
	[credit] [float] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF