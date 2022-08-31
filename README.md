# Jungle 

Welcome to the Jungle! A mini e-commerce application built with Rails 6.1 where you can shop from a large selection of plants.

## Features

- Signup or login to an existing account
- Add plant items to your cart and edit quantity
- Purchase orders using Stripe
- Multiple categories of plants to choose from
- Admin authentication to display and add categories and products
- Items that are no longer in stock display a sold out badge

## Quick Glimpse

### Homepage 
![Homepage](https://github.com/jeandre-visser/jungle/blob/master/docs/homepage.png)

### Products Page
![Products](https://github.com/jeandre-visser/jungle/blob/master/docs/products.png)

### Signup and Login Page
![Login](https://github.com/jeandre-visser/jungle/blob/master/docs/login.gif)

### Admin Authentication
![Admin](https://github.com/jeandre-visser/jungle/blob/master/docs/admin.gif)

### Order
![Order](https://github.com/jeandre-visser/jungle/blob/master/docs/order.gif)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Test

- Cypress
- Rspec