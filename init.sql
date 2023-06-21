-- Use the database
\c postgres;

-- Create the schema for race data
CREATE SCHEMA IF NOT EXISTS track;

-- Switch to race_data schema
SET search_path TO track;

CREATE TABLE circuits (
  circuitId serial PRIMARY KEY,
  circuitRef varchar(255) NOT NULL DEFAULT '',
  name varchar(255) NOT NULL DEFAULT '',
  location varchar(255) DEFAULT NULL,
  country varchar(255) DEFAULT NULL,
  lat real DEFAULT NULL,
  lng real DEFAULT NULL,
  alt integer DEFAULT NULL,
  url varchar(255) NOT NULL DEFAULT '',
  UNIQUE (url)
);

CREATE TABLE constructorResults (
  constructorResultsId serial PRIMARY KEY,
  raceId integer NOT NULL DEFAULT '0',
  constructorId integer NOT NULL DEFAULT '0',
  points real DEFAULT NULL,
  status varchar(255) DEFAULT NULL
);

CREATE TABLE constructorStandings (
  constructorStandingsId serial PRIMARY KEY,
  raceId integer NOT NULL DEFAULT '0',
  constructorId integer NOT NULL DEFAULT '0',
  points real NOT NULL DEFAULT '0',
  position integer DEFAULT NULL,
  positionText varchar(255) DEFAULT NULL,
  wins integer NOT NULL DEFAULT '0'
);

CREATE TABLE constructors (
  constructorId serial PRIMARY KEY,
  constructorRef varchar(255) NOT NULL DEFAULT '',
  name varchar(255) NOT NULL DEFAULT '',
  nationality varchar(255) DEFAULT NULL,
  url varchar(255) NOT NULL DEFAULT '',
  UNIQUE (name)
);

CREATE TABLE driverStandings (
  driverStandingsId serial PRIMARY KEY,
  raceId integer NOT NULL DEFAULT '0',
  driverId integer NOT NULL DEFAULT '0',
  points real NOT NULL DEFAULT '0',
  position integer DEFAULT NULL,
  positionText varchar(255) DEFAULT NULL,
  wins integer NOT NULL DEFAULT '0'
);

CREATE TABLE drivers (
  driverId serial PRIMARY KEY,
  driverRef varchar(255) NOT NULL DEFAULT '',
  number integer DEFAULT NULL,
  code varchar(3) DEFAULT NULL,
  forename varchar(255) NOT NULL DEFAULT '',
  surname varchar(255) NOT NULL DEFAULT '',
  dob date DEFAULT NULL,
  nationality varchar(255) DEFAULT NULL,
  url varchar(255) NOT NULL DEFAULT '',
  UNIQUE (url)
);

CREATE TABLE lapTimes (
  raceId integer NOT NULL,
  driverId integer NOT NULL,
  lap integer NOT NULL,
  position integer DEFAULT NULL,
  time varchar(255) DEFAULT NULL,
  milliseconds integer DEFAULT NULL,
  PRIMARY KEY (raceId,driverId,lap)
);

CREATE TABLE pitStops (
  raceId integer NOT NULL,
  driverId integer NOT NULL,
  stop integer NOT NULL,
  lap integer NOT NULL,
  time time NOT NULL,
  duration varchar(255) DEFAULT NULL,
  milliseconds integer DEFAULT NULL,
  PRIMARY KEY (raceId,driverId,stop)
);

CREATE TABLE qualifying (
  qualifyId serial PRIMARY KEY,
  raceId integer NOT NULL DEFAULT '0',
  driverId integer NOT NULL DEFAULT '0',
  constructorId integer NOT NULL DEFAULT '0',
  number integer NOT NULL DEFAULT '0',
  position integer DEFAULT NULL,
  q1 varchar(255) DEFAULT NULL,
  q2 varchar(255) DEFAULT NULL,
  q3 varchar(255) DEFAULT NULL
);

CREATE TABLE races (
  raceId serial PRIMARY KEY,
  year integer NOT NULL DEFAULT '0',
  round integer NOT NULL DEFAULT '0',
  circuitId integer NOT NULL DEFAULT '0',
  name varchar(255) NOT NULL DEFAULT '',
  date date NOT NULL DEFAULT '0001-01-01',
  time time DEFAULT NULL,
  url varchar(255) DEFAULT NULL,
  fp1_date date DEFAULT NULL,
  fp1_time time DEFAULT NULL,
  fp2_date date DEFAULT NULL,
  fp2_time time DEFAULT NULL,
  fp3_date date DEFAULT NULL,
  fp3_time time DEFAULT NULL,
  quali_date date DEFAULT NULL,
  quali_time time DEFAULT NULL,
  sprint_date date DEFAULT NULL,
  sprint_time time DEFAULT NULL,
  UNIQUE (url)
);

CREATE TABLE results (
  resultId serial PRIMARY KEY,
  raceId integer NOT NULL DEFAULT '0',
  driverId integer NOT NULL DEFAULT '0',
  constructorId integer NOT NULL DEFAULT '0',
  number integer NOT NULL DEFAULT '0',
  grid integer NOT NULL DEFAULT '0',
  position integer DEFAULT NULL,
  positionText varchar(255) NOT NULL DEFAULT '',
  positionOrder integer NOT NULL DEFAULT '0',
  points real NOT NULL DEFAULT '0',
  laps integer NOT NULL DEFAULT '0',
  time varchar(255) DEFAULT NULL,
  milliseconds integer DEFAULT NULL,
  fastestLap integer DEFAULT NULL,
  rank integer DEFAULT '0',
  fastestLapTime varchar(255) DEFAULT NULL,
  fastestLapSpeed varchar(255) DEFAULT NULL,
  statusId integer NOT NULL DEFAULT '0'
);

CREATE TABLE seasons (
  year integer NOT NULL DEFAULT '0',
  url varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (year),
  UNIQUE (url)
);

CREATE TABLE sprintResults (
  sprintResultId serial PRIMARY KEY,
  raceId integer NOT NULL DEFAULT '0',
  driverId integer NOT NULL DEFAULT '0',
  constructorId integer NOT NULL DEFAULT '0',
  number integer NOT NULL DEFAULT '0',
  grid integer NOT NULL DEFAULT '0',
  position integer DEFAULT NULL,
  positionText varchar(255) NOT NULL DEFAULT '',
  positionOrder integer NOT NULL DEFAULT '0',
  points real NOT NULL DEFAULT '0',
  laps integer NOT NULL DEFAULT '0',
  time varchar(255) DEFAULT NULL,
  milliseconds integer DEFAULT NULL,
  fastestLap integer DEFAULT NULL,
  fastestLapTime varchar(255) DEFAULT NULL,
  statusId integer NOT NULL DEFAULT '0'
);

CREATE TABLE status (
  statusId serial PRIMARY KEY,
  status varchar(255) NOT NULL DEFAULT ''
);
