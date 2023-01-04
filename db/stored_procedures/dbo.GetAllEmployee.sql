USE [ArtsofteTestProject]
GO

/****** Object: SqlProcedure [dbo].[GetAllEmployee] Script Date: 26.12.2022, понедельник 13:35:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllEmployee]
	@out_error_number INT = 0 OUTPUT
AS
BEGIN
BEGIN TRY
	Select * from Employee 
END TRY
BEGIN CATCH
	SELECT @out_error_number=ERROR_NUMBER()
END CATCH
END
