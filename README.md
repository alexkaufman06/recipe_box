# Recipe Box
This is an app that allows the user to store recipes.  First a recipe name is created.  Then, the user can add ingredients to the cupboard and add those ingredients to any recipe.
## Setup Instructions:
### Gems Used:
```
sinatra
sinatra-contrib
sinatra-activerecord
rake
pg
pry
rspec
shoulda-matchers
```
### Install Bundler:
```
$ gem install bundler
```
### Run Bundler:
```
$ bundle
```
### Start the database:
```
$ postgres
```
### Create databases:
```
$ rake db:create
$ rake db:migrate
$ rake db:test:prepare
```
### Bug Reports
If the user clicks add ingredient when no ingredients are in the cupbaord, the site will break.
### Author
Alex Kaufman & Tyler Brown
#### MIT License
