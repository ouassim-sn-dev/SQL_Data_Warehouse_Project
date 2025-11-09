/*
=============================================================
              Création de la Base de Données et des Schémas
=============================================================
Utilité de ce script :
    Ce script sert à créer une base de données appelée "DataWarehouse"
    et vérifie si elle existe déjà.
    Si la base existe, elle est supprimée puis recréée.
    Le script crée également trois schémas dans la base :
    'bronze', 'silver' et 'gold'.

ATTENTION :
    L’exécution de ce script supprimera entièrement la base de données
    "DataWarehouse" si elle existe.
    Toutes les données qu’elle contient seront définitivement perdues.
    Veillez à faire une sauvegarde avant d’exécuter ce script.
*/

USE master;
GO

-- Drop and recreate la base des donnees 'DataWarehouse'
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

-- La creation de la base des donnees 'DataWarehouse'
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO

