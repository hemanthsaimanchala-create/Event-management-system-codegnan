use hemanth;
create table Events(event_id int primary key,event_name varchar(20),event_type varchar(20),event_date date,
venue varchar(30),registration_fee decimal(10,2));
alter table events modify column event_name varchar(50);
select * from events;

create table participants(participant_id int primary key,participant_name varchar(20),email varchar(30),
phone varchar(20),city varchar(20));
select * from participants;


create table registrations(registration_id int primary key,event_id int,participant_id int,registration_date date,
registration_status varchar(30),foreign key(event_id)references events(event_id),foreign key(participant_id) references 
participants(participant_id));
select * from registrations;
desc registrations;

create table attendance(attendance_id int primary key,registration_id int,attendance_date date,attendance_status varchar(30),
foreign key(registration_id) references registrations(registration_id));
select * from attendance;
desc attendance;

create table  Certificates(certificate_id int primary key,registration_id int,certificate_type varchar(30),issue_date date,
foreign key(registration_id) references registrations(registration_id));

INSERT INTO Events 
(event_id, event_name, event_type, event_date, venue, registration_fee) VALUES 
(101, 'AI Summit 2026', 'Workshop', '2026-08-05', 'Hyderabad', 1500), (102, 'Cloud Computing Expo', 'Conference', '2026-08-08', 'Bengaluru', 2000), 
(103, 'Data Science Bootcamp', 'Workshop', '2026-08-12', 'Chennai', 1200), (104, 'Cyber Security Meet', 'Seminar', '2026-08-15', 'Visakhapatnam', 800), 
(105, 'Web Development Hackathon', 'Hackathon', '2026-08-18', 'Vijayawada', 500), (106, 'Machine Learning Conference', 'Conference', '2026-08-20', 'Hyderabad', 1800),
(107, 'DevOps Hands-on Lab', 'Workshop', '2026-08-23', 'Pune', 1000), (108, 'Tech Career Connect', 'Seminar', '2026-08-25', 'Kochi', 600); 


INSERT INTO Participants 
(participant_id, participant_name, email, phone, city) 
VALUES 
(201, 'Aarav', 'aarav@gmail.com', '9876501001', 'Hyderabad'), (202, 'Bhavya', 'bhavya@gmail.com', '9876501002', 'Vijayawada'), 
(203, 'Charan', 'charan@gmail.com', '9876501003', 'Visakhapatnam'), (204, 'Divya', 'divya@gmail.com', '9876501004', 'Bengaluru'), 
(205, 'Esha', 'esha@gmail.com', '9876501005', 'Chennai'), 
(206, 'Farhan', 'farhan@gmail.com', '9876501006', 'Mumbai'), (207, 'Gopi', 'gopi@gmail.com', '9876501007', 'Warangal'), 
(208, 'Harini', 'harini@gmail.com', '9876501008', 'Guntur'), 
(209, 'Ishaan', 'ishaan@gmail.com', '9876501009', 'Pune'), 
(210, 'Kavya', 'kavya@gmail.com', '9876501010', 'Kochi'), 
(211, 'Manoj', 'manoj@gmail.com', '9876501011', 'Hyderabad'), (212, 'Nandini', 'nandini@gmail.com', '9876501012', 'Bengaluru'); 

INSERT INTO Registrations 
(registration_id, event_id, participant_id, registration_date, registration_status) VALUES 
(301,101,201,'2026-07-20','Confirmed'),(302,101,202,'2026-07-21','Confirmed'), (303,102,203,'2026-07-22','Confirmed'),(304,102,204,'2026-07-23','Cancelled'), 
(305,103,205,'2026-07-24','Confirmed'),(306,103,206,'2026-07-25','Confirmed'), (307,104,207,'2026-07-26','Confirmed'),(308,104,208,'2026-07-27','Confirmed'), 
(309,105,209,'2026-07-28','Confirmed'),(310,106,210,'2026-07-29','Confirmed'), (311,106,201,'2026-07-30','Confirmed'),(312,107,211,'2026-07-31','Confirmed'), 
(313,107,212,'2026-08-01','Cancelled'),(314,108,203,'2026-08-02','Confirmed'), (315,103,201,'2026-08-03','Confirmed'),(316,105,205,'2026-08-04','Confirmed'); 

INSERT INTO Attendance 
(attendance_id, registration_id, attendance_date, attendance_status) VALUES 
(401,301,'2026-08-05','Present'),(402,302,'2026-08-05','Present'), (403,303,'2026-08-08','Present'),(404,305,'2026-08-12','Absent'), (405,306,'2026-08-12','Present'),
(406,307,'2026-08-15','Present'),
(407,308,'2026-08-15','Absent'),(408,309,'2026-08-18','Present'), (409,310,'2026-08-20','Present'),(410,311,'2026-08-20','Present'), (411,312,'2026-08-23','Present'),
(412,314,'2026-08-25','Absent'), (413,315,'2026-08-12','Present'),(414,316,'2026-08-18','Present'); 

#1. Display all events along with their event type and venue. 
select event_name,event_type,venue from events;

#2. Display the names and email addresses of participants from a particular city.
select participant_name,email,city from participants where city ='bengaluru';

#3. Update the registration fee of all workshops by 10%. 
update events set registration_fee= registration_fee*1.10 where event_type='workshop';
set sql_safe_updates=0;
select * from events;

#4. Change the registration status from Confirmed to Cancelled for a selected registration. 
update registrations set registration_status='cancelled' where registration_id=301 and registration_status='confirmed';
select * from registrations;

#5. Delete a cancelled registration. 
delete from certificates where registration_id=301;
delete from attendance where registration_id=301;
delete from registrations where registration_id=301 and registration_status='cancelled' ;
select * from registrations;

#6. Display all participant names in uppercase
select upper(participant_name) as upper_name from participants;

#7. Display event names in lowercase. 
select lower(event_name) as lower_name from events;

#8Display the first four characters of each event name.
select left(event_name,4) from events where event_name like ('____%');

#9.Concatenate the participant’s name and city into a single column.
select concat(participant_name,',',city) as participants_location from participants;

#10.Replace the word 'Conference' with 'Summit' in the event type column.
select * from events;
update events set event_type=('summit') where event_type='conference';
set sql_safe_updates=0;

#11.Display events scheduled in the current month.
select event_name,monthname(event_date ) as month from events where month(event_date)=month(current_date());

#12. Display the day name for each event date.
select dayname( event_date) as day_name,event_date from events;

#13. Calculate the number of days between the registration date and event date.
select e.event_date,r.registration_date,datediff(e.event_date,r.registration_date) as days_between 
from events e join registrations r on  e.event_id=r.event_id;

#14.Display event dates in the format DD-Month-YYYY.
select event_date,date_format(event_date,'%d-%m-%Y') from events;
#15.Display the month and year of each certificate issue date.
select certificate_id, issue_date,monthname(issue_date) as issue_month,year(issue_date) as issue_year from Certificates;

#16.Count the number of participants registered for each event.
select e.event_id, e.event_name, count(r.participant_id) as total_registrations from events e left join Registrations r on e.event_id = r.event_id 
group by e.event_id, e.event_name order by e.event_id;

#17.Find the average registration fee for each event type.
select event_type, avg(registration_fee) as avg_registration_fee from events group by event_type order by avg_registration_fee desc;

#18.Find the highest registration fee among all events
select event_id, event_name, registration_fee from events order by registration_fee desc limit 1;

#19.Find the total number of registrations for each registration status.
SELECT registration_status, COUNT(*) AS total_registrations FROM Registrations GROUP BY registration_status ORDER BY total_registrations DESC;

#20.Count the number of Present and Absent participants for each event.
select e.event_id, e.event_name, sum(case when a.attendance_status = 'Present' then 1 else 0 end) as present_count, sum(case when a.attendance_status = 'Absent' then 1 else 0 end) as absent_count
from events e join Registrations r on e.event_id = r.event_id join Attendance a on r.registration_id = a.registration_id group by e.event_id, e.event_name order by e.event_id;

#21. Display event types having more than one event.
select event_type, COUNT(*) as event_count from events group by event_type having count(*) > 1 order by event_count desc;

#22.Find the total number of certificates issued for each certificate type.
select certificate_type, count(*) as total_certificates from Certificates group by certificate_type order by total_certificates desc;

#23.SELECT p.participant_name, e.event_name
select p.participant_name, e.event_name from Participants p join Registrations r on p.participant_id = r.participant_id join events e on r.event_id = e.event_id
order by p.participant_name;

#24.Display event names, participant names, and registration dates.
select e.event_name, p.participant_name, r.registration_date  from Registrations r join events e on r.event_id = e.event_id join Participants p on r.participant_id = p.participant_id
order by r.registration_date;

#25. Display participant names, event names, attendance status, and attendance date.
Select p.participant_name, e.event_name, a.attendance_status, a.attendance_date from Attendance a join Registrations r on a.registration_id = r.registration_id
join Participants p on r.participant_id = p.participant_id join events e on  r.event_id = e.event_id order by a.attendance_date;

#26. Display participant names and the certificates they received.
select p.participant_name, c.certificate_type, c.issue_date from Certificates c join Registrations r on c.registration_id = r.registration_id join Participants p on r.participant_id = p.participant_id
order by p.participant_name;  


#27. Display event names along with their registered participants, including events with no registrations.
select e.event_name,p.participant_name from  events e left join registrations r on e.event_id=r.event_id left join participants p  on r.participant_id=p.participant_id;

#28.Display all participants and their registration details, including participants who have not registered for any event.
SELECT p.participant_id, p.participant_name,r.registration_id,r.event_id,r.registration_date,r.registration_status FROM Participants p
LEFT JOIN Registrations r ON p.participant_id = r.participant_id;


#29.Display event name, participant name, registration status, and certificate type in one result.
select e.event_name ,p.participant_name,r.registration_status ,c.certificate_type from registrations r 
join events e on e.event_id=r.event_id join participants p  on p.participant_id=r.participant_id left join certificates c on c.registration_id=r.registration_id;

#30. Participants who registered for events with a registration fee greater than the average event registration fee
SELECT distinct  p.participant_id, p.participant_name from Participants p join  Registrations r on  p.participant_id = r.participant_id join  Events e on  r.event_id = e.event_id
where e.registration_fee > (SELECT AVG(registration_fee)from Events);

#31. Find the event with the highest number of registrations
SELECT  e.event_id, e.event_name, COUNT(r.registration_id) as registration_count from  Events e left join  Registrations r on e.event_id = r.event_id
group by e.event_id, e.event_name order by registration_count desc limit 1;

#32. Participants who attended more events than the average attendance count per participant
SELECT  p.participant_id, p.participant_name, COUNT(a.attendance_id) as attendance_count from Participants p join  Registrations r on  p.participant_id = r.participant_id
join  Attendance a on  r.registration_id = a.registration_id where a.attendance_status = 'Present' group by p.participant_id, p.participant_name
having  COUNT(a.attendance_id) > (SELECT AVG(attendance_count)from  (SELECT r2.participant_id,COUNT(a2.attendance_id) as attendance_count from Registrations r2
join  Attendance a2 on r2.registration_id = a2.registration_id where a2.attendance_status = 'Present'
group by r2.participant_id) as participant_attendance);

#33. Participants who have attended at least one workshop
SELECT DISTINCT p.participant_id, p.participant_name from Participants p
join Registrations r on  p.participant_id = r.participant_id
join  Attendance a on  r.registration_id = a.registration_id join Events e on  r.event_id = e.event_id
Where  e.event_type = 'Workshop'and  a.attendance_status = 'Present';

#34. Display events that have never received a registration. 
select e.event_name from events e left join registrations r on e.event_id=r.event_id where r.registration_id is null;

#35. Create a view named Participant_Event_Details displaying participant name, event  name, event date, registration status, and attendance status. 
create view participant_event_details as select p.participant_name,e.event_name,e.event_date,r.registration_status,a.attendance_status from participants p 
join registrations r on p.participant_id=r.participant_id join events e
on e.event_id=r.event_id left join attendance a on r.registration_id=a.registration_id;

select * from participant_event_details;

#36. Create a view named Event_Attendance_Summary displaying event name, total  registrations, total present, and total absent. 
#Retrieve records from both views.
create view event_attendance_summary as select e.event_name,count(r.registration_id) as total_registration,sum(case when a.attendance_id='present' then 1 else 0 end)
as total_present,sum(case when a.attendance_id='absent' then 1 else 0 end) as total_absent from events e left join  registrations r on e.event_id=r.event_id left join 
attendance a on r.registration_id=a.registration_id group by e.event_name;
select * from event_attendance_summary;


#37. Start a transaction. Update the registration fee of an event. Create a SAVEPOINT.  Update a registration status. Roll back to the 
#SAVEPOINT and then commit the  transaction. 
begin;
update events set registration_fee=2000 where event_id=101;
savepoint f1;
update registrations set registration_status='absent' where registration_id=302;
rollback to savepoint f1;
commit;

#38. Create a stored procedure to display all registrations made by a particularparticipant. 
#• Input: participant_id 
#• Display: registration_id, event name, event date, registration date, and registration  status. 

call get_participant_registrations(201);

#39. Create a stored procedure to calculate the total number of events attended by particular participant. 
#• Input: participant_id 
#• Use the Attendance table and display the total number of Present records. 

call get_event_registrations(201);

#40. Create a trigger on the Registrations table. Whenever a registration is deleted,  automatically store the deleted registration 
#details in a Registrations_Archive table. 

create table registrations_archive(registration_id int,event_id int,participant_id int,registration_date date,registration_status varchar(50));
drop table registrations_archive;

delete from registrations where registration_id=303;

select * from registrations_archive;


#41. Create a trigger on the Attendance table. Whenever the attendance status changes,  automatically store the registration ID, 
#old status, new status, and change date in an  Attendance_History table.

create table attendance_table(attendance_id int,registration_id int,attendance_date date,attendance_status varchar(30));

update attendance set attendance_id=400 where registration_id=305;

select * from attendance_table;

