Create database GAA;
use gaa;

CREATE TABLE dim_Submitted_for (
    submitted_for_Id 	INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    submitted_for 		VARCHAR(9)
);

Delete from dim_Submitted_for;
CREATE TABLE dim_date (
    date_ID INT NOT NULL 	PRIMARY KEY,
    date_value  DATE 		UNIQUE KEY,
    day_of_week_display	VARCHAR(4),
    day_of_month_numeric INT,
    day_of_week_numeric INT,
    day_number_of_year 	INT,
    week_of_year_numeric INT,
    month_numeric INT,
    month_display VARCHAR(8),
    year_numeric INT,
    quarter_display INT,
    year_half INT
);

CREATE TABLE dim_time (
    time_ID INT NOT NULL PRIMARY KEY,
    hours_12 INT,
    hours_24 INT,
    minutes INT,
    morning BOOL,
    afternoon BOOL,
    night BOOL,
    am BOOL,
    time_display VARCHAR(5),
    time_display_24 VARCHAR(5)
);
CREATE TABLE session_type (
    session_ID INT NOT NULL PRIMARY KEY,
    session_type VARCHAR(8)
);

CREATE TABLE ft_submission (
    Form_ID VARCHAR(36) 			NOT NULL PRIMARY KEY,
    Completed_datetime 				TIMESTAMP NOT NULL,
    submitted_for_Id 				INT,
    Submission_date 				DATE,
    Submission_time 				INT,
    Guardian_ID 					INT NOT NULL,
    Player_ID 						INT NOT NULL,
    Club_ID 						INT NOT NULL,
    Team_ID 						INT NOT NULL,
    Activity_ID 					INT NOT NULL,
    Organization_ID 				INT NOT NULL,
    Sport_ID 						INT NOT NULL,
    session_ID 						INT NOT NULL,
    FOREIGN KEY (session_ID) 		REFERENCES session_type (session_ID) ON DELETE CASCADE,
    FOREIGN KEY (Player_ID) 		REFERENCES dim_Player (player_ID) ON DELETE CASCADE,
    FOREIGN KEY (Guardian_ID)		REFERENCES dim_Guardian (guardian_ID) ON DELETE CASCADE,
    FOREIGN KEY (Club_ID) 			REFERENCES Clubs (club_ID) ON DELETE CASCADE,
    FOREIGN KEY (Organization_ID)	REFERENCES Organization (organization_ID) ON DELETE CASCADE,
    FOREIGN KEY (Sport_ID) 			REFERENCES Sport (sport_ID) ON DELETE CASCADE,
    FOREIGN KEY (Team_ID) 			REFERENCES Teams (team_ID) ON DELETE CASCADE,
    FOREIGN KEY (Sport_ID)			REFERENCES Sport (sport_ID)ON DELETE CASCADE,
    FOREIGN KEY (Activity_ID)		REFERENCES Activity (activity_ID) ON DELETE CASCADE,
    FOREIGN KEY (submitted_for_Id)	REFERENCES Dim_Submitted_for (submitted_for_Id) ON DELETE CASCADE,
    FOREIGN KEY (Submission_time)	REFERENCES dim_time (time_ID) ON DELETE CASCADE
);

CREATE TABLE dim_Player (
    player_ID INT NOT NULL PRIMARY KEY,
    gender_ID INT NOT NULL,
    DOB DATE,
    country_ID INT,
    county_ID INT,
    FOREIGN KEY (gender_ID)  REFERENCES dim_gender (gender_ID),
    FOREIGN KEY (county_ID)  REFERENCES dim_county (county_ID),
    FOREIGN KEY (country_ID) REFERENCES dim_country (country_ID),
    FOREIGN KEY (DOB)        REFERENCES dim_date (date_value)
);
CREATE TABLE dim_Guardian (
    guardian_ID INT NOT NULL PRIMARY KEY,
    gender_ID INT,
    DOB DATE,
    county_ID INT,
    county VARCHAR(12),
    country_ID INT,
    FOREIGN KEY (gender_ID)  REFERENCES dim_gender (gender_ID),
    FOREIGN KEY (county_ID)  REFERENCES dim_county (county_ID),
    FOREIGN KEY (country_ID) REFERENCES dim_country (country_ID),
    FOREIGN KEY (DOB)        REFERENCES dim_date (date_value)
);
CREATE TABLE Clubs (
    club_ID INT NOT NULL PRIMARY KEY,
    club_name VARCHAR(18),
    club_address VARCHAR(22),
    county_ID INT,
    country_ID INT,
    FOREIGN KEY (county_ID)  REFERENCES dim_county (county_ID),
    FOREIGN KEY (country_ID) REFERENCES dim_country (country_ID)
);
CREATE TABLE Organization (
    organization_ID INT NOT NULL PRIMARY KEY,
    organization_type VARCHAR(10)
);

CREATE TABLE Sport (
    sport_ID INT NOT NULL PRIMARY KEY,
    sport_name VARCHAR(15)
);

CREATE TABLE Teams (
    team_ID INT NOT NULL PRIMARY KEY,
    team_age VARCHAR(10)
);

CREATE TABLE Activity (
    activity_ID INT NOT NULL PRIMARY KEY,
    activity_name VARCHAR(15)
);

CREATE TABLE dim_gender (
    gender_ID INT NOT NULL PRIMARY KEY,
    gender VARCHAR(150)
);
CREATE TABLE dim_county (
    county_ID INT NOT NULL PRIMARY KEY,
    county_name CHAR(50) NOT NULL
);

CREATE TABLE dim_country (
    country_ID INT NOT NULL PRIMARY KEY,
    country_name VARCHAR(150),
    continent_name VARCHAR(150)
);
