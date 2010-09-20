How to
===============

Install gem

    gem install rack-try_static

Add insert <code>Rack::TryStatic</code> middleware to your <code>config.ru</code>(stack):

    require 'rack'
    require 'rack/contrib/try_static'

    use Rack::TryStatic, 
        :root => "public",  # static files root dir
        :urls => %w[/],     # match all requests 
        :try => ['.html', 'index.html', '/index.html'] # try these postfixes sequentially

    # otherwise 404 NotFound
    run lambda { [404, {'Content-Type' => 'text/html'}, ['whoops! Not Found']]}

Profit!


Examples
=============

 [Blogging with Jekyll and Heroku for free](http://gmarik.info/blog/2010/05/10/blogging-with-jekyll-and-heroku-for-free).

TODO
===============
 * &radic; specs
 * &radic; docs
 * merge to rack-cotrib
