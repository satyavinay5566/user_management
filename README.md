# HW-10 Event Manager Company: Software QA Analyst/Developer Onboarding Assignment

Welcome to the Event Manager Company! As a newly hired Software QA Analyst/Developer and a student in software engineering, you are embarking on an exciting journey to contribute to our project aimed at developing a secure, robust REST API that supports JWT token-based OAuth2 authentication. This API serves as the backbone of our user management system and will eventually expand to include features for event management and registration.

## Setup and Preliminary Steps
1. Fork the Project Repository: Fork the project repository to my own GitHub account. 

2. Clone the Forked Repository: Clone the forked repository to our local machine using the git clone command. This creates a local copy of the repository on our computer, enabling we  make changes and run the project locally.
- git clone git@github.com:your-username/HW-10_event_manager.git

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
- change file https://github.com/nisha2110/HW-10_event_manager_final/blob/main/tests/test_schemas/test_user_schemas.py
- Link https://github.com/nisha2110/HW-10_event_manager_final/blob/main/1-1-validation.PNG

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
 - ![pytest-run](https://github.com/user-attachments/assets/966deb6e-11f4-49ed-9ffb-101fea816cc3)

 4. Missing Token Fixure:
  - Developed pytest fixtures to generate access tokens for various roles like Users, Admins, Managers.
    These fixtures facilitate authentication for tests, ensuring seamless execution of all tests requiring authenticated access while enhancing the efficiency and maintainability of the testing process.
    change file: https://github.com/nisha2110/HW-10_event_manager_final/blob/main/tests/test_conftest.py

 5. Password Validation:
 -  Standard password Rules set  minimum length, at least one upper case, lower case, numbers, and special character and and properly hashing passwords before storing them in the database.
 - link https://github.com/nisha2110/HW-10_event_manager_final/blob/main/app/schemas/user_schemas.py

 ## Testing and Coverage
 - Comprehensive testing was performed using pytest to ensure a high degree of confidence in the application:
 - I Achieved 93% test coverage.
 - https://github.com/nisha2110/HW-10_event_manager_final/actions/runs/12152417576/job/33888787582

 - ![pytest](https://github.com/user-attachments/assets/1f1b54c6-d573-43cb-9dd9-b47d3aba5c7e)

 ## Pytest coverage:
 
 ![testcoverage](https://github.com/user-attachments/assets/cab7844c-434c-4453-b8d0-6293d90c8a1e)

 ## DockerHub Image Link:
 - https://hub.docker.com/repository/docker/nishi2110/hw-10_eventmanager/general
 - ![docker-hub](https://github.com/user-attachments/assets/e55b90c5-c4cf-463a-ad25-f2da5ea09723)

 
 ## Learning this project:
 Through this project, I gained valuable insights into the product lifecycle and the process of building production-ready applications. Here are my key takeaways:
- Testing is Essential at Every Stage
- This project reinforced the importance of continuous testing. Running pytest after each change allowed me to catch bugs early,       identify problematic areas in the application, and address issues promptly. Analyzing test results made debugging more straightforward and efficient, ensuring the application maintained its expected functionality throughout development.
- Coordinating my work with the project criteria required me to go over the instructor's video and project README several times. This procedure made sure I kept on course, understood the expectations completely, and completed the job as planned.



