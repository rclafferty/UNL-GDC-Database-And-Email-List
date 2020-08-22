##########################################
##### ONLY EDIT THE EDITABLE REGIONS #####
##########################################

import smtplib
import getpass
import mysql.connector
import tweepy
import os
import time
from pathlib import Path
import mysql.connector
from mysql.connector import Error

### Global variables ###

# List of recipients (email)
RECIPIENTS = []

# Formatting variables, optional to use
SINGLE_LINE_BREAK = '\n'
SPACING = '\n\n'

# Limit variables
TWITTER_MAX_LENGTH = 280

### Post tweet to Twitter ###
def post_tweet(text_of_tweet, filename, has_image=False, image_filename=''):
    # Get OAuth keys
    twitter_info_file = open(filename, 'r')

    consumer_key = twitter_info_file.readline().rstrip('\n')
    consumer_secret = twitter_info_file.readline().rstrip('\n')
    access_token = twitter_info_file.readline().rstrip('\n')
    access_secret = twitter_info_file.readline().rstrip('\n')

    twitter_info_file.close()

    auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_secret)
    api = tweepy.API(auth)

    if (has_image):
        # Post image
        os.chdir('images')
        api.update_with_media(image_filename, text_of_tweet)
    else:
        # Post Tweet
        api.update_status(text_of_tweet)

def post_tweet_as_club(text_of_tweet, has_image=False, image_filename=''):
    post_tweet(text_of_tweet, 'twitterInfo_GDC.txt', has_image, image_filename)

def post_tweet_as_self(text_of_tweet, has_image=False, image_filename=''):
    post_tweet(text_of_tweet, 'twitterInfo_Casey.txt', has_image, image_filename)

def post_tweet_as_both(text_of_tweet, has_image=False, image_filename=''):
    post_tweet_as_club(text_of_tweet, has_image, image_filename)
    post_tweet_as_self(text_of_tweet, has_image, image_filename)

def get_user_info(via_cmd=True, user_info_file=''):
    if via_cmd:
        # Get the email and password from user
        from_email = input("Email: ")
        from_password = getpass.getpass()
    else:
        # Get the email and password from file
        user_file = open(user_info_file, 'r')
        from_email = user_file.readline().rstrip('\n')
        from_password = user_file.readline().rstrip('\n')
        user_file.close()

    return [from_email, from_password]

### Archive: Read list of recipients from file ###
def get_recipients_from_file(test_send=True):
    RECIPIENTS.clear()
    filename = ''
    if test_send:
        filename = 'testEmails.txt'
    else:
        filename = 'emails.txt'

    email_file = open(filename, 'r')
    for x in email_file:
        RECIPIENTS.append(x)

### Read list of recipients from database ###
def get_recipients(test_send=True, include_temp_members=False, local_send=True):
    RECIPIENTS.clear()
    try:
        database_filename = ''
        if test_send:
            database_filename = 'databaseInfo.txt'
        elif local_send:
            database_filename = 'databaseInfo.txt'
        else:
            database_filename = 'gdc_databaseInfo.txt'

        database_file = open('databaseInfo.txt', 'r')
        host_info = database_file.readline().rstrip('\n')
        database_info = database_file.readline().rstrip('\n')
        user_info = database_file.readline().rstrip('\n')
        password_info = database_file.readline().rstrip('\n')
        database_file.close()

        mySQLconnection = mysql.connector.connect(host=host_info, database=database_info, user=user_info, password=password_info)
        cursor = mySQLconnection.cursor()

        sql_select_query = 'SELECT * FROM Member'
        sql_test_query =   'SELECT * FROM Member WHERE firstName LIKE \'Casey\' AND lastName LIKE \'Lafferty\''

        query = ''
        if test_send:
            query = sql_test_query
        else:
            query = sql_select_query

        cursor.execute(query)
        records = cursor.fetchall()

        email_query = 'SELECT emailAddr FROM Email WHERE memberID = '

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

        if include_temp_members and not test_send:
            # Add temporary members
            sql_select_query = 'SELECT * FROM TemporaryMember'

            cursor.execute(sql_select_query)
            records = cursor.fetchall()

            for row in records:
                email = row[3]
                print(email)
                RECIPIENTS.append(email)

        cursor.close()
        
    except Error as e :
        print ("Error while connecting to MySQL", e)
        exit()

def get_new_members():
    try:
        database_file = open('databaseInfo.txt', 'r')
        host_info = database_file.readline().rstrip('\n')
        database_info = database_file.readline().rstrip('\n')
        user_info = database_file.readline().rstrip('\n')
        password_info = database_file.readline().rstrip('\n')
        database_file.close()

        mySQLconnection = mysql.connector.connect(host=host_info, database=database_info, user=user_info, password=password_info)
        cursor = mySQLconnection.cursor()

        sql_select_query = 'SELECT * FROM TemporaryMember'
        query = sql_select_query

        cursor.execute(query)
        records = cursor.fetchall()

        print('Sending to the following emails: [new members]')
        # For each person P
        for row in records:
            email = row[3]
            print(email)
            RECIPIENTS.append(email)

        cursor.close()
        
    except Error as e :
        print ("Error while connecting to MySQL", e)
        exit()

### Gets login and recipients info ###
def get_setup_info(test_send, include_temp_members=False, via_cmd=True, user_info_file=''):
    get_recipients(test_send, include_temp_members)
    # get_recipients_from_file(test_send)
    user_info = get_user_info(via_cmd, user_info_file)
    return user_info

def send_temp_member_email(message_parts):
    subject_format = 'Subject: {}\n\n{}\n\n{}\n\n{}\n\n{}'
    SUBJECT_TAG = 'UNL GDC'
    MESSAGE = ''

    # Not enough parts
    if len(message_parts) < 5:
        print('ERROR: Message does not have enough parts. (', len(message_parts), ')')
        exit()

    # Missing PS
    elif len(message_parts) == 5:
        subject_text = message_parts[0]
        greeting = message_parts[1]
        body = message_parts[2]
        tag = message_parts[3]
        signature = message_parts[4]

        subject_heading = '[' + SUBJECT_TAG + '] ' + subject_text
        MESSAGE = subject_format.format(subject_heading, greeting, body, tag, signature)
        
    # Includes PS
    elif len(message_parts) == 6:
        subject_text = message_parts[0]
        greeting = message_parts[1]
        body = message_parts[2]
        tag = message_parts[3]
        signature = message_parts[4]
        ps = message_parts[5]

        subject_heading = '[' + SUBJECT_TAG + '] ' + subject_text
        subject_format = subject_format + '\n\n{}'
        MESSAGE = subject_format.format(subject_heading, greeting, body, tag, signature, ps)

    # Open/Start SMTP Protocol
    mailserver = smtplib.SMTP('smtp.office365.com', 587)
    mailserver.ehlo()
    mailserver.starttls()

    # Login
    from_email, from_password = get_setup_info(test_send, include_temp_members)
    RECIPIENTS.clear()
    get_new_members()
    mailserver.login(from_email, from_password)

    for i in range(len(RECIPIENTS)):
        # Get email
        recipient_email = RECIPIENTS[i]
        print(recipient_email)

        # Send email
        mailserver.sendmail(from_email, recipient_email, MESSAGE)

    # Logout
    mailserver.quit()

### Send an email ###
def send_email(message_parts, test_send=True, include_temp_members=False):
    subject_format = 'Subject: {}\n\n{}\n\n{}\n\n{}\n\n{}'
    SUBJECT_TAG = 'UNL GDC'
    MESSAGE = ''

    # Not enough parts
    if len(message_parts) < 5:
        print('ERROR: Message does not have enough parts. (', len(message_parts), ')')
        exit()

    # Missing PS
    elif len(message_parts) == 5:
        subject_text = message_parts[0]
        greeting = message_parts[1]
        body = message_parts[2]
        tag = message_parts[3]
        signature = message_parts[4]

        subject_heading = '[' + SUBJECT_TAG + '] ' + subject_text
        MESSAGE = subject_format.format(subject_heading, greeting, body, tag, signature)
        
    # Includes PS
    elif len(message_parts) == 6:
        subject_text = message_parts[0]
        greeting = message_parts[1]
        body = message_parts[2]
        tag = message_parts[3]
        signature = message_parts[4]
        ps = message_parts[5]

        subject_heading = '[' + SUBJECT_TAG + '] ' + subject_text
        subject_format = subject_format + '\n\n{}'
        MESSAGE = subject_format.format(subject_heading, greeting, body, tag, signature, ps)

    # Open/Start SMTP Protocol
    mailserver = smtplib.SMTP('smtp.office365.com', 587)
    mailserver.ehlo()
    mailserver.starttls()

    # Login
    from_email, from_password = get_setup_info(test_send, include_temp_members)
    mailserver.login(from_email, from_password)

    for i in range(len(RECIPIENTS)):
        # Get email
        recipient_email = RECIPIENTS[i]
        print(recipient_email)

        # Send email
        mailserver.sendmail(from_email, recipient_email, MESSAGE)

    # Logout
    mailserver.quit()

if __name__ == "__main__":

    ### START EDITABLE REGION -- Should not edit anything above this point ###

    test_send = False
    post_tweet_as_self = False
    post_tweet_as_club = False
    include_temp_members = False
    only_temp_members = True

    # Header -- Formats to "[UNL GDC] SUBJECT_TEXT"
    subject = ''

    ## Body
    greeting = 'Hi all,'
    body = 'Welcome back '
    tag = 'If you are interested in helping, please reach out to one of the officers and we will get you connected.'

    # Signature
    name = 'Casey Lafferty'
    position = 'UNL GDC President'
    website = 'https://go.unl.edu/gamedev'

    signature = name + SINGLE_LINE_BREAK + position + SINGLE_LINE_BREAK + website

    ps = ''

    twitter_text = ''
    twitter_image = ''

    ### END EDITABLE REGION -- Should not edit anything below this point ###

    if len(twitter_text) > TWITTER_MAX_LENGTH:
        print('Shorten the Tweet length. Current length:', len(twitter_text))
        exit()

    has_tweet = False
    if twitter_text != '':
        has_tweet = True
        has_image = os.path.isfile('images/' + twitter_image)
    
        if twitter_image != '' and not has_image:
            print('Error: Image does not exist')
            exit()

    MESSAGE_PARTS = [subject, greeting, body, tag, signature, ps]

    if only_temp_members:
        send_temp_member_email(MESSAGE_PARTS)
    else:
        send_email(MESSAGE_PARTS, test_send, include_temp_members)

    if has_tweet:
        if post_tweet_as_self and post_tweet_as_club:
            post_tweet_as_both(twitter_text, has_image, twitter_image)
        elif post_tweet_as_self:
            post_as_self(twitter_text, has_image, twitter_image)
        elif post_tweet_as_club:
            post_as_club(twitter_image, has_image, twitter_image)
        else:
            print('No tweet flag enabled')