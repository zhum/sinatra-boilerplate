# Sinatra Boilerplate
## Single File Format Version

I have been using Sinatra for a while, and have loved every moment of it. It's so simple create any type of application, from REST APIs to database applications. It's only problem is that it doesn't have a scaffolding tool, neither a command line tool. I found it quite frustrating at times, when I had to make quick apps, with it. So I tried to fix it.
<br><br>
Instead of creating a whole rubygem just for my small problem, I created a boilerplate for Sinatra, so all I had to do was copy or git clone the code, and I'd been on my way. I created it a while back, and a lot of people have been asking me about how my Sinatra apps are so well structured, and so I thought I'd open-source the code, just like I did for my [static boilerplate project](https://github.com/karlcoelho/coelho-boilerplate).
<br><br>
It contains the following gems :-
- sinatra - the gem itself.
- sinatra-contrib - some extensions for Sinatra
- sinatra-assetpack - asset management for Sinatra
- sinatra-static-assets - some helper methods for static content in 'public'
- sinatra-flash - flash messages in Sinatra
- datamapper - for the databases
- dm-migrations - Migrations to help with DataMapper
- dm-sqlite-adapter - A DataMapper adapter for SQLite. I love SQLite.
- rack - ruby web server handler, needed for heroku deployment
- rack-cors - CORS for the app, so that you can use it as an API.

For some static content, it uses :-
- Twitter Bootstrap 3
- jQuery

The app has been split into some what of an MVC format. Yeah, weird I know, but I designed for little more complex Sinatra apps, if you're going for large projects - Just use Rails. It'll help in the long run, Rails has a lot more to offer. Eventually I'll branch out another version of the boilerplate in a single file format, so check the branches of this repository if there is one.
<br><br>
I hope to help the community with this project.
<br><br>
Do let me know what you think about it, [by tweeting at me](http://twitter.com/therealcoelho).