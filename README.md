# Jungle

A mini e-commerce application built with Rails 6.1. Made by adding new features to an existing template, for the purpose of gaining proficiency with Ruby on Rails, Rspec, and Cypress. This project was completed as a part of the Lighthouse Labs Web Development bootcamp.

## Screenshots
![Homepage](https://user-images.githubusercontent.com/107281344/237021201-5be13f77-17a2-41b2-afe1-b512703d1dbc.png)
![Products](https://user-images.githubusercontent.com/107281344/237021236-202d530a-18ad-4a39-a00c-cb1b25db41f2.png)
![Cart](https://user-images.githubusercontent.com/107281344/237021298-82c82971-b0e1-4753-94f0-f3b0b1877779.png)
![About](https://user-images.githubusercontent.com/107281344/237021342-7d33ab44-05ab-49f5-9c58-de3b74907956.png)
![Admin](https://user-images.githubusercontent.com/107281344/237021377-4361be10-0083-4559-aedf-272025659770.png)

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
