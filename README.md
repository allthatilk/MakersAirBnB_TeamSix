# The Most Excellent Team Six AirBnB

## Stuff so far

* User Stories
* MVP
* Implementation technologies decided

# User Stories
------
We first worked out the following user stories that we need to implement.

```
As a user,
So I can advertise a space,
I want to be able to add a space on AirBnb

As a user,
So I can accurately advertise my spaces,
I want to add a name, description and price to my space

As a user,
So I can choose where I want to stay,
I want to see a list of spaces

As AirBnb,
So I can provide a secure and reputable service
I want my users to be able to sign up

As a user,
So I can have a secure experience and 'own' my spaces and bookings,
I need to be able to sign up in order to access these services

As a user,
So I can avoid disappointing my customers,
I want to show which dates my space is available or unavailable

As a signed-up user,
So I can get a space to stay in,
I want to be able to request to stay in a space for a night

As a user listing my space,
So I can approve bookings,
I want to be able to accept or reject them

As a listing user,
To avoid double bookings,
I want to prevent booking for unavailable dates

As a user,
So I can manage my potential customer's expectations,
I want my listing to be available on any given date until I've confirmed a booking for that date
```

We decided the minimum viable product we could present to a client would include:
- adding a space to the listings
- viewing a list of available spaces

Our MVP is available here currently: https://beastmakersbnb.herokuapp.com/

We then split into two groups of three to work on the next two user stories: allowing a user to sign up, and adding date availability to the spaces pages.


Decisions we made
----
- We deliberated for a long time about how to deal with date availability for spaces. We decided to deal with it within a separate booking class that would contain the date a property was booked on, and would be linked to that property, in a one-to-many relationship.We were then able to filter the spaces by available date using DataMapper
- The next issue was how to display availability in a calendar format on the space's landing page. We wanted to use a jQuery datepicker, and grey out unavailable dates. This meant combining ruby on the back end with Javascript - our solution was to pull the unavailable dates into an array using ruby, and have a script tag convert it to a JavaScript variable that jQuery can access.

Issues we encountered
----
- should we create new user stories for every new "sub-feature", e.g. email validation, checking for unique email address etc.
