# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example. Features browsing and add-to-cart capabilities for visitors, category and product creation when signed-in with Admin credentials, and bcrypt encryption for user passwords. Uses Stripe for test payments, and Rspec and Cypress for testing. 

## Getting Started

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example

## Database

This project uses a PostgreSQL database and ActiveRecord for queries. 

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
- Cypress (dev)

## Thank Yous
Just want to say a quick thank you to the mentors at LHL who helped answer questions and do code review for this project! You are all so helpful!