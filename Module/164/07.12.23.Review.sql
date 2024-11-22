DROP DATABASE IF EXISTS reviews;
CREATE DATABASE reviews;
USE reviews;

CREATE TABLE Review (
    reviewID INT PRIMARY KEY NOT NULL,
    userID INT NOT NULL,
    gameID INT NOT NULL,
    reviewStars ENUM('0', '1', '2', '3', '4', '5') DEFAULT '0',
    reviewText VARCHAR(200) NOT NULL,
    reviewDate DATE NOT NULL
);

create table User (
		userID int primary key not null,
        username varchar(100) not null,
        usermail varchar(100) not null
);

create table Game (
		gameID int primary key not null,
        gameName varchar(100),
        gameOS varchar(100),
		gameDescription varchar(100)
);


insert into Review
	(reviewID, userID, gameID, reviewStars, reviewText, reviewDate)
values 
	(1,1,1,4,'Great game had some issues but loved to play the story.','2023-10-10'),
    (2,2,1,5,'Amazing graphics and story!','2023-10-10'),
    (3,2,1,5,'The story was great I hope a seconds comes!','2023-10-10');

insert into User
	(userID, username, usermail)
values 
	(1,'Jason_buchsel54','Jason@zesty.com'),
    (2,'Jason_buchsel55','Jason@zestz.com'),
    (3,'Jason_buchsel56','Jason@zesti.com');
    
insert into Game
	(gameID, gameName, GameOS, GameDescription)
values 
	(1,'Hot Words','Windows','Word puzzles'),
    (2,'Ginger Simulator','Windows','Play as the baddest humanity objects.'),
    (3,'Online chat room','Windows','Random dudes with webcam');


ALTER TABLE review
ADD CONSTRAINT fk_UserID
FOREIGN KEY (userID) REFERENCES User(userID);

ALTER TABLE review
ADD CONSTRAINT fk_GameID
FOREIGN KEY (userID) REFERENCES Game(gameID);