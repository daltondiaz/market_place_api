
Tutorial stop in the begin: http://apionrails.icalialabs.com/book/chapter_three


In this project I follow a book tutorial on : 

http://apionrails.icalialabs.com/book/

So here I anoted the parts more importants for me. So if you want more details read the book. 

For configure the enviorement follow the steps on this link : http://apionrails.icalialabs.com/book/chapter_one#uid25


#create image 

In short terms we have the *user* who will be able to place many *orders*, upload multiple *products* which can have many *images* or *comments* from another users on the app.


RESTful APIs must follow at least 3 simple guidelines:

 1) A base URI, such as http://example.com/resources/.
 2) An Internet media type to represent the data, it is commonly JSON and is commonly set through headers exchange.
 3) Follow the standard HTTP Methods such as GET, POST, PUT, DELETE. 


##Devise

In this tutorial is used *devise*.

	Devise is a flexible authentication solution for Rails based on Warden. It:

    Is Rack based;
    Is a complete MVC solution based on Rails engines;
    Allows you to have multiple models signed in at the same time;
    Is based on a modularity concept: use only what you really need.

Se more details: https://github.com/plataformatec/devise

How to use in begin:

Example:

First install

```rb
$ rails g devise:install
 create  config/initializers/devise.rb
      create  config/locales/devise.en.yml
===============================================================================
.
.
.
```

 Next:

```rb
$ rails g devise User
      invoke  active_record
      create    db/migrate/20140622003340_devise_create_users.rb
      create    app/models/user.rb
      invoke    rspec
      create      spec/models/user_spec.rb
      invoke      factory_girl
      create        spec/factories/users.rb
      insert    app/models/user.rb
       route  devise_for :users
```

From now every time we create a model, the generator will also create a factory file for that model, see above. This will help us to easily create test users and facilitate our tests writing.


```rb
FactoryGirl.define do
  factory :user do
  end
end
```

Next we migrate the database and prepare the test database.

```sh
$ rake db:migrate
```

After:

```sh
$ rake db:test:prepare
```


