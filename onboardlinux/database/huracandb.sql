-- Author: Giovanni Rasera @ Huracan Power
-- Init Date: 11 nov 2022
-- Link: Under private permission -> https://github.com/GiovanniRaseraF/HURACAN_remotecontrol

-- Drop and create
DROP SCHEMA IF EXISTS huracandb_onboard CASCADE;
CREATE SCHEMA huracandb_onboard;
SET search_path TO huracandb_onboard;

-- Tables
CREATE TABLE canpacket(
    channel             integer             NOT NULL,

    CONSTRAINT canpacket_pkey
        PRIMARY KEY     (channel)
);

CREATE TABLE candata(
    id                  integer             NOT NULL,
    data                varchar(16)         NULL,
    arrivedat           timestamp           NULL,
    canpacket_channel   integer             NOT NULL,

    CONSTRAINT candata_pkey
        PRIMARY KEY     (id),
    CONSTRAINT candata_fkey
        FOREIGN KEY     (canpacket_channel)
        REFERENCES      canpacket(channel)
        ON UPDATE       CASCADE
        ON DELETE       CASCADE 
);
ALTER TABLE candata 
    ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
        SEQUENCE    NAME    candata_id_seq
        START       WITH    1
        INCREMENT   BY      1
        NO                  MINVALUE
        NO                  MAXVALUE
        CACHE               1
);

CREATE TABLE log(
    id                  integer             NOT NULL,
    info                varchar(200)        NULL,
    loggedat            timestamp           NULL,

    CONSTRAINT  log_pkey
        PRIMARY KEY     (id)
);
ALTER TABLE log 
    ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
        SEQUENCE    NAME    log_id_seq
        START       WITH    1
        INCREMENT   BY      1
        NO                  MINVALUE
        NO                  MAXVALUE
        CACHE               1
);

-- Notification
-- create or replace function 


-- Intert Values
-- Init 
INSERT INTO canpacket(channel) 
VALUES
    (x'123'::int);

INSERT INTO  log(id, info, loggedat)
VALUES 
    (default, 'Test Huracan', now()::timestamp);