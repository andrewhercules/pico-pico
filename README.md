## Pico Pico

### Introduction

Pico Pico is a revamped version of [Chitter](http://github.com/andrewhercules/chitter), a project I completed in Week 4 at Makers Academy. Using the same application, we were to add enhancements with jQuery and updated HTML and CSS. We were also asked to crete an API and use Handlebars.js to populate the peeps from our 'in-house API'. All other functionality is the same as Chitter. A live version of the application is available on Heroku at [http://pico-pico.herokuapps.com](http://pico-pico.herokuapps.com).

### Languages/Platforms/Tools

* Ruby
* Rspec
* Capybara
* Sinatra
* PostgreSQL
* HTML/CSS
* APIs and JSON objects
* Handlebars.js
* jQuery
* Heroku

### Learning Outcomes

After spending the week learning about jQuery and APIs, I was eager to improve my existing Chitter application with a new HTML layout, new CSS, and jQuery. Initially, I found creating the API challenging as I was unsure of how to access the user's information (name and username). StackOverflow came to my rescue and eventually I managed to create a very basic API and use Handlebars.js and a template to populate the index page with all user messages. Looking back during my time at Makers, this is one of my favourite projects - it showcases my ability to work as a full-stack developer, from databases and Ruby through to HTML/CSS and jQuery.

### To-do List

- [ ] Integrate Mailgun gem and free email provider to send users a link to reset their password
- [ ] Make HTML/CSS responsive for use on other devices

### Instructions

Clone the repository:

```
$ git clone git@github.com:andrewhercules/pico-pico.git
```

Change into the directory:

```
$ cd pico-pico
```

Install the gems listed in the Gemfile:

```
$ bundle install
```

Create test and development databases:

```
$ psql
# create database pico-pico_test;
# create database pico-pico_development;
```

Run the tests:

```
$ rspec
```

Start the Sinatra server:

```
$ rackup
```

Visit http://localhost:9292:

```
$ rackup
```