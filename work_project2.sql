CREATE TABLE contract ( 
    CONTRACT_ID  INTEGER PRIMARY KEY,
    CONTRACT_NUMBER  NUMERIC(12,0),
    CONTRACT_STATUS_ID  INTEGER
);
CREATE TABLE contract_status ( 
    CONTRACT_STATUS_ID INTEGER PRIMARY KEY,
    CONTRACT_STATUS_NAME  VARCHAR
);
CREATE TABLE personal_account ( 
    PERSONAL_ACCOUNT_ID INTEGER  PRIMARY KEY,
    PERSONAL_ACCOUNT_NUMBER  NUMERIC(9,0)
);
CREATE TABLE contract_personal_account ( 
    CONTRACT_PERSONAL_ACCOUNT_ID INTEGER  PRIMARY KEY,
    CONTRACT_ID  INTEGER,
    PERSONAL_ACCOUNT_ID  INTEGER
);
commit;

# Связи табиц. Выполнять не обязательно.
ALTER TABLE contract ADD CONSTRAINT CONTRACT_STATUS_ID_fkey FOREIGN KEY (CONTRACT_STATUS_ID) REFERENCES contract_status(CONTRACT_STATUS_ID);
ALTER TABLE contract_personal_account ADD CONSTRAINT CONTRACT_ID_fkey FOREIGN KEY (CONTRACT_ID) REFERENCES contract(CONTRACT_ID);
ALTER TABLE contract_personal_account ADD CONSTRAINT PERSONAL_ACCOUNT_ID_fkey FOREIGN KEY (PERSONAL_ACCOUNT_ID) REFERENCES personal_account(PERSONAL_ACCOUNT_ID);

select * from contract

INSERT INTO contract_status
(contract_status_id, contract_status_name)
VALUES
(1, 'Открыт'),
(2, 'Закрыт'),
(3, 'Блокирован');

INSERT INTO contract(contract_id, contract_number, contract_status_id)
VALUES
(1, 177345069033, 1),
(2, 177345069034, 1),
(3, 177345069035, 2),
(4, 177345069036, 1);

INSERT INTO personal_account(personal_account_id, personal_account_number)
VALUES
(1, 177369033),
(2, 177369034),
(3, 177369035),
(4, 177369036);
INSERT INTO contract_personal_account(contract_personal_account_id, contract_id, personal_account_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 4),
(4, 4, 3);

--1
select distinct (contract_status_name) 
from contract_status

--2
select distinct contract_status_name
from contract_status as c
join contract as s 
on s.contract_status_id = c.contract_status_id

--3
select contract_number
from contract as c
join contract_status as s 
on s.contract_status_id = c.contract_status_id
where contract_status_name = 'открыт'

--4
select personal_account_number
from contract as c
join personal_account as s 
on s.contract_status_id = c.contract_status_id
where contract_status_name = 'открыт'

--5
select contract_number, count (personal_account_id)
from contract as p
join contract_personal_account as s
on p.contract_id = c.contract_id
group by 1
