
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/11/2022 13:35:50
-- Generated from EDMX file: C:\Users\Ole Weber\source\repos\ArbeitsPlanung3\ArbeitsPlanung3_Lib\ArbeitsPlanung3_Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ArbeitsPlanung3];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'ArbeitenSet'
CREATE TABLE [dbo].[ArbeitenSet] (
    [ArbeitId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'BenutzerSet'
CREATE TABLE [dbo].[BenutzerSet] (
    [BenutzerId] int IDENTITY(1,1) NOT NULL,
    [Vorname] nvarchar(max)  NOT NULL,
    [Nachname] nvarchar(max)  NOT NULL,
    [istAdmin] bit  NOT NULL,
    [istBenutzer] bit  NOT NULL
);
GO

-- Creating table 'FlugzeugeSet'
CREATE TABLE [dbo].[FlugzeugeSet] (
    [FlugzeugId] int IDENTITY(1,1) NOT NULL,
    [Kennzeichen] nvarchar(max)  NOT NULL,
    [Typ] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'FlugzeugeArbeiten'
CREATE TABLE [dbo].[FlugzeugeArbeiten] (
    [istAwendbar_FlugzeugId] int  NOT NULL,
    [hatArbeiten_ArbeitId] int  NOT NULL
);
GO

-- Creating table 'darfMachen'
CREATE TABLE [dbo].[darfMachen] (
    [darfGemachtWerden_BenutzerId] int  NOT NULL,
    [darfMachen_ArbeitId] int  NOT NULL
);
GO

-- Creating table 'kannMachen'
CREATE TABLE [dbo].[kannMachen] (
    [kannGemachtWerden_BenutzerId] int  NOT NULL,
    [kannMachen_ArbeitId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ArbeitId] in table 'ArbeitenSet'
ALTER TABLE [dbo].[ArbeitenSet]
ADD CONSTRAINT [PK_ArbeitenSet]
    PRIMARY KEY CLUSTERED ([ArbeitId] ASC);
GO

-- Creating primary key on [BenutzerId] in table 'BenutzerSet'
ALTER TABLE [dbo].[BenutzerSet]
ADD CONSTRAINT [PK_BenutzerSet]
    PRIMARY KEY CLUSTERED ([BenutzerId] ASC);
GO

-- Creating primary key on [FlugzeugId] in table 'FlugzeugeSet'
ALTER TABLE [dbo].[FlugzeugeSet]
ADD CONSTRAINT [PK_FlugzeugeSet]
    PRIMARY KEY CLUSTERED ([FlugzeugId] ASC);
GO

-- Creating primary key on [istAwendbar_FlugzeugId], [hatArbeiten_ArbeitId] in table 'FlugzeugeArbeiten'
ALTER TABLE [dbo].[FlugzeugeArbeiten]
ADD CONSTRAINT [PK_FlugzeugeArbeiten]
    PRIMARY KEY CLUSTERED ([istAwendbar_FlugzeugId], [hatArbeiten_ArbeitId] ASC);
GO

-- Creating primary key on [darfGemachtWerden_BenutzerId], [darfMachen_ArbeitId] in table 'darfMachen'
ALTER TABLE [dbo].[darfMachen]
ADD CONSTRAINT [PK_darfMachen]
    PRIMARY KEY CLUSTERED ([darfGemachtWerden_BenutzerId], [darfMachen_ArbeitId] ASC);
GO

-- Creating primary key on [kannGemachtWerden_BenutzerId], [kannMachen_ArbeitId] in table 'kannMachen'
ALTER TABLE [dbo].[kannMachen]
ADD CONSTRAINT [PK_kannMachen]
    PRIMARY KEY CLUSTERED ([kannGemachtWerden_BenutzerId], [kannMachen_ArbeitId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [istAwendbar_FlugzeugId] in table 'FlugzeugeArbeiten'
ALTER TABLE [dbo].[FlugzeugeArbeiten]
ADD CONSTRAINT [FK_FlugzeugeArbeiten_Flugzeuge]
    FOREIGN KEY ([istAwendbar_FlugzeugId])
    REFERENCES [dbo].[FlugzeugeSet]
        ([FlugzeugId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [hatArbeiten_ArbeitId] in table 'FlugzeugeArbeiten'
ALTER TABLE [dbo].[FlugzeugeArbeiten]
ADD CONSTRAINT [FK_FlugzeugeArbeiten_Arbeiten]
    FOREIGN KEY ([hatArbeiten_ArbeitId])
    REFERENCES [dbo].[ArbeitenSet]
        ([ArbeitId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FlugzeugeArbeiten_Arbeiten'
CREATE INDEX [IX_FK_FlugzeugeArbeiten_Arbeiten]
ON [dbo].[FlugzeugeArbeiten]
    ([hatArbeiten_ArbeitId]);
GO

-- Creating foreign key on [darfGemachtWerden_BenutzerId] in table 'darfMachen'
ALTER TABLE [dbo].[darfMachen]
ADD CONSTRAINT [FK_darfMachen_Benutzer]
    FOREIGN KEY ([darfGemachtWerden_BenutzerId])
    REFERENCES [dbo].[BenutzerSet]
        ([BenutzerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [darfMachen_ArbeitId] in table 'darfMachen'
ALTER TABLE [dbo].[darfMachen]
ADD CONSTRAINT [FK_darfMachen_Arbeiten]
    FOREIGN KEY ([darfMachen_ArbeitId])
    REFERENCES [dbo].[ArbeitenSet]
        ([ArbeitId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_darfMachen_Arbeiten'
CREATE INDEX [IX_FK_darfMachen_Arbeiten]
ON [dbo].[darfMachen]
    ([darfMachen_ArbeitId]);
GO

-- Creating foreign key on [kannGemachtWerden_BenutzerId] in table 'kannMachen'
ALTER TABLE [dbo].[kannMachen]
ADD CONSTRAINT [FK_kannMachen_Benutzer]
    FOREIGN KEY ([kannGemachtWerden_BenutzerId])
    REFERENCES [dbo].[BenutzerSet]
        ([BenutzerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [kannMachen_ArbeitId] in table 'kannMachen'
ALTER TABLE [dbo].[kannMachen]
ADD CONSTRAINT [FK_kannMachen_Arbeiten]
    FOREIGN KEY ([kannMachen_ArbeitId])
    REFERENCES [dbo].[ArbeitenSet]
        ([ArbeitId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_kannMachen_Arbeiten'
CREATE INDEX [IX_FK_kannMachen_Arbeiten]
ON [dbo].[kannMachen]
    ([kannMachen_ArbeitId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------