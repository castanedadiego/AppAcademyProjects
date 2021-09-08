
CREATE TABLE users(
    id INTEGER PRIMARY KEY,
    fname TEXT,
    lname TEXT
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    title TEXT,
    body TEXT,
    author INTEGER,
    FOREIGN KEY(author) REFERENCES users(userid)
);

CREATE TABLE question_follows(
    userid INTEGER,
    questionid INTEGER,

    FOREIGN KEY(userid) REFERENCES users(id),
    FOREIGN KEY(questionid) REFERENCES questions(id)
);

CREATE TABLE replies(
    id INTEGER PRIMARY KEY,
    question INTEGER,
    parent INTEGER,
    user INTEGER,
    body TEXT,

    FOREIGN KEY(parent) REFERENCES replies(id),
    FOREIGN KEY(user) REFERENCES users(id),
    FOREIGN KEY(question) REFERENCES question(id)
);

CREATE TABLE question_likes(
    question INTEGER,
    user INTEGER,

    FOREIGN KEY(question) REFERENCES questions(id),
    FOREIGN KEY(user) REFERENCES users(id)
);

INSERT INTO users(fname, lname)
VALUES
("diego", "castaneda"),
("martha", "velasco");

INSERT INTO questions(title, body, author)
VALUES
("eat", "how do i eat", 1),
("drink", "how do i drink", 2);
