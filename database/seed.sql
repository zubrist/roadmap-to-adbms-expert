-- Here we put data inside the tables 


-- insert into department table 

INSERT INTO department (name,location) VALUES 
("Computer Science","Salt Lake Sector 3"), 
("Neno Technology","Salt Lake Sector 3"),
("Mathematics","Rajabazar"),
("Physics","Rajabazar"),
("Chemistry","Rajabazar"),
("Biology","Rajabazar"),
("Information Technology","Ballygaung");




INSERT INTO role (title, salary) VALUES
("HOD", 80000),
("Professor", 70000),
("Lecturer", 50000),
("Lab Assistant", 30000),
("Registrar", 60000);




INSERT INTO employee(name, email,role_id, department_id, hire_date) VALUES
("John Doe", "john.doe@gmail.com", 1, 1, "2020-01-01"),
("Jane Smith", "jane.smith@gmail.com", 2, 2, "2020-02-01"),
("Bob Johnson", "bob.johnson@gmail.com", 3, 3, "2020-03-01");