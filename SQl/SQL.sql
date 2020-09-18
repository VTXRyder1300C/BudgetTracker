--RESET DATABASE

--REMOVE TABLES

drop table expenses;
drop table income;
drop table users;

--ADD TABLES

CREATE TABLE USERS (
    USERID varchar(20),
    username varchar(30),
    password varchar(20),
    name varchar(30),
    email varchar(30),
    PRIMARY KEY (USERID)
);

CREATE TABLE EXPENSES (
    expenseid int,
    USERID varchar(20),
    date varchar(20),
    type varchar(20),
    amount varchar(20),
    notes varchar(100),
    PRIMARY KEY (expenseID)
);

ALTER TABLE
  app.EXPENSES
ADD CONSTRAINT FK_UserExpense
  FOREIGN KEY (USERID) REFERENCES USERS (userID) ON DELETE CASCADE;

CREATE TABLE INCOME (
    INCOMEID int,
    USERID varchar(20),
    date varchar(20),
    type varchar(20),
    amount varchar(20),
    notes varchar(100),
    PRIMARY KEY (INCOMEID)
);
ALTER TABLE
  app.income
ADD CONSTRAINT FK_UserIncome
  FOREIGN KEY (USERID) REFERENCES USERS (userID) ON DELETE CASCADE;

---- ADD DATA TO TABLES

----USERS

INSERT INTO users (userid, username, password, name, email)
VALUES ('1', 'Matt77','m', 'Mateo Paizano','matt@yahoo.com');

----EXPENSES

INSERT INTO EXPENSES (EXPENSEid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (1, '1','2020/06/22', 'Restaurant','22.50', 'Me and the girl');
INSERT INTO EXPENSES (EXPENSEid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (2, '1','2020/07/22', 'Groceries','35.50', 'I was hungry');
INSERT INTO EXPENSES (EXPENSEid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (3, '1','2020/05/22', 'Groceries','70.99', 'I bought lots of guava');
INSERT INTO EXPENSES (EXPENSEid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (4, '1','2020/04/22', 'Groceries','52.86', 'Papaya...');
INSERT INTO EXPENSES (EXPENSEid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (7, '1','2020/07/22', 'Groceries','70.99', 'I bought a lot of food. I was really hungry.  Attempt to fill note with a lot of crap.');

INSERT INTO income (incomeid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (1, '1','2020/06/01', 'pay day','1700.23', 'typical payday');
INSERT INTO income (incomeid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (3, '1','2020/07/01', 'pay day','1700.23', 'typical payday');
INSERT INTO income (incomeid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (6, '1','2020/07/01', 'pay day','1700.23', 'typical payday');
INSERT INTO income (incomeid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (7, '1','2020/08/01', 'pay day','1700.23', 'typical payday');
INSERT INTO income (incomeid, USERID, DATE, TYPE, AMOUNT, NOTES)
VALUES (8, '1','2020/06/22', 'stocks','1700.23', 'Sold my tesla stock!');

select * from users;
select * from expenses;
select * from income;

--Additional statements

-- ALTER TABLE
--   app.expenses
-- drop
--   FOREIGN KEY SQL200628165747490;

-- ALTER TABLE
--   app.expenses
-- ADD CONSTRAINT FK_UserExpense
--   FOREIGN KEY (USERID) REFERENCES users (userID) ON DELETE CASCADE;

-- ALTER TABLE
--   app.expenses
-- drop
--   FOREIGN KEY FK_UserExpense;
-- 
-- ALTER TABLE
--   app.income
-- drop
--   FOREIGN KEY FK_UserIncome;


--Expenses
