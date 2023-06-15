# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  2.7.1

* Rails version "~> 7.0.4", ">= 7.0.4.2"


# TASK EXPLANATION:

I implemented this code few days ago just to test how can i access any user email from external application.
In this task following features are implemented

1. User can login using their email address but he has to first create a password from their gmail account.( This is only implemented for gmail right now).
2. after login, user will be redirected to their an "inbox" page where he can check all his emails.
3. On onbox page i added a link to " send email" to send an email to any other email address.
4. These features can only be accessible after login.
5. Basic validations are implemented.

## How to run this:
Setup ruby on rails environment with above mentioned versions
1. Clone this repo
2. run "bundle install"
3. run db:setup and run db:migrate
4. run "rails s"
5. Goto the webpage http://localhost:3000/ (incase if other port number please use your port number instead of 3000)

   TEST SOLUTION 🎊
