USE [arbitration]
GO
/****** Object:  Table [dbo].[awards]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[awards](
	[id] [nvarchar](50) NOT NULL,
	[type] [int] NULL,
	[deliveredDate] [date] NULL,
	[cause] [nvarchar](50) NULL,
	[applicant] [nvarchar](max) NULL,
	[respondent] [nvarchar](max) NULL,
	[caseDate] [date] NULL,
	[undertaker] [nvarchar](50) NULL,
	[auditor] [nvarchar](50) NULL,
	[secretaryGeneral] [nvarchar](50) NULL,
	[director] [nvarchar](50) NULL,
	[secretary] [nvarchar](50) NULL,
	[firstTrial] [nvarchar](50) NULL,
	[printing] [int] NULL,
 CONSTRAINT [PK_awards] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[arbitratorDetails]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arbitratorDetails](
	[id] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[post] [nvarchar](50) NULL,
	[accruedCharges] [bigint] NULL,
	[paidCharges] [bigint] NULL,
	[debtCharges] [bigint] NULL,
	[isPayInFull] [bit] NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_arbitratorDetails] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[arbitrator]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arbitrator](
	[id] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NOT NULL,
	[secretary] [nvarchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[cause] [nvarchar](50) NOT NULL,
	[contents] [nvarchar](max) NULL,
	[departmentOpinion] [nvarchar](max) NULL,
	[centerDirectorOpinion] [nvarchar](max) NULL,
	[directorOpinion] [nvarchar](max) NULL,
 CONSTRAINT [PK_arbitrator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applicant]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applicant](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[sex] [nvarchar](50) NULL,
	[identityCard] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[type] [int] NULL,
	[organization] [nvarchar](50) NULL,
	[post] [nvarchar](50) NULL,
	[proxy_spokesman] [nvarchar](50) NULL,
	[proxy_proxy1] [nvarchar](50) NULL,
	[proxy_proxy2] [nvarchar](50) NULL,
	[proxy_organization] [nvarchar](50) NULL,
	[proxy_contact] [nvarchar](50) NULL,
	[proxy_power] [nvarchar](50) NULL,
	[isApplicant] [bit] NULL,
	[cid] [nvarchar](50) NULL,
 CONSTRAINT [PK_applicant] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logging_event]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logging_event](
	[timestmp] [decimal](20, 0) NOT NULL,
	[formatted_message] [varchar](4000) NOT NULL,
	[logger_name] [varchar](254) NOT NULL,
	[level_string] [varchar](254) NOT NULL,
	[thread_name] [varchar](254) NULL,
	[reference_flag] [smallint] NULL,
	[arg0] [varchar](254) NULL,
	[arg1] [varchar](254) NULL,
	[arg2] [varchar](254) NULL,
	[arg3] [varchar](254) NULL,
	[caller_filename] [varchar](254) NOT NULL,
	[caller_class] [varchar](254) NOT NULL,
	[caller_method] [varchar](254) NOT NULL,
	[caller_line] [char](4) NOT NULL,
	[event_id] [decimal](38, 0) IDENTITY(1,1) NOT NULL,
	[time] [datetime] NOT NULL,
 CONSTRAINT [PK__logging___2370F727145C0A3F] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[role]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receipt]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receipt](
	[id] [nvarchar](50) NOT NULL,
	[cause] [nvarchar](50) NULL,
	[addressee] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[mode] [nvarchar](50) NULL,
	[files] [nvarchar](50) NULL,
	[contents] [nvarchar](50) NULL,
	[piece] [int] NULL,
	[deliveredDate] [date] NULL,
	[reason] [nvarchar](50) NULL,
	[secretary] [nvarchar](50) NULL,
	[processServer] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[receiver] [nvarchar](50) NULL,
	[receiptDate] [date] NULL,
	[isReceive] [bit] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_receipt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notice]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notice](
	[id] [nvarchar](50) NOT NULL,
	[cause] [nvarchar](50) NOT NULL,
	[applicant] [nvarchar](50) NOT NULL,
	[respondent] [nvarchar](50) NOT NULL,
	[deliveredDate] [date] NOT NULL,
	[courtDate] [datetime] NOT NULL,
	[secretary] [nvarchar](50) NOT NULL,
	[auditor] [nvarchar](50) NULL,
 CONSTRAINT [PK_notice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[rid] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_users_id] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_users_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logging_event_property]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logging_event_property](
	[event_id] [decimal](38, 0) NOT NULL,
	[mapped_key] [varchar](254) NOT NULL,
	[mapped_value] [varchar](1024) NULL,
PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[mapped_key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[logging_event_exception]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[logging_event_exception](
	[event_id] [decimal](38, 0) NOT NULL,
	[i] [smallint] NOT NULL,
	[trace_line] [varchar](254) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[event_id] ASC,
	[i] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cases]    Script Date: 02/24/2014 21:57:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cases](
	[id] [nvarchar](50) NOT NULL,
	[cause] [nvarchar](50) NOT NULL,
	[agreement] [nvarchar](50) NOT NULL,
	[request] [nvarchar](max) NOT NULL,
	[caseOfficer] [nvarchar](50) NULL,
	[responsiblePersonOpinion] [nvarchar](max) NULL,
	[departmentOpinion] [nvarchar](max) NULL,
	[secretaryGeneralOpinion] [nvarchar](max) NULL,
	[money] [bigint] NOT NULL,
	[acceptCharges] [bigint] NOT NULL,
	[handlingCharges] [bigint] NOT NULL,
	[arbitrationCharges] [bigint] NOT NULL,
	[paidCharges] [bigint] NOT NULL,
	[debtCharges] [bigint] NOT NULL,
	[isRelief] [bit] NOT NULL,
	[date] [date] NOT NULL,
	[registerDate] [date] NULL,
	[formationDate] [date] NULL,
	[courtDate] [datetime] NULL,
	[concludedDate] [date] NULL,
	[applicableProcedure] [int] NOT NULL,
	[type] [int] NOT NULL,
	[uid] [int] NULL,
	[status] [int] NOT NULL,
	[hearingRecord] [nvarchar](50) NULL,
	[typeName] [nvarchar](50) NULL,
	[awardResult] [nvarchar](50) NULL,
	[arbitratorNames] [nvarchar](50) NULL,
 CONSTRAINT [PK_case] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_logging_event_time]    Script Date: 02/24/2014 21:57:19 ******/
ALTER TABLE [dbo].[logging_event] ADD  CONSTRAINT [DF_logging_event_time]  DEFAULT (getdate()) FOR [time]
GO
/****** Object:  ForeignKey [FK_role_role]    Script Date: 02/24/2014 21:57:19 ******/
ALTER TABLE [dbo].[role]  WITH CHECK ADD  CONSTRAINT [FK_role_role] FOREIGN KEY([id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[role] CHECK CONSTRAINT [FK_role_role]
GO
/****** Object:  ForeignKey [FK_users_rid]    Script Date: 02/24/2014 21:57:19 ******/
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_rid] FOREIGN KEY([rid])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_rid]
GO
/****** Object:  ForeignKey [FK__logging_e__event__1A14E395]    Script Date: 02/24/2014 21:57:19 ******/
ALTER TABLE [dbo].[logging_event_property]  WITH CHECK ADD  CONSTRAINT [FK__logging_e__event__1A14E395] FOREIGN KEY([event_id])
REFERENCES [dbo].[logging_event] ([event_id])
GO
ALTER TABLE [dbo].[logging_event_property] CHECK CONSTRAINT [FK__logging_e__event__1A14E395]
GO
/****** Object:  ForeignKey [FK__logging_e__event__1ED998B2]    Script Date: 02/24/2014 21:57:19 ******/
ALTER TABLE [dbo].[logging_event_exception]  WITH CHECK ADD  CONSTRAINT [FK__logging_e__event__1ED998B2] FOREIGN KEY([event_id])
REFERENCES [dbo].[logging_event] ([event_id])
GO
ALTER TABLE [dbo].[logging_event_exception] CHECK CONSTRAINT [FK__logging_e__event__1ED998B2]
GO
/****** Object:  ForeignKey [FK_cases_users]    Script Date: 02/24/2014 21:57:19 ******/
ALTER TABLE [dbo].[cases]  WITH CHECK ADD  CONSTRAINT [FK_cases_users] FOREIGN KEY([uid])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[cases] CHECK CONSTRAINT [FK_cases_users]
GO

INSERT [dbo].[role] ([id], [name], [description]) VALUES (0, N'管理员', NULL)
INSERT [dbo].[role] ([id], [name], [description]) VALUES (1, N'副主任', NULL)
INSERT [dbo].[role] ([id], [name], [description]) VALUES (2, N'中心主任', NULL)
INSERT [dbo].[role] ([id], [name], [description]) VALUES (3, N'仲裁委主任', NULL)
INSERT [dbo].[role] ([id], [name], [description]) VALUES (4, N'仲裁秘书', NULL)
INSERT [dbo].[role] ([id], [name], [description]) VALUES (5, N'立案科科长', NULL)
INSERT [dbo].[role] ([id], [name], [description]) VALUES (6, N'联络科科长', NULL)
INSERT [dbo].[role] ([id], [name], [description]) VALUES (7, N'会计', NULL)
INSERT [dbo].[role] ([id], [name], [description]) VALUES (8, N'归档秘书', N'归档和仲裁秘书权限')

SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (1, N'张剑虹', N'张剑虹', N'111', 3, N'仲裁委主任')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (2, N'陈保平', N'陈保平', N'111', 2, N'中心主任')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (3, N'吕文宇', N'吕文宇', N'111', 1, N'中心副主任')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (4, N'杨军炜', N'杨军炜', N'111', 0, N'综合科科长')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (5, N'李娜', N'李娜', N'111', 6, N'联络科科长')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (6, N'司占杰', N'司占杰', N'111', 5, N'立案科科长')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (7, N'张晓艳', N'张晓艳', N'111', 7, N'会计')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (8, N'宋晨霏', N'宋晨霏', N'111', 8, N'归档秘书')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (9, N'李津', N'李津', N'111', 4, N'仲裁秘书')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (10, N'吴志国', N'吴志国', N'111', 4, N'仲裁秘书')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (11, N'黄镇', N'黄镇', N'111', 4, N'仲裁秘书')
INSERT [dbo].[users] ([id], [name], [username], [password], [rid], [description]) VALUES (12, N'黄铃显', N'黄铃显', N'111', 4, N'仲裁秘书')
SET IDENTITY_INSERT [dbo].[users] OFF