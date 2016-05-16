/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  bar
 * Created: May 16, 2016
 */

-- ============================

-- This file was created using Derby's dblook utility.
-- Timestamp: 2016-05-13 16:37:55.486
-- Source database is: support
-- Connection URL is: jdbc:derby://localhost:1527/support;user=suser;password=suser;
-- appendLogs: false

-- ----------------------------------------------
-- DDL Statements for schemas
-- ----------------------------------------------

CREATE SCHEMA "SUSER";

-- ----------------------------------------------
-- DDL Statements for tables
-- ----------------------------------------------

CREATE TABLE "SUSER"."SPZISSUER" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "SPZID" INTEGER, "USERID" INTEGER);

CREATE TABLE "SUSER"."PROJECTCONFIGURATION" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "PROJECTID" INTEGER, "CONFIGURATIONID" INTEGER);

CREATE TABLE "SUSER"."ATTACHMENT" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "DATE" TIMESTAMP, "CONTENT" VARCHAR(255), "LOCATION" VARCHAR(255), "TYPE" VARCHAR(255), "TS" BIGINT);

CREATE TABLE "SUSER"."NOTEISSUER" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "NOTEID" INTEGER, "USERID" INTEGER);

CREATE TABLE "SUSER"."USERACCESS" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "ROLE_" VARCHAR(32), "TS" BIGINT, "USERID" INTEGER, "CONFIGURATIONID" INTEGER);

CREATE TABLE "SUSER"."USER_" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "LOGIN" VARCHAR(32), "NAME" VARCHAR(50), "PASSWORD" VARCHAR(512), "EMAIL" VARCHAR(50), "COMPANY" VARCHAR(50), "TEL" VARCHAR(50), "FAX" VARCHAR(50), "CLASS_TYPE" SMALLINT, "TS" BIGINT);

CREATE TABLE "SUSER"."SPZSTATES" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "SPZID" INTEGER, "STATEID" INTEGER);

CREATE TABLE "SUSER"."SPZ" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "REQNUMBER" VARCHAR(10), "PRIORITY" SMALLINT, "ISSUEDATE" TIMESTAMP, "CONTACTPERSON" VARCHAR(32), "REQUESTTYPE" VARCHAR(32), "SHORTNAME" VARCHAR(50), "REQUESTDESCRIPTION" VARCHAR(9000), "IMPLEMENTATIONACCEPTDATE" TIMESTAMP, "TS" BIGINT, "CATEGORY" SMALLINT NOT NULL DEFAULT 0, "MANDAYS" DOUBLE, "ASSUMEDMANDAYS" DOUBLE, "DEVELOPERID" INTEGER);

CREATE TABLE "SUSER"."SPZANALYST" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "SPZID" INTEGER, "USERID" INTEGER);

CREATE TABLE "SUSER"."CONFIGURATIONSPZ" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "CONFIGURATIONID" INTEGER, "SPZID" INTEGER);

CREATE TABLE "SUSER"."SPZSTATE" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "CODE" VARCHAR(50), "TS" BIGINT, "ISSUER_LOGIN" VARCHAR(32), "REVISEDREQUESTDESCRIPTION" VARCHAR(9000), "SOLUTIONDESCRIPTION" VARCHAR(9000), "RELEASENOTES" VARCHAR(9000), "CLASSTYPE" SMALLINT, "IDATE" DATE, "CURRENTSTATE" INTEGER);

CREATE TABLE "SUSER"."ROLES" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "USERID" INTEGER, "ROLE_" VARCHAR(32));

CREATE TABLE "SUSER"."SPZSTATENOTE" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "NOTEID" INTEGER, "STATEID" INTEGER);

CREATE TABLE "SUSER"."SPZNOTE" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "EXTERNALNOTE" SMALLINT, "NOTEDATE" TIMESTAMP, "NOTETEXT" VARCHAR(8000), "TS" BIGINT, "ISSUER" VARCHAR(100));

CREATE TABLE "SUSER"."ATTACHMENTNOTE" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "ATTACHMENTID" INTEGER, "SPZNOTEID" INTEGER);

CREATE TABLE "SUSER"."CONFIGURATION" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "CODE" VARCHAR(32), "DESCRIPTION" VARCHAR(255), "SEQNUMBER" BIGINT, "TS" BIGINT);

CREATE TABLE "SUSER"."PROJECT" ("ID" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY (START WITH 1, INCREMENT BY 1), "NAME" VARCHAR(32), "DESCRIPTION" VARCHAR(255), "TS" BIGINT);

-- ----------------------------------------------
-- DDL Statements for keys
-- ----------------------------------------------

-- PRIMARY/UNIQUE
ALTER TABLE "SUSER"."ATTACHMENTNOTE" ADD CONSTRAINT "SQL150728083221820" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."USER_" ADD CONSTRAINT "SQL150728083220240" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."ATTACHMENT" ADD CONSTRAINT "SQL150728083221650" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."SPZANALYST" ADD CONSTRAINT "SQL150728083220070" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."PROJECT" ADD CONSTRAINT "SQL150728083221470" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."ROLES" ADD CONSTRAINT "SQL150728083222000" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."USERACCESS" ADD CONSTRAINT "SQL150728083221300" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."CONFIGURATIONSPZ" ADD CONSTRAINT "SQL160110093452690" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."SPZSTATES" ADD CONSTRAINT "SQL150728083219720" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."PROJECTCONFIGURATION" ADD CONSTRAINT "SQL150728083221130" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."SPZSTATE" ADD CONSTRAINT "SQL150728083219510" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."CONFIGURATION" ADD CONSTRAINT "SQL150728083220930" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."SPZISSUER" ADD CONSTRAINT "SQL160102175025730" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."SPZ" ADD CONSTRAINT "SQL150728083219300" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."NOTEISSUER" ADD CONSTRAINT "SQL150728083220770" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."SPZSTATENOTE" ADD CONSTRAINT "SQL150728083220590" PRIMARY KEY ("ID");

ALTER TABLE "SUSER"."SPZNOTE" ADD CONSTRAINT "SQL150728083220420" PRIMARY KEY ("ID");

