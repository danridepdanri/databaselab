IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Clients')
BEGIN
    CREATE TABLE Clients (
        client_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    contact_phone VARCHAR(20),
    email VARCHAR(50)
    );
END
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Service_Types')
BEGIN
   CREATE TABLE Service_Types (
    service_type_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
END
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Services')
BEGIN
    CREATE TABLE Services (
    service_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    service_type_id INTEGER,
    FOREIGN KEY (service_type_id) REFERENCES Service_Types(service_type_id)
);
END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Executors')
BEGIN
    CREATE TABLE Executors (
    executor_id INTEGER PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    contact_phone VARCHAR(20),
    email VARCHAR(50)
);
END
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Service_Provision')
BEGIN
   CREATE TABLE Service_Provision (
    service_provision_id INTEGER PRIMARY KEY,
    client_id INTEGER,
    executor_id INTEGER,
    service_id INTEGER,
    cost DECIMAL(10,2) NOT NULL,
    provision_date DATE NOT NULL,
    FOREIGN KEY (client_id) REFERENCES Clients(client_id),
    FOREIGN KEY (executor_id) REFERENCES Executors(executor_id),
    FOREIGN KEY (service_id) REFERENCES Services(service_id)
);
END



