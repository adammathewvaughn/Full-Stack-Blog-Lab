CREATE SCHEMA bloggy_blog;
USE bloggy_blog;

CREATE TABLE authors (
    id INT AUTO_INCREMENT,
    name VARCHAR(75) NOT NULL,
    email VARCHAR(75) NOT NULL UNIQUE,
    _created TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id)
);

CREATE TABLE blogs (
    id INT AUTO_INCREMENT,
    title VARCHAR(75) NOT NULL,
    content TEXT,
    authorid INT NOT NULL,
    _created TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id),
    FOREIGN KEY (authorid) REFERENCES authors (id)
);

CREATE TABLE tags (
    id INT AUTO_INCREMENT,
    name VARCHAR(75) NOT NULL UNIQUE,
    _created TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id)
);

CREATE TABLE blogtags (
    blogid INT NOT NULL,
    tagid INT NOT NULL,
    PRIMARY KEY (blogid, tagid),
    FOREIGN KEY (blogid) REFERENCES blogs (id),
    FOREIGN KEY (tagid) REFERENCES tags (id)
);