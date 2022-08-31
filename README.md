# Jungle

Welcome to the Jungle! My mini e-commerce web app for the Lighthouse Labs Web Development bootcamp.

## About

This app was built for educational reasons as my first look into Ruby on Rails and MVC architecture.

Jungle is an e-commerce web app that sells plants for your home.

!["Adding a product to your cart"](./screenshots/gif1.gif)

The app allows for user registration, and purchasing of products regardless of login status.

The app also has certain admin functionality which allows admins to add and delete products and categories for products.

!["Deleting a product from the Admin Products page"](./screenshots/gif2.gif)

## !!! DISCLAIMER !!!

DO NOT use real credit card information when making purchases on this app. This app strictly requires test credit cards from Stripe. A link to the Stripe website and test APIs can be found below.

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

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
