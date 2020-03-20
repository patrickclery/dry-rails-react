[![Coverage Status](https://coveralls.io/repos/github/patrickclery/dry-rails-react/badge.svg?branch=master)](https://coveralls.io/github/patrickclery/dry-rails-react?branch=master)
![RSpec](https://github.com/patrickclery/dry-rails-react/workflows/Ruby/badge.svg)

## Description

This is the starter kit I use to develop full-stack Rails + React applications. As a freelance Rails developer, I need to be able to start new projects quickly that are ready for _Test-Driven Development_. I've assembled this template over the years to include best-practices, tweaks, documentation, and personal preferences, while still generally adhering to the "Rails way".

## Requirements

`bin/setup` will install all the necessary packs and gems. Your system will need the following:

* PostgreSQL
* chromedriver

## Installation

- Fork this repo.
- Run `bin/setup`

## Usage

- Start the server with `rails s`
- Navigate to [https://localhost:3000/]

## What is included?

#### These gems are added to the standard Rails stack

* Core
    * [better_errors]:https://github.com/charliesome/better_errors – useful error pages with interactive stack traces
    * [fast_jsonapi][] – a JSON serializer that follows the standards of Google's JSON:API
    * [react-rails][] – combines Rails + React + Webpacker. comes setup with a default App component at /
    * [rubocop][] – enforces Ruby code style
* Security
    * [brakeman][] – detect security vulnerabilities
* Testing
    * [shoulda]:https://github.com/thoughtbot/shoulda – shortcuts for common ActiveRecord tests
    * [faker][] – generate fake data for tests
    * [vcr][] – save http requests for re-use with tests
    * [webmock][] – simulate live http requests
    * [capybara][] – integration tests with screenshots
    * [codecov][] – integration with [codecov.io](https://codecov.io/)

