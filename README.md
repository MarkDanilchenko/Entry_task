## Description
This is a Django test project using MySQL and Docker.


## Launch instructions


1. Clone repository to your local folder;
2. Copy dev.env to .env file: ```cp dev.env .env```;
3. Open and follow the instructions in the new created .env file;
4. For this step you should already have installed Docker and docker-compose on your PC:
- make sure You are in project folder: ```cd '.../project_folder' ```;
- Run docker-compose: ```docker-compose up --build```;
- Installation can take some time, it depends on your PC resources;
- After the installation is completed, the server will start automatically on 0.0.0.0:8900;
- Open app using http://0.0.0.0:8900/ in your browser;
5. The superuser has been already created;
- You can login under current superuser using standart credentials: ```login: admin; pass: 12345admin```;
- For password change use: ```cd '.../project_folder' && python3 manage.py changepassword admin```
- Or You can manually create superuser for Your own purpose: ```cd '.../project_folder' && python3 manage.py createsuperuser``` ;
6. Note that DataBase - MySQL;
7. To stop the server: ```Ctrl+C```;
8. To completely remove all created docker containers, images and volumes: ```docker-compose down --volumes```.

**p.s.:**

 --> error.log <-- : contains error messages that may cause the application to be interrupted or lead to undesirable results. 
Available in root folder after successfull app launch.

### Screenshots 

1. Main page (desktop/phone)
![Main page - desktop](screenshots/ScreenShot_1.png)
![Main page - phone](screenshots/ScreenShot_2.png)

2. Select part (desktop/phone)
![Select part desktop](screenshots/ScreenShot_3.png)
![Select part phone](screenshots/ScreenShot_4.png)

3. Data display
![Data display](screenshots/ScreenShot_5.png)

4. Data edit
![Data edit](screenshots/ScreenShot_6.png)

5. Empty data
![Empty data](screenshots/ScreenShot_7.png)

6. Add data
![Add data](screenshots/ScreenShot_8.png)