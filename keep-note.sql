 --Create the tables for Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory.

CREATE TABLE User (
	user_id int NOT NULL primary key AUTO_INCREMENT,
	user_name varchar(50) NOT NULL,
	user_added_date DATE ,
	user_password varchar(50) ,
	user_mobile BIGINT(10) 
);

CREATE TABLE Note(
        note_id int NOT NULL primary key AUTO_INCREMENT,
        note_title varchar(100) NOT NULL,
        note_content varchar(500) ,
        note_status varchar(25) ,
        note_creation_date DATE 
);

CREATE TABLE Category (
        category_id int NOT NULL primary key AUTO_INCREMENT,
        category_name varchar(50) NOT NULL,
        category_descr varchar(100) NULL,
        category_creation_date DATE NULL,
        category_creator BIGINT(15) NULL
);


CREATE TABLE Reminder(
        reminder_id int NOT NULL primary key AUTO_INCREMENT, 
        reminder_name varchar(50) NOT NULL, 
        reminder_descr varchar(200) , 
        reminder_type varchar(10) , 
        reminder_creation_date DATE , 
        reminder_creator varchar(50)
);

CREATE TABLE NoteCategory(
notecategory_id int NOT NULL primary key AUTO_INCREMENT, 
note_id int NOT NULL, 
category_id int NOT NULL,
FOREIGN KEY (note_id) REFERENCES Note(note_id), 
FOREIGN KEY (category_id) REFERENCES Category(category_id)
);


CREATE TABLE NoteReminder(
notereminder_id int NOT NULL primary key AUTO_INCREMENT,           
note_id int NOT NULL, 
reminder_id int NOT NULL,
FOREIGN KEY (note_id) REFERENCES Note(note_id), 
FOREIGN KEY (reminder_id) REFERENCES Reminder(reminder_id)
);

CREATE TABLE UserNote(
usernote_id int NOT NULL primary key AUTO_INCREMENT, 
user_id int NOT NULL, 
note_id int NOT NULL,
FOREIGN KEY (user_id) REFERENCES User(user_id), 
FOREIGN KEY (note_id) REFERENCES Note(note_id)
);

--Insert the rows into the created tables (Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory).
 
  INSERT INTO User (user_name,user_added_date,user_password,user_mobile) VALUES ('user-abc', '2021-08-17', 'abc@123', '9876543210');
  INSERT INTO User (user_name,user_added_date,user_password,user_mobile) VALUES ('user-xyz', '2021-08-21', 'xyz@123', '9374838273');

  INSERT INTO Note (note_title, note_content, note_status, note_creation_date)VALUES ('Note1', 'Note1-content', 'Inprogress', '2022-03-23');
  INSERT INTO Note (note_title, note_content, note_status, note_creation_date) VALUES ('Note2', 'Note2-content', 'Active', '2022-03-21');

  INSERT INTO Category ( category_name, category_descr, category_creation_date, category_creator)  VALUES ( 'Category1', 'Category1-desc', '2022-03-23',1);
  INSERT INTO Category ( category_name, category_descr, category_creation_date, category_creator)  VALUES ( 'Category2', 'Category2-desc', '2022-03-24',2);

  INSERT INTO Reminder ( reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator) VALUES ('reminder1','reminder1-desc','Ongoing','2022-03-23','abc');
  INSERT INTO Reminder ( reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator) VALUES ('reminder2','reminder2-desc','Ongoing','2022-03-24','xyz');

  INSERT INTO NoteCategory ( note_id, category_id) VALUES (1,1);
  INSERT INTO NoteCategory ( note_id, category_id) VALUES (2,2);

  INSERT INTO NoteReminder (note_id,reminder_id) VALUES (1,1);
  INSERT INTO NoteReminder (note_id,reminder_id) VALUES (2,2);

  INSERT INTO UserNote (user_id,note_id) VALUES (1,1);
  INSERT INTO UserNote (user_id,note_id) VALUES (2,2);

--Fetch the row from User table based on Id and Password.

  SELECT * FROM User where user_id=1 and user_password='abc@123';

--Fetch all the rows from Note table based on the field note_creation_date.

  SELECT * FROM Note where note_creation_date='2022-03-23';

--Fetch all the Categories created after the particular Date.

  SELECT * FROM Category where category_creation_date='2022-03-23';

--Fetch all the Note ID from UserNote table for a given User.

  SELECT note_id from UserNote where user_id=1;

--Write Update query to modify particular Note for the given note Id.

  UPDATE Note set note_content='Updated Note2-content' ,note_status='completed' where note_id=2;

--Fetch all the Notes from the Note table by a particular User.

  SELECT * from Note where note_id =(SELECT note_id FROM UserNote WHERE user_id=1);

--Fetch all the Notes from the Note table for a particular Category.

  SELECT * from Note where note_id =(select note_id from NoteCategory where category_id=2);

--Fetch all the reminder details for a given note id.

  SELECT * from Reminder where reminder_id =(select reminder_id from NoteReminder where note_id=2);

--Fetch the reminder details for a given reminder id.

  SELECT * from Reminder where reminder_id=1;

--Write a query to create a new Note from particular User (Use Note and UserNote tables - insert statement)

  INSERT INTO Note (note_title,note_content,note_status,note_creation_date) VALUES('note3', 'Note3-content', 'Active', '2022-03-24');
  INSERT INTO UserNote(user_id,note_id) VALUES(2,3);

--Write a query to create a new Note from particular User to particular Category(Use Note and NoteCategory tables - insert statement)

  INSERT INTO Note(note_title,note_content,note_status,note_creation_date) VALUES('note4', 'Note4-content', 'Inactive', '2022-02-19');
  INSERT INTO NoteCategory(note_id, category_id) VALUES(4,2);

--Write a query to set a reminder for a particular note (Use Reminder and NoteReminder tables - insert statement)

  INSERT INTO Reminder(reminder_name,reminder_descr,reminder_type,reminder_creation_date,reminder_creator) VALUES('reminder3', 'reminder3-desc','LaterEvent', '2022-03-25','xyz');
  INSERT INTO NoteReminder(note_id,reminder_id) VALUES(2,3);

--Write a query to delete particular Note added by a User(Note and UserNote tables - delete statement)

  DELETE from UserNote WHERE user_id=2 AND note_id=2;
  DELETE from NoteReminder WHERE note_id=2;
  DELETE from NoteCategory WHERE note_id=2;
  DELETE from Note WHERE note_id=2;

--Write a query to delete particular Note from particular Category(Note and NoteCategory tables - delete statement)

  DELETE from NoteCategory WHERE category_id=2 AND note_id=2;
  DELETE from NoteReminder WHERE note_id=2;
  DELETE from UserNote WHERE note_id=2;
  DELETE from Note WHERE note_id=2;

--Create a trigger to delete all matching records from UserNote, NoteReminder and NoteCategory table when :
  -- 1. A particular note is deleted from Note table (all the matching records from UserNote, NoteReminder and NoteCategory should be removed automatically) 
  CREATE TRIGGER del_note before DELETE ON Note FOR EACH ROW Begin DELETE from UserNote WHERE note_id=1; DELETE from NoteReminder WHERE note_id=1; DELETE from NoteCategory WHERE note_id=1; 

  -- 2. A particular user is deleted from User table (all the matching notes should be removed automatically)
  CREATE TRIGGER del_user before DELETE ON User FOR EACH ROW Begin DELETE from UserNote WHERE note_id=1; DELETE from NoteReminder WHERE note_id=1;  DELETE from Category WHERE category_creator=1;  DELETE from NoteCategory WHERE note_id=1; 
    



