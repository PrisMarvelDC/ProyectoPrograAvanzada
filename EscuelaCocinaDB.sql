--DROP DATABASE ProyectoWebAvanzado 
--CREATE DATABASE [ProyectoWebAvanzado]
--GO
USE [ProyectoWebAvanzado]
---
CREATE TABLE [dbo].[TReceta](
    [Id] [bigint] IDENTITY(1, 1) NOT NULL,
	[UsuarioId] [nvarchar](450) NOT NULL,
    [Nombre] [varchar](100) NOT NULL,
    [Descripcion] [varchar](200) NOT NULL,
    [Instrucciones] [varchar](MAX) NOT NULL,
    [Categoria] [varchar](100) NOT NULL,
	[Ingredientes] [varchar](500) NOT NULL,
    CONSTRAINT [PK_TReceta] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY],
	CONSTRAINT [FK_TReceta_AspNetUsers] FOREIGN KEY([UsuarioId]) REFERENCES [dbo].[AspNetUsers] ([Id])
) ON [PRIMARY]
GO
---
	CREATE TABLE [dbo].[TCurso](
		[Id] [bigint] IDENTITY(1, 1) NOT NULL,
		[Nombre] [varchar](100) NOT NULL,
		[Descripcion] [varchar](200) NOT NULL,
		[Profesor] [varchar](100) NOT NULL,
		[UsuarioId] [nvarchar](450) NOT NULL,
		CONSTRAINT [PK_TCurso] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (
			PAD_INDEX = OFF,
			STATISTICS_NORECOMPUTE = OFF,
			IGNORE_DUP_KEY = OFF,
			ALLOW_ROW_LOCKS = ON,
			ALLOW_PAGE_LOCKS = ON,
			OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
		) ON [PRIMARY],
		CONSTRAINT [FK_TCurso_AspNetUsers] FOREIGN KEY([UsuarioId]) REFERENCES [dbo].[AspNetUsers] ([Id])
	) ON [PRIMARY]
GO
---
--	CREATE TABLE [dbo].[TUsuario](
--		[Id] [bigint] IDENTITY(1, 1) NOT NULL,
--		[Identification] [varchar](20) NOT NULL,
--		[Nombre] [varchar](100) NOT NULL,
--		[Apellidos] [varchar](100) NOT NULL,
--		[Correo] [varchar](50) NOT NULL,
--		[Telefono] [varchar](15) NOT NULL,
--		CONSTRAINT [PK_TUsuario] PRIMARY KEY CLUSTERED ([Id] ASC) WITH (
--			PAD_INDEX = OFF,
--			STATISTICS_NORECOMPUTE = OFF,
--			IGNORE_DUP_KEY = OFF,
--			ALLOW_ROW_LOCKS = ON,
--			ALLOW_PAGE_LOCKS = ON,
--			OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
--		) ON [PRIMARY]
--	) ON [PRIMARY]
--GO
---
CREATE TABLE [dbo].[TCursoUsuario](
    [Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CursoId] [bigint] NOT NULL,
    [UsuarioId] [nvarchar](450) NOT NULL,
    CONSTRAINT [PK_TCursoUsuario] PRIMARY KEY CLUSTERED ([CursoId] ASC, [UsuarioId] ASC) WITH (
        PAD_INDEX = OFF,
        STATISTICS_NORECOMPUTE = OFF,
        IGNORE_DUP_KEY = OFF,
        ALLOW_ROW_LOCKS = ON,
        ALLOW_PAGE_LOCKS = ON,
        OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF
    ) ON [PRIMARY],
    CONSTRAINT [FK_TCursoUsuario_TCurso] FOREIGN KEY([CursoId]) REFERENCES [dbo].[TCurso] ([Id]),
    CONSTRAINT [FK_TCursoUsuario_AspNetUsers] FOREIGN KEY([UsuarioId]) REFERENCES [dbo].[AspNetUsers] ([Id])
) ON [PRIMARY]
GO
---
CREATE TABLE [dbo].[TCursoReceta](
    [Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CursoId] [bigint] NOT NULL,
    [RecetaId] [bigint] NOT NULL,
    CONSTRAINT [PK_TCursoReceta] PRIMARY KEY CLUSTERED ([CursoId] ASC, [RecetaId] ASC),
    CONSTRAINT [FK_TCursoReceta_TCurso] FOREIGN KEY([CursoId]) REFERENCES [dbo].[TCurso] ([Id]),
    CONSTRAINT [FK_TCursoReceta_TReceta] FOREIGN KEY([RecetaId]) REFERENCES [dbo].[TReceta] ([Id])
) ON [PRIMARY]
GO
---
CREATE TABLE [dbo].[TLogErrores](
    [Id] [bigint] IDENTITY(1,1) NOT NULL,
    [FechaHora] [datetime] NOT NULL DEFAULT(GETDATE()),
    [Usuario] [varchar](100),
    [Modulo] [varchar](100),
    [DescripcionError] [varchar](MAX) NOT NULL,
    [InformacionAdicional] [varchar](MAX),
    CONSTRAINT [PK_TLogErrores] PRIMARY KEY CLUSTERED ([Id] ASC)
) ON [PRIMARY]
GO
---

DROP TABLE [dbo].[TCursoUsuario]
DROP TABLE [dbo].[TCursoReceta]

--
--Quitar constraint
alter table TCursoReceta drop constraint FK_TCursoReceta_TReceta
drop table TReceta
--
alter table TCursoReceta drop constraint FK_TCursoReceta_TCurso
drop table TCurso
--
--
--
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) 
VALUES ('1', 'Administrador', 'ADMINISTRADOR', NULL);
 
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) 
VALUES ('2', 'Profesor', 'PROFESOR', NULL);
 
INSERT INTO [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) 
VALUES ('3', 'Estudiante', 'ESTUDIANTE', NULL);