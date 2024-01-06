-- Tabel library
CREATE TABLE library (
    library_id SERIAL PRIMARY KEY,
    library_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL
);

-- Tabel book
CREATE TABLE book (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    quantity INT NOT NULL CHECK (quantity >= 0),
    category_id INT NOT NULL
);

-- Tabel users
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL
);

-- Tabel loan
CREATE TABLE loan (
    loan_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) NOT NULL,
    book_id INT REFERENCES book(book_id) NOT NULL,
    loan_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE
);

-- Tabel hold
CREATE TABLE hold (
    hold_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id) NOT NULL,
    book_id INT REFERENCES book(book_id) NOT NULL,
    hold_date DATE NOT NULL
);
