DROP TABLE videos;

CREATE TABLE videos (
  id serial8 primary key, 
  title varchar(225),
  description text,
  url varchar(225),
  genre varchar(30)
);

INSERT INTO videos (title, description, url, genre) VALUES ('Hozier - Work Song', 'Work Song is a song written and performed by Irish recording artist Hozier. It was released as the fourth single from his debut studio album Hozier (2014)', 'nH7bjV0Q_44', 'rock');

INSERT INTO videos (title, description, url, genre) VALUES ('Chet Faker - Talk Is Cheap', 'Talk Is Cheap is the first single by Australian recording artist Chet Faker from his debut studio album Built on Glass (2014)', 'aP_-P_BS6KY', 'trip hop');