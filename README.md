# Institute-Management-System
Institute Management System is a web application created to keep track of all institute records.
Working:-
With URL you will visit home page of institute and can view 3 options for login that is Faculty Login, Student Login and Admin Login.

Admin login is main module its username and password is by default given into system. Admin can enroll students and faculties and can register courses. Admin can also update details of students and faculties.

With Student login you can view your attendance, courses,marks, can enroll in courses, can send imp messages to teachers and can also view notices. 

With faculty login you can view student details, can mark student attendance, add marks for subjects, send imp messages to students, and can also upload and view notices.



Brief details are as follows:-
Architectural Structure:-
Modules:-

With URL you will visit home page of institute and can view 3 options for login that is Faculty Login, Student Login and Admin Login
  

* Admin Module
With admin Login option on Home Page, we can enter in this module, by entering correct username and password.
It contains following sub-modules:-
* Home:-
At home page we have displayed student details and Faculty Details for admin to refer.
Register Faculty:-
In this we have given Faculty Registration Form. So that admin can register particular faculty by filling this form.
Register Student
In this we have given Student Registration Form. So that admin can register particular student by filling this form.

* Check Notices
Here admin can check notices uploaded by faculty.

* Faculty Details
Here with username of faculty, admin can fetch and view entire faculty details

* Student Details
Here with username of student, admin can fetch and view entire student details


* Register Course
In this we have given Course Registration Form. So that admin can register particular course by filling this form.


* Course Details
Here with Course ID which is given in course registration form, admin can fetch and view entire Course details.


* Sign out
With this you will be redirected to home page, and will get sign out from your account.

* Faculty Module
With Faculty Login option on Home Page, we can enter in this module, by entering correct username and password.
It contains following sub-modules:-
* Home:-
At home page we have displayed Faculty Details of Faculty which is currently Logged In.
Upload Attendance:-
Here Faculty can mark attendance of students for particular subject. Here we have provided option where faculty can choose particular subject and can view students enrolled in it and can mark their attendance.
Upload Marks
Here Faculty can upload marks of students for particular subject. Here we have provided options where faculty can choose particular subject and can view students enrolled in it and can give them marks.

* Upload Notices
Here Faculty can upload notices with given option. And we also provided option to view uploaded notices here.

* Chat Room
Here Faculty can select particular student and can send important message to him/her. Faculty can also receive important messages from students here.



* Sign out
With this you will be redirected to home page, and will get sign out from your account.
Student  Module
With Student Login option on Home Page, we can enter in this module, by entering correct username and password.
It contains following sub-modules:-
* Home:-
At home page we have displayed Student Details which student is currently Logged In. Student will also get information of attendance for enrolled class, whether he/she will be eligible for examination or not. 
Check Attendance:-
Here student can get exact detailed information about attendance for particular subject. 
Check Marks
Here student can check marks for particular subject..

* Notices
Student can view uploaded notices here.

* Register Course
Student can register particular course here which he/she desires with course ID. 
Chat Room
Here Student can select particular faculty and can send important message to respected faculty. Faculty can also send important messages to students here.


* Sign out
With this you will be redirected to home page, and will get sign out from your account.

Development Details
Technology Used:- jsp/servlet
Language:- Java
Frontend:- Html,/CSS embedded with JSP tags
Backend:- servlet
Database at backend:- mySQL
Web-Server:- GlassFish Server 5.1.0
Development Environment:- Apache NetBeans IDE 12.0
Hardware:- Windows 10 64 bit, RAM:-8GB, Intel CORE i5 8th Gen processor. 
