# Bankey

An application called Bankey is used to show financial data, including credit card balances, investments, and bank account balances. It includes the following features:

- [Login](#Login)
- [Onboarding](#Onboarding)
- [Account summary](#account-summary)

## Login

Welcome to Bankey. 

Please log in.



Your username and password must be entered in the designated fields on the login page. 

If the password is incorrect or no information is entered, a warning message will appear.

## Onboarding

Are you a new user of Bankey? If so, an application introduction page will appear on your screen.



A UIPageViewController is used in the design of the onboarding page in order to display a reusable UIViewController. 

You won't see this page if you log into Bankey for the second time because UserDefaults allows the app to remember your first usage.

## Account summary

Your financial statements are displayed on an account summary page that opens on the screen after logging in or finishing the onboarding process.



The account summary page uses UITableView, a scrollable view, to display financial transactions.



The UITableView has a header that displays a welcome message.



As for the table body, there is the UITableViewCell, which is a reuseable cell for displaying information including account type, account name, and current amount.

The data was fetched using the RESTful API from the instructor's web server.
