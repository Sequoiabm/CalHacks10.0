------------------------------------------------------------------------------
--------- MAIN SCHEMA --------------------------------------------------------
------------------------------------------------------------------------------

CREATE TABLE User (
    userID INT AUTO_INCREMENT PRIMARY KEY,
    loginInfo VARCHAR(50) NOT NULL
);

CREATE TABLE Conversations (
    convoID INT AUTO_INCREMENT PRIMARY KEY,
    userID INT,
    userName VARCHAR(50) NOT NULL,
    userDesc VARCHAR(255) NOT NULL,
    descKeyPoints VARCHAR(255) NOT NULL,
    FOREIGN KEY (userID) REFERENCES User(userID)
);


CREATE TABLE Dialogue (
    dialogueIndex INT AUTO_INCREMENT PRIMARY KEY,
    dialogueText VARCHAR(255) NOT NULL,
    convoID INT,
    FOREIGN KEY (convoID) REFERENCES Conversations(convoID)
);
------------------------------------------------------------------------------
--------- END OF MAIN SCHEMA -------------------------------------------------
------------------------------------------------------------------------------








------------------------------------------------------------------------------
---------   SAMPLE INSERT VALUES TO TEST FUNCTIONLITY   ----------------------
------------------------------------------------------------------------------

-- Insert sample users
INSERT INTO User (loginInfo) VALUES
    ('user1_login'),
    ('user2_login'),
    ('user3_login');

-- Insert sample conversations
INSERT INTO Conversations (userID, userName, userDesc, descKeyPoints) VALUES
    (1, 'Alice', 'A conversation with Alice', 'Key point 1'),
    (2, 'Bob', 'A conversation with Bob', 'Key point 2'),
    (3, 'Charlie', 'A conversation with Charlie', 'Key point 3');

-- Insert sample dialogue
INSERT INTO Dialogue (dialogueText, convoID) VALUES
    ('Hello, Alice!', 1),
    ('Hi, Bob!', 2),
    ('Hey there, Charlie!', 3);





------------------------------------------------------------------------------
---------    BASIC QUERIES   -------------------------------------------------
------------------------------------------------------------------------------
--Get All Users:
SELECT * FROM User;


--Get Conversations for a Specific User (Replace X with the desired userID):
SELECT * FROM Conversations WHERE userID = X;


--Get Dialogue for a Specific Conversation (Replace Y with the desired convoID):
SELECT * FROM Dialogue WHERE convoID = Y;


--Get Conversations with User Names (Join Users and Conversations):
SELECT Conversations.*, User.loginInfo
FROM Conversations
JOIN User ON Conversations.userID = User.userID;


--Get All Dialogues with User Names (Join Users, Conversations, and Dialogue):
SELECT Dialogue.*, Conversations.userName, User.loginInfo
FROM Dialogue
JOIN Conversations ON Dialogue.convoID = Conversations.convoID
JOIN User ON Conversations.userID = User.userID;


--Get the Total Number of Conversations for Each User:
SELECT User.loginInfo, COUNT(Conversations.convoID) AS numConversations
FROM User
LEFT JOIN Conversations ON User.userID = Conversations.userID
GROUP BY User.loginInfo;
