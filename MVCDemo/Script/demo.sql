USE [demo]
GO
/****** Object:  Table [dbo].[Test_Author]    Script Date: 4/10/2024 2:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Author](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Test_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Test_Books]    Script Date: 4/10/2024 2:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test_Books](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[Code] [varchar](100) NULL,
	[AuthorID] [int] NULL,
 CONSTRAINT [PK_Test_Books] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Test_Books]  WITH CHECK ADD  CONSTRAINT [FK_Test_Books_Test_Author] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Test_Author] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Test_Books] CHECK CONSTRAINT [FK_Test_Books_Test_Author]
GO
/****** Object:  StoredProcedure [dbo].[spu_TestAuthor_Add]    Script Date: 4/10/2024 2:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spu_TestAuthor_Add]
	@Name nvarchar(1000)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Test_Author]
           ([Name])
	OUTPUT inserted.*
     VALUES
           (@Name)
END
GO
/****** Object:  StoredProcedure [dbo].[spu_TestAuthor_Delete]    Script Date: 4/10/2024 2:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spu_TestAuthor_Delete]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE FROM [dbo].[Test_Author]
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spu_TestAuthor_Edit]    Script Date: 4/10/2024 2:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spu_TestAuthor_Edit]
	@ID int,
	@Name nvarchar(1000)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE [dbo].[Test_Author]
	SET [Name] = @Name
	OUTPUT inserted.*
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spu_TestAuthor_Get]    Script Date: 4/10/2024 2:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spu_TestAuthor_Get]
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [dbo].[Test_Author]
	WHERE ID = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[spu_TestAuthor_Gets]    Script Date: 4/10/2024 2:33:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spu_TestAuthor_Gets]
	@TuKhoa nvarchar(1000) = null
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM [dbo].[Test_Author]
	WHERE (@TuKhoa IS NULL OR (Name LIKE '%' + @TuKhoa + '%'))
END
GO
