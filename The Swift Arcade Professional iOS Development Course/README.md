# Bankey

An application called Bankey is used to show financial data, including credit card balances, investments, and bank account balances. It includes the following features:

- [Login](#Login)
- [Onboarding](#Onboarding)
- [Account summary](#account-summary)

## Login

Welcome to Bankey. 

Please log in.

<img width="328" alt="1" src="https://github.com/patinya2001/iOS-Developer-Corses/assets/149204731/8e7760c5-15e7-481b-a4c7-5b39ceb841fc">

Your username and password must be entered in the designated fields on the login page. 

If the password is incorrect or no information is entered, a warning message will appear.

## Onboarding

Are you a new user of Bankey? If so, an application introduction page will appear on your screen.

<p>
<img width="327" alt="2" src="https://github.com/patinya2001/iOS-Developer-Corses/assets/149204731/7dc42d70-cfd3-4cf9-b9f9-289b5c153405">
<img width="325" alt="3" src="https://github.com/patinya2001/iOS-Developer-Corses/assets/149204731/47f01f34-a4b2-4288-8331-7ce3a0596a20">
<img width="330" alt="4" src="https://github.com/patinya2001/iOS-Developer-Corses/assets/149204731/f9b231f1-b3f7-462a-bce0-b7504af6cc74">
</p>

A UIPageViewController is used in the design of the onboarding page in order to display a reusable UIViewController. 

You won't see this page if you log into Bankey for the second time because UserDefaults allows the app to remember your first usage.

## Account summary

Your financial statements are displayed on an account summary page that opens on the screen after logging in or finishing the onboarding process.

<p>
<img width="349" alt="7" src="https://github.com/patinya2001/iOS-Developer-Corses/assets/149204731/f5de1e3e-18e8-4f06-a66c-e361b7135de2">
<img width="324" alt="4" src="https://github.com/patinya2001/iOS-Developer-Corses/assets/149204731/e4007457-be21-48ea-9a52-6cc00da87d41">
</p>

The account summary page uses UITableView, a scrollable view, to display financial transactions.

<img width="278" alt="5" src="https://github.com/patinya2001/iOS-Developer-Corses/assets/149204731/69388a47-0398-4c28-8b70-d8fb699a0926">

The UITableView has a header that displays a welcome message.

<img width="279" alt="6" src="https://github.com/patinya2001/iOS-Developer-Corses/assets/149204731/67ca294c-56f2-45cf-b101-c623a53abb75">

As for the table body, there is the UITableViewCell, which is a reuseable cell for displaying information including account type, account name, and current amount.

The data was fetched using the RESTful API from the instructor's web server.
