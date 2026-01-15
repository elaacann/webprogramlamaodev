CREATE DATABASE [PortfolioDB];
GO
USE [PortfolioDB];
GO

CREATE TABLE [Admins] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [Username] NVARCHAR(50) NOT NULL UNIQUE,
    [PasswordHash] NVARCHAR(255) NOT NULL
);


INSERT INTO [Admins] ([Username], [PasswordHash]) VALUES ('admin', 'admin'); 

CREATE TABLE [Settings] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [Key] NVARCHAR(50) NOT NULL UNIQUE,
    [Value] NVARCHAR(MAX)
);

INSERT INTO [Settings] ([Key], [Value]) VALUES 
('SiteTitle', 'Elanın Sitesiii	'),
('FooterText', '© 2026. Tüm hakları saklıdır.'),
('HeroTitle', 'Merhaba, Ben Ela Can'),
('HeroSubtitle', 'Bir şeyler denemeye çalışıyorum.'),
('AboutText', 'Portfolyoma hoşgeldiniz	.');

CREATE TABLE [Projects] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [Title] NVARCHAR(100) NOT NULL,
    [Description] NVARCHAR(MAX),
    [ImageUrl] NVARCHAR(255),
    [Link] NVARCHAR(255),
    [DisplayOrder] INT DEFAULT 0
);

CREATE TABLE [Skills] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL,
    [Rate] INT NOT NULL CHECK (Rate >= 0 AND Rate <= 100),
    [DisplayOrder] INT DEFAULT 0
);

CREATE TABLE [SocialMedia] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [PlatformName] NVARCHAR(50) NOT NULL,
    [Url] NVARCHAR(255) NOT NULL,
    [IconClass] NVARCHAR(50) 
);

CREATE TABLE [Pages] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [Title] NVARCHAR(100) NOT NULL,
    [Slug] NVARCHAR(100) NOT NULL UNIQUE,
    [Content] NVARCHAR(MAX),
    [IsActive] BIT DEFAULT 1,
    [DisplayOrder] INT DEFAULT 0
);

CREATE TABLE [Messages] (
    [Id] INT IDENTITY(1,1) PRIMARY KEY,
    [SenderName] NVARCHAR(100) NOT NULL,
    [SenderEmail] NVARCHAR(100) NOT NULL,
    [MessageContent] NVARCHAR(MAX) NOT NULL,
    [SentDate] DATETIME DEFAULT GETDATE(),
    [IsRead] BIT DEFAULT 0
);
GO
