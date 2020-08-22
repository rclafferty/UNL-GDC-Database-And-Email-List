# UNL GDC Database And Email List
 
This database was created for the purpose of aiding the University of Nebraska-Lincoln Game Development Club (UNL GDC) officers in tracking member information, meeting attendance, and event attendance. Coupled with the database, an email script was also created to read from the database as the club's listserv system.

## Database

The club database was primarily created as a class project with the intent to build a scalable system for the UNL GDC officers to track member information. The data collected includes the members' name, email address, major, year in school, individual meeting attendance, and their event attendance. More information about the database can be found in the final report: `Database_Systems_Final_Project.pdf`.

All files for the database can be found in the `Database/` folder.

## Email Script

The club's listserv was a custom-built Python script utilizing the smtplib library. It reads from several files for logging into the database, logging into the sender's email address, and (if applicable) logging into Twitter to post directly to social media.