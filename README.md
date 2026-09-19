# 🏦 Bank Account Management System

A web-based **Bank Account Management System** developed using Java and Spring MVC. This application allows users to create bank accounts, deposit and withdraw money, search account details, and view transaction history.

The project follows the **MVC (Model–View–Controller) architecture** and uses Spring JDBC for database operations.

---

## 📌 Project Overview

### Project Name

Bank Account Management System

### Project Type

Spring MVC Web Application

### Architecture

MVC Architecture

### Main Purpose

To manage customer information, bank accounts, and financial transactions through a web application.

---

## 🚀 Features

* Create customer accounts
* Create bank accounts
* Deposit money
* Withdraw money
* Search account details
* View transaction history
* Check account balance
* Maintain transaction records
* Validate insufficient balance during withdrawal

---

## 🛠️ Technologies Used

| Technology    | Purpose                         |
| ------------- | ------------------------------- |
| Java          | Application programming         |
| Spring MVC    | Web application framework       |
| Spring JDBC   | Database operations             |
| MySQL         | Database management             |
| JSP           | User interface                  |
| Bootstrap     | Responsive UI design            |
| Maven         | Dependency and build management |
| Apache Tomcat | Application server              |
| JUnit         | Testing                         |

---

## 📂 Project Structure

```text
BankAccountWebApp/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── in/sp/
│   │   │       ├── config/
│   │   │       │   └── SpringConfig.java
│   │   │       ├── controller/
│   │   │       ├── dao/
│   │   │       ├── model/
│   │   │       └── service/
│   │   │
│   │   ├── webapp/
│   │   │   ├── WEB-INF/
│   │   │   │   ├── web.xml
│   │   │   │   └── views/
│   │   │   └── index.jsp
│   │
│   └── test/
│
├── pom.xml
└── README.md
```

### Package Responsibilities

| Package      | Responsibility                          |
| ------------ | --------------------------------------- |
| `config`     | Spring configuration and database setup |
| `controller` | Handles HTTP requests                   |
| `service`    | Contains business logic                 |
| `dao`        | Performs database operations            |
| `model`      | Contains data model classes             |
| `views`      | Contains JSP pages                      |

---

## ⚙️ Prerequisites

Install the following software before running the project:

* JDK 17 or above
* Maven 3.9+
* MySQL 8
* Apache Tomcat
* Eclipse, Spring Tool Suite, or IntelliJ IDEA
* Git (optional, for version control)

---

## 🗄️ Database Configuration

### 1. Create the Database

Open MySQL and execute:

```sql
CREATE DATABASE bank_db;

USE bank_db;
```

### 2. Create the Customers Table

```sql
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150),
    phone VARCHAR(20)
);
```

### 3. Create the Bank Accounts Table

```sql
CREATE TABLE bank_accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_number VARCHAR(50) UNIQUE,
    balance DOUBLE,
    status VARCHAR(50),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);
```

### 4. Create the Transactions Table

```sql
CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DOUBLE,
    balance_after DOUBLE,
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (account_id)
        REFERENCES bank_accounts(account_id)
);
```

---

## 🔧 Database Connection Configuration

Open the following file:

```text
src/main/java/in/sp/config/SpringConfig.java
```

Configure the database connection:

```java
@Bean
public DataSource dataSource() {

    DriverManagerDataSource dataSource =
            new DriverManagerDataSource();

    dataSource.setDriverClassName(
            "com.mysql.cj.jdbc.Driver"
    );

    dataSource.setUrl(
            "jdbc:mysql://localhost:3306/bank_db"
    );

    dataSource.setUsername("root");
    dataSource.setPassword("your_password");

    return dataSource;
}
```

### Verify the Following

* MySQL server is running.
* Database name is `bank_db`.
* Username and password are correct.
* MySQL JDBC driver is included in `pom.xml`.
* Database tables have been created.

---

## 🌐 Spring MVC Configuration

The application uses Spring MVC with `DispatcherServlet`.

The servlet configuration is located at:

```text
src/main/webapp/WEB-INF/web.xml
```

The configuration points to:

```text
in.sp.config.SpringConfig
```

### View Resolver

The view resolver uses the following configuration:

```text
Prefix: /WEB-INF/views/
Suffix: .jsp
```

Therefore, JSP pages must be placed inside:

```text
src/main/webapp/WEB-INF/views/
```

For example:

```text
WEB-INF/views/
├── home.jsp
├── createAccount.jsp
├── deposit.jsp
├── withdraw.jsp
└── searchAccount.jsp
```

---

## 🏗️ Application Architecture

```text
User
  │
  ▼
JSP View
  │
  ▼
Controller
  │
  ▼
Service Layer
  │
  ▼
DAO Layer
  │
  ▼
Spring JDBC
  │
  ▼
MySQL Database
```

### Controller Layer

Handles HTTP requests and communicates with the service layer.

Example controllers:

* `HomeController`
* `CreateAccountController`
* `SearchAccountController`
* `DepositController`
* `WithDrawController`
* `LoadAccount`

### Service Layer

Contains the application's business logic.

Examples:

* Validating deposit amounts
* Checking withdrawal eligibility
* Checking account balance
* Processing account-related operations

### DAO Layer

Performs database operations using Spring JDBC.

Example:

```text
BankAccountDaoImpl
```

Responsibilities:

* Create customer and bank account records
* Retrieve account details
* Deposit money
* Withdraw money
* Save transactions
* Retrieve transaction history

### Model Layer

Contains Java classes representing application data.

Examples:

* `Customer`
* `BankAccount`
* `Transaction`

### View Layer

Contains JSP pages used to display information and collect user input.

---

## 💰 Application Features

### 1. Create Account

The user provides:

* First name
* Last name
* Email
* Phone number

The application:

1. Saves customer information.
2. Creates a new bank account.
3. Generates an account number.
4. Sets the initial balance to `0`.
5. Sets the initial status to `EMPTY`.

### 2. Deposit Money

The user enters:

* Account number
* Deposit amount

The application:

1. Finds the account.
2. Validates the deposit amount.
3. Updates the account balance.
4. Records the transaction.
5. Updates the account status when applicable.

### 3. Withdraw Money

The user enters:

* Account number
* Withdrawal amount

The application:

1. Finds the account.
2. Checks the available balance.
3. Rejects the withdrawal if funds are insufficient.
4. Updates the balance when sufficient funds exist.
5. Records the withdrawal transaction.

### 4. Search Account

The user searches using an account number.

The application displays:

* Customer information
* Account number
* Account balance
* Account status
* Related account details

### 5. Transaction History

The application retrieves transactions associated with a bank account.

Transaction details include:

* Transaction ID
* Account ID
* Transaction type
* Transaction amount
* Balance after transaction
* Transaction date

---

## ▶️ Build the Project

Open a terminal in the project directory:

```bash
cd BankAccountWebApp
```

Run the Maven build command:

```bash
mvn clean package
```

The generated WAR file will be available inside:

```text
target/
```

Example:

```text
target/BankAccountWebApp.war
```

---

## 🚀 Run the Application

### Method 1: Deploy Using Apache Tomcat

1. Build the project using Maven.
2. Locate the generated WAR file.
3. Copy the WAR file into the Tomcat `webapps` directory.
4. Start the Tomcat server.
5. Open the application in your browser.

```text
http://localhost:8080/BankAccountWebApp/
```

> Replace the port number or context path if your Tomcat configuration is different.

### Method 2: Run Using Eclipse or IntelliJ IDEA

1. Import the project as a Maven project.
2. Configure the application server.
3. Add the project to the Tomcat server.
4. Start the server.
5. Open the application URL in your browser.

---

## 🧪 Testing

The project can use JUnit to test application logic.

Possible testing areas:

* Account creation
* Deposit validation
* Withdrawal validation
* Insufficient balance
* Account search
* Service-layer business logic

Test files can be placed inside:

```text
src/test/
```

---

## ❗ Common Issues and Solutions

### Database Connection Failure

Check:

* MySQL server status
* Database name
* Username and password
* MySQL JDBC driver
* Database connection URL

### 404 Page Not Found

Check:

* `web.xml` configuration
* `DispatcherServlet` mapping
* Controller request mapping
* Correct application context path
* JSP file location

### JSP Page Not Found

Confirm that:

```text
/WEB-INF/views/
```

is the configured prefix and that the required JSP file exists in that directory.

### Maven Build Failure

Check:

* Installed Java version
* Maven installation
* Dependencies in `pom.xml`
* Compiler configuration

Try:

```bash
mvn clean install
```

### Tomcat Deployment Problems

Check:

* Whether Tomcat is running
* Whether the project is deployed
* Whether another application uses the same port
* Whether the application context path is correct

---

## 🎯 Learning Objectives

This project provides practical experience with:

* Spring MVC architecture
* Dependency injection
* Spring JDBC
* MySQL database integration
* DAO and service layers
* JSP page rendering
* CRUD operations
* Banking business logic
* Maven project management
* Unit testing
* Git and GitHub

---

## 🔮 Future Improvements

Possible future enhancements:

* User authentication and authorization
* Spring Security integration
* Password encryption
* Improved input validation
* Transfer money between accounts
* Pagination for transaction history
* REST API using Spring Boot
* Frontend integration using React or Angular
* Improved exception handling
* Automated testing

---

## 👨‍💻 Author

**Bishnu Chaudhary**

This project was created for learning and practicing Java web development, Spring MVC, Spring JDBC, and MySQL.
