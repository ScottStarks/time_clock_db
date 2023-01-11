USE [WorkingShift]
GO

--random string generator
declare @maxLength int = 5; --max length
declare @id varchar(10)
declare @i int = 1; 
While @i < @maxLength
    begin
        set @id = concat(@id, char((rand()*26 + 65))); 
        set @i = len(@id)
    end

	Declare @email varchar(50) = 'admin@email.com'

	If NOT EXISTS (SELECT 1 FROM [dbo].Employee WHERE Email= @email)
    BEGIN
         INSERT INTO [dbo].[Employee]
           ([ID]
           ,[Name]
           ,[Email]
           ,[Role]
           ,[CreatedOn])
     VALUES
           (@id
           ,'Admin'
           ,@email
           ,1
           ,GETDATE())
    END 
GO


