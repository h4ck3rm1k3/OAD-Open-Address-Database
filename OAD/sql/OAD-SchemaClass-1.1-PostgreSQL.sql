-- 
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Mon Feb  8 10:58:34 2010
-- 
--
-- Table: addresses
--
DROP TABLE "addresses" CASCADE;
CREATE TABLE "addresses" (
  "id" bigint NOT NULL,
  "street" character varying(255) NOT NULL,
  "suburb" character varying(255) NOT NULL,
  "state" character varying(255) NOT NULL,
  "country" character varying(255) NOT NULL,
  "lat" bigint NOT NULL,
  "lon" bigint NOT NULL,
  "addedby" bigint NOT NULL,
  "locatedby" bigint NOT NULL,
  PRIMARY KEY ("id")
);
CREATE INDEX "addresses_idx_addedby" on "addresses" ("addedby");
CREATE INDEX "addresses_idx_locatedby" on "addresses" ("locatedby");

--
-- Table: users
--
DROP TABLE "users" CASCADE;
CREATE TABLE "users" (
  "id" bigint NOT NULL,
  "username" character varying(255) NOT NULL,
  "password" character varying(255) NOT NULL,
  "added" timestamp(6) NOT NULL,
  PRIMARY KEY ("id")
);

--
-- Foreign Key Definitions
--

ALTER TABLE "addresses" ADD FOREIGN KEY ("addedby")
  REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

ALTER TABLE "addresses" ADD FOREIGN KEY ("locatedby")
  REFERENCES "users" ("id") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

