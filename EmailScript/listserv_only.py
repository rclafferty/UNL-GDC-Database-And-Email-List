import smtplib
import getpass
import mysql.connector
import os
import time
from pathlib import Path
import mysql.connector
from mysql.connector import Error

RECIPIENTS = []
SINGLE_LINE_BREAK = '\n'
BLANK_LINE = '\n\n'

def get_file_recipients():
    filename = 'backup/emails.txt'

    inFile = None
    lines = None
    try:
        # Open file
        inFile = open(filename, 'r')
        
        # Get emails
        lines = inFile.readlines()

        # Close file
        inFile.close()
    except Error as e:
        print("Error while reading emails\n", e)
        exit()

    for line in lines:
        if line:
            email = line.strip()
            
            if len(email) > 0:
                print(email)
                RECIPIENTS.append(email)


def get_recipients(local_send=True):
    database_filename = 'databaseInfo.txt'
    if not local_send:
        database_filename = 'gdc_' + database_filename

    database_file = None
    try:
        # Open file
        database_file = open(database_filename, 'r')
        
        # Extract login information
        host_info = database_file.readline().rstrip('\n')
        database_info = database_file.readline().rstrip('\n')
        user_info = database_file.readline().rstrip('\n')
        password_info = database_file.readline().rstrip('\n')

        # Close file
        database_file.close()
    except Error as e:
        print("Error while reading database info\n", e)
        exit()

    try:
        mysqlConnection = mysql.connector.connect(host=host_info, database=database_info, user=user_info, password=password_info)
        cursor = mysqlConnection.cursor()

        query = 'SELECT * FROM Member'
        cursor.execute(query)
        records = cursor.fetchall()

        email_query = 'SELECT email FROM Emails WHERE memberID = '

        print('Sending to the following emails: ')
        # For each person P
        for row in records:
            userID = row[0]
            this_email_query = email_query + str(userID)

            cursor.execute(this_email_query)
            email_records = cursor.fetchall()
            
            for email_row in email_records:
                email = email_row[0]
                print(email)
                RECIPIENTS.append(email)
        
    except Error as e:
        print("Error connecting to MySQL\n", e)

def get_test_recipients(local_send=True):
    database_filename = 'databaseInfo.txt'
    if not local_send:
        database_filename = 'gdc_' + database_filename

    database_file = None
    try:
        # Open file
        database_file = open(database_filename, 'r')
        
        # Extract login information
        host_info = database_file.readline().rstrip('\n')
        database_info = database_file.readline().rstrip('\n')
        user_info = database_file.readline().rstrip('\n')
        password_info = database_file.readline().rstrip('\n')

        # Close file
        database_file.close()
    except Error as e:
        print("Error while reading database info\n", e)
        exit()

    try:
        mysqlConnection = mysql.connector.connect(host=host_info, database=database_info, user=user_info, password=password_info)
        cursor = mysqlConnection.cursor()

        query = 'SELECT * FROM `Members` WHERE firstName LIKE \'Jaden\' AND lastName LIKE \'Goter\''
        cursor.execute(query)
        records = cursor.fetchall()

        email_query = 'SELECT email FROM Emails WHERE memberID = '

        print('Sending to the following emails: ')
        # For each person P
        for row in records:
            userID = row[0]
            this_email_query = email_query + str(userID)

            cursor.execute(this_email_query)
            email_records = cursor.fetchall()
            
            for email_row in email_records:
                email = email_row[0]
                print(email)
                RECIPIENTS.append(email)
        
    except Error as e:
        print("Error connecting to MySQL\n", e)

def get_temporary_members(local_send=True):
    database_filename = 'databaseInfo.txt'
    if not local_send:
        database_filename = 'gdc_' + database_filename

    database_file = None
    try:
        # Open file
        database_file = open(database_filename, 'r')
        
        # Extract login information
        host_info = database_file.readline().rstrip('\n')
        database_info = database_file.readline().rstrip('\n')
        user_info = database_file.readline().rstrip('\n')
        password_info = database_file.readline().rstrip('\n')

        # Close file
        database_file.close()
    except Error as e:
        print("Error while reading database info\n", e)
        exit()

    try:
        mysqlConnection = mysql.connector.connect(host=host_info, database=database_info, user=user_info, password=password_info)
        cursor = mysqlConnection.cursor()

        query = 'SELECT * FROM TemporaryMember'
        cursor.execute(query)
        records = cursor.fetchall()

        print('Sending to the following emails: [new members]')
        # For each person P
        for row in records:
            email = row[3]
            print(email)
            RECIPIENTS.append(email)
        
    except Error as e:
        print("Error connecting to MySQL\n", e)

def get_login_info():
    # Get the email and password from user
    from_email = input("Email: ")
    from_password = getpass.getpass()

    return [from_email, from_password]

def send_email(email_parts, test_send=False, permanent_members=True, temp_members=True):
    RECIPIENTS.clear()

    if test_send:
        get_test_recipients()
    else:
        #if permanent_members:
        #    get_recipients()

        #if temp_members:
        #    get_temporary_members()

        get_file_recipients()

    subject_format = 'Subject: {}\n\n{}\n\n{}\n\n{}\n\n{}'
    SUBJECT_TAG = 'UNL GDC'
    email = ''

    # Not enough parts
    if len(email_parts) < 5:
        print('ERROR: Email does not have enough parts. (', len(email_parts), ')')
        exit()

    # Missing PS
    elif len(email_parts) == 5:
        subject_text = email_parts[0]
        greeting = email_parts[1]
        body = email_parts[2]
        tag = email_parts[3]
        signature = email_parts[4]

        subject_heading = '[' + SUBJECT_TAG + '] ' + subject_text
        email = subject_format.format(subject_heading, greeting, body, tag, signature)
        
    # Includes PS
    elif len(email_parts) == 6:
        subject_text = email_parts[0]
        greeting = email_parts[1]
        body = email_parts[2]
        tag = email_parts[3]
        signature = email_parts[4]
        ps = email_parts[5]

        subject_heading = '[' + SUBJECT_TAG + '] ' + subject_text
        subject_format = subject_format + '\n\n{}'
        email = subject_format.format(subject_heading, greeting, body, tag, signature, ps)

    # Open/Start SMTP Protocol
    mailserver = smtplib.SMTP('smtp.office365.com', 587)
    mailserver.ehlo()
    mailserver.starttls()

    # Login
    from_email, from_password = get_login_info()
    mailserver.login(from_email, from_password)

    for i in range(len(RECIPIENTS)):
        # Get email
        recipient_email = RECIPIENTS[i]
        print(recipient_email)

        # Send email
        mailserver.sendmail(from_email, recipient_email, email)

    # Logout
    mailserver.quit()

# Main method
if __name__ == "__main__":
    test_send = True
    include_temp_members = True
    include_permanent_members = True

    # Header -- Formats to "[UNL GDC] SUBJECT_TEXT"
    subject = 'Smash-Em-Up Social Event'

    ## Body
    greeting = 'Hi all,'
    body = 'At last week\'s meeting, we determined that TODAY would be a social LAN/Console party event. Everyone is encouraged to attend. One officer will be bringing a Nintendo Switch so we can play Super Smash Bros. Otherwise, we will be playing LAN games via laptops. Same time, same place as usual. Hope to see you all there!'
    tag = 'If you have questions, please let me know.'

    # Signature
    name = 'Casey Lafferty'
    position = 'UNL GDC President'
    website = 'https://go.unl.edu/gamedev'

    signature = name + SINGLE_LINE_BREAK + position + SINGLE_LINE_BREAK + website

    ps = ''

    email_parts = [subject, greeting, body, tag, signature, ps]

    send_email(email_parts, test_send, include_permanent_members, include_temp_members)