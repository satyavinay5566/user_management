# The User Management System 

The User Management System Final Project is designed as a comprehensive, hands-on opportunity to explore the full development lifecycle of a real-world software application. This system manages users, authentication, and roles, offering a practical implementation of backend development best practices using Python, FastAPI, SQLAlchemy, PostgreSQL, and modern authentication mechanisms like JWT. Whether you're defining schemas, managing secure login flows, or integrating third-party APIs (like email or OpenAI), this project gives you the complete playground to sharpen your backend skills in a robust and scalable way.

At its core, the project emphasizes clean architecture and modular design, encouraging the use of services, routers, models, and configuration files in an organized manner. By applying principles like environment-based configuration management with pydantic-settings, asynchronous database operations, and test-driven development with Pytest, the project mimics what you’d encounter in professional software engineering teams. It’s more than just CRUD—it’s about security, scalability, and maintainability.

More than a coding assignment, this final project is a stepping stone into real-world application building. Whether you're aiming to ace your coursework, impress recruiters, or contribute to open-source communities, this project encapsulates the critical components of a production-grade backend system. So buckle up—it’s not just an academic task; it’s your launchpad to becoming a confident, industry-ready developer.

## Setup and Preliminary Steps
1. Fork the Project Repository: Fork the project repository to my own GitHub account. 

2. Clone the Forked Repository: Clone the forked repository to our local machine using the git clone command. This creates a local copy of the repository on our computer, enabling we  make changes and run the project locally.
- git clone git@github.com:your-username/user_management.git

3. Verify the Project Setup: Follow the steps in the instructor video to set up the project using Docker. Docker allows our to package the application with all its dependencies into a standardized unit called a container. Verify that you can access the API documentation at http://localhost/docs and the database using PGAdmin at http://localhost:5050.

## Commands
- docker compose up --build
- docker compose exec fastapi pytest
- docker compose exec fastapi pytest --cov
- docker compose exec fastapi pytest tests/test_services/test_user_service.py::test_list_users
- Need to apply database migrationss: docker compose exec fastapi alembic upgrade head
- Creating database migration: docker compose exec fastapi alembic revision --autogenerate -m 'added admin'

## Issues to Address:
 
1. Validation Error :
 - The errors in tests indicate mismatches between the fields in test data (user_base_data, user_create_data, etc.) and the actual schema definitions (UserBase, UserCreate, UserUpdate, etc.).
 KeyError: Indicates that the expected keys (nickname, first_name, etc.) are missing from the test data.
 ValidationError: Indicates that the input data does not match the expected schema.

- Fix Error:
- change file https://github.com/satyavinay5566/user_management/blob/main/tests/test_schemas/test_user_schemas.py

2. Nickname and username Validation:
- Resolved the issue with auto-generating nicknames during user registration. The manually generated nickname is now passed as an argument to the generate_nickname method, ensuring it updates correctly in the database.
- Addressed the duplicate nickname problem during registration. Implemented a validation check to ensure all nicknames are unique before saving them to the database.

3. SMTP Mail service mailtrap 
- Error:
   - FAILED tests/test_email.py::test_send_markdown_email - smtplib.SMTPServerDisconnected: Connection unexpectedly closed FAILED tests/test_services/test_user_service.py::test_create_user_with_valid_data - smtplib.SMTPServerDisconnected: Connection unexpectedly closed FAILED tests/test_services/test_user_service.
  
  - test_register_user_with_valid_data - smtplib.SMTPServerDisconnected: Connection unexpectedly closed

- Fix:
   
- SMTP credentials and configurations are stored securely, using .env  files add smtp mailtrap credentials and  Resolved the issue with missing email validation. Implemented logic to ensure the email field checks for invalid formats, such as missing email, username, or domain name, to prevent invalid email addresses from being accepted.
- Resolved :Set Up a Mailtrap Account Go to Mailtrap and create a new account and go to my inbox and click default myinbox and copy smtp username and password and paste  .env file. 
 
 - All pytests successfully Run
 - CMDcommand Run: docker compose exec fastapi pytest tests

 4. Missing Token Fixure:
  - Developed pytest fixtures to generate access tokens for various roles like Users, Admins, Managers.
    These fixtures facilitate authentication for tests, ensuring seamless execution of all tests requiring authenticated access while enhancing the efficiency and maintainability of the testing process.

 5. Password Validation:
 -  Standard password Rules set  minimum length, at least one upper case, lower case, numbers, and special character and and properly hashing passwords before storing them in the database.

 ## Testing and Coverage
 - Comprehensive testing was performed using pytest to ensure a high degree of confidence in the application:
 - I Achieved 93% test coverage.

 
 ## Learning this project:
 Through this project, I gained valuable insights into the product lifecycle and the process of building production-ready applications. Here are my key takeaways:
- Testing is Essential at Every Stage
- This project reinforced the importance of continuous testing. Running pytest after each change allowed me to catch bugs early,       identify problematic areas in the application, and address issues promptly. Analyzing test results made debugging more straightforward and efficient, ensuring the application maintained its expected functionality throughout development.
- Coordinating my work with the project criteria required me to go over the instructor's video and project README several times. This procedure made sure I kept on course, understood the expectations completely, and completed the job as planned.



