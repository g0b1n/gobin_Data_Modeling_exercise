-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/LHzKdx
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "teams" (
    "id" serial   NOT NULL,
    "team_name" text   NOT NULL,
    "city" text   NOT NULL,
    CONSTRAINT "pk_teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "players" (
    "id" serial   NOT NULL,
    "pl_name" text   NOT NULL,
    "birthday" text   NOT NULL,
    "height" INTERGEr   NOT NULL,
    "current_team_id" interger   NOT NULL,
    CONSTRAINT "pk_players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "goals" (
    "id" serial   NOT NULL,
    "player_id" interger   NOT NULL,
    "match_id" interger   NOT NULL,
    "team_id" interger   NOT NULL,
    CONSTRAINT "pk_goals" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "referees" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "matches" (
    "id" serial   NOT NULL,
    "home_team_id" interger   NOT NULL,
    "away_team_id" interger   NOT NULL,
    "location" text   NOT NULL,
    "date" text   NOT NULL,
    "start_time" interger   NOT NULL,
    "season_id" interger   NOT NULL,
    "head_ref_id" interger   NOT NULL,
    "asst_ref_1_id" interger   NOT NULL,
    "asst_ref_2_id" interger   NOT NULL,
    CONSTRAINT "pk_matches" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "lineup" (
    "id" serial   NOT NULL,
    "player_id" interger   NOT NULL,
    "match_id" interger   NOT NULL,
    "team_id" interger   NOT NULL,
    CONSTRAINT "pk_lineup" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "results" (
    "id" serial   NOT NULL,
    "team_id" interger   NOT NULL,
    "match_id" interger   NOT NULL,
    "results" text   NOT NULL,
    CONSTRAINT "pk_results" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "season" (
    "id" serial   NOT NULL,
    "start_date" interger   NOT NULL,
    "end_date" interger   NOT NULL,
    CONSTRAINT "pk_season" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "teams" ADD CONSTRAINT "fk_teams_id" FOREIGN KEY("id")
REFERENCES "lineup" ("team_id");

ALTER TABLE "players" ADD CONSTRAINT "fk_players_current_team_id" FOREIGN KEY("current_team_id")
REFERENCES "teams" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "goals" ADD CONSTRAINT "fk_goals_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_away_team_id" FOREIGN KEY("away_team_id")
REFERENCES "teams" ("id");

ALTER TABLE "matches" ADD CONSTRAINT "fk_matches_head_ref_id" FOREIGN KEY("head_ref_id")
REFERENCES "referees" ("id");

ALTER TABLE "lineup" ADD CONSTRAINT "fk_lineup_player_id" FOREIGN KEY("player_id")
REFERENCES "players" ("id");

ALTER TABLE "lineup" ADD CONSTRAINT "fk_lineup_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_team_id" FOREIGN KEY("team_id")
REFERENCES "teams" ("id");

ALTER TABLE "results" ADD CONSTRAINT "fk_results_match_id" FOREIGN KEY("match_id")
REFERENCES "matches" ("id");

ALTER TABLE "season" ADD CONSTRAINT "fk_season_id" FOREIGN KEY("id")
REFERENCES "matches" ("season_id");

