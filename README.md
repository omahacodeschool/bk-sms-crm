# Sms-crm

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production

## Pages to Build for Phase 1

- Homepage should be the signup page
- After signing up, log them in and have them create first business
- After creating first business, take them to Dashboard for that business
- Dashboard view should have links at the top that each go to the dashboard for each business
- Dashboard for each business should show all of that business's touches

### Extra Pages

- Clicking on one message on the dashboard goes to ANOTHER page that shows the full thread.
- Have separate pages for the other components of the dashboard as well.



























