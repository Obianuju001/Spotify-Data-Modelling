CREATE TABLE usersTable(
usersName VARCHAR(30) NOT NULL PRIMARY KEY,
usersEmail VARCHAR(25) NOT NULL,
usersPassword VARCHAR NOT NULL,
usersDOB DATETIME NOT NULL,
usersProfileImage IMAGE
);

CREATE TABLE artistsTable(
    artistsName VARCHAR(20) PRIMARY KEY,
    artistsGenre VARCHAR(20) NOT NULL,
    artistsImage IMAGE
);

CREATE TABLE albumsTable(
    albumsName VARCHAR(30) PRIMARY KEY,
    albumsReleaseDate DATETIME NOT NULL,
    albumsImage IMAGE
);
ALTER TABLE albumsTable
ADD artistsName VARCHAR(20) FOREIGN KEY REFERENCES artistsTable(artistsName);

CREATE TABLE tracksTable(
    tracksName VARCHAR(30) PRIMARY KEY,
    tracksDuration DATETIME NOT NULL,
    tracksFilePath VARCHAR(50) NOT NULL,
    albumsName VARCHAR(30) FOREIGN KEY REFERENCES albumsTable(albumsName)
);

CREATE TABLE playlistsTable(
    playlistsName VARCHAR(30) PRIMARY KEY,
    playlistsImage IMAGE,
    usersName VARCHAR(30) FOREIGN KEY REFERENCES usersTable(usersName)
);

CREATE TABLE playlist_trackTable(
    playlist_trackName VARCHAR(50) PRIMARY KEY,
    playlist_trackGenre VARCHAR(20) NOT NULL,
    playlistsName VARCHAR(30) FOREIGN KEY REFERENCES playlistsTable(playlistsName),
    tracksName VARCHAR(30) FOREIGN KEY REFERENCES tracksTable(tracksName)
);

CREATE TABLE followersTable(
    followersName VARCHAR(30) PRIMARY KEY,
    followersGender VARCHAR(10) NOT NULL,
    usersName VARCHAR(30) FOREIGN KEY REFERENCES usersTable(usersName),
    artistsName VARCHAR(20) FOREIGN KEY REFERENCES artistsTable(artistsName)
);

CREATE TABLE likesTable(
    likesDate DATETIME PRIMARY KEY,
    likesTime DATETIME NOT NULL,
    usersName VARCHAR(30) FOREIGN KEY REFERENCES usersTable(usersName),
    tracksName VARCHAR(30) FOREIGN KEY REFERENCES tracksTable(tracksName)
);

SELECT * from albumsTable