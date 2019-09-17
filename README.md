# README

THE EVENT BOOKING APP - SUMMARY

The Data Model

The data model consists of three tables. These, together with their attributes are as follows:

•	Users
    •	full_name - the full name of a user
    •	email  - the email address of a user
•	Events
    •	name - name of event
    •	price - the cost of an event ticket
    •	start_at - the start date and time of the event
    •	alloted_tickets - all tickets allocated for the event
    •	sold_out_tickets - all tickets sold for the event
•	Bookings
    •	user_id - id of the user making the booking
    •	event_id - id of the even being booked
    •	tickets - number of tickets booked
    •	price - total amount paid for the booking

High Level features


•	Get information about the quantity of tickets available for the event
![Screen Shot 2019-09-16 at 10 22 52 AM](https://user-images.githubusercontent.com/14811982/65028205-fcdab400-d93b-11e9-97d3-778bda0ce19b.png)


•	Pay for an event

•	when payment_error issued
![Screen Shot 2019-09-16 at 10 26 43 AM](https://user-images.githubusercontent.com/14811982/65028249-10861a80-d93c-11e9-9ae9-390b88403f5a.png)

•	when card_error issued
![Screen Shot 2019-09-16 at 10 29 16 AM](https://user-images.githubusercontent.com/14811982/65028315-2d225280-d93c-11e9-96c0-17306dbc2015.png)


•	when payment successful
![Screen Shot 2019-09-16 at 10 30 51 AM](https://user-images.githubusercontent.com/14811982/65028428-53e08900-d93c-11e9-85f2-200030fa3184.png)

•	when tickets are sold out
![Screen Shot 2019-09-16 at 10 33 35 AM](https://user-images.githubusercontent.com/14811982/65028503-7377b180-d93c-11e9-8d56-d98bdcebc3cf.png)

• Communication with Front End

When a request is made by the front end api, for example, to purchase tickets, the app returns a json object with bookings data with the following attributes:

![Screen Shot 2019-09-16 at 10 36 57 AM](https://user-images.githubusercontent.com/14811982/65033401-35cb5680-d945-11e9-85f8-a011bcd4cf5b.png)
