# Object-oriented JavaScript (or CoffeeScript)

This is a bundle of tools for helping you to create well organized client-side
code to be run in browsers covered by tests (or specs) in an easy way.

It uses:

- [Jasmine](http://pivotal.github.com/jasmine/) for writing specs;
- [jQuery](http://jquery.com/), the excelent DOM manipulation library;
- [FakeAjaxServer](https://github.com/rosenfeld/fake-ajax-server) for
simulating AJAX requests made with jQuery. It uses
[Sinon.js](http://sinonjs.org/) for stubbing _jQuery.ajax()_ calls;
- [js-modules](https://github.com/rosenfeld/js-modules) for splitting
your spec "classes" in multiple files for better maintainance;
- [Jasmine-jQuery](https://github.com/velesin/jasmine-jquery) for
adding some useful matchers to Jasmine;
- [jQuery BBQ](https://github.com/cowboy/jquery-bbq/):
don't count on that. Currently it is there only to provide $.deparam,
for helping testing params processed by plugins, like
[jQuery form](http://jquery.malsup.com/form/). If you don't need
it, just don't include it;
- The [Rails Asset Pipeline](http://guides.rubyonrails.org/asset_pipeline.html).
Yeah, sorry if you don't use Rails, but
[this can still be helpful](https://github.com/rosenfeld/jasmine_assets_enabler/tree/oojs)
for non-Rails applications.

## Installation

Add this line to your application's Gemfile:

    gem 'oojs'

And then execute:

    $ bundle

## Usage

I intend to write an article about it soon.

For now, you'll need to create your spec helper first:

    rails g oojs:spec_helper

Then, create some spec:

    rails g oojs:spec shopping_cart

Finally, run your specs:

    rake sandbox_assets:serve

And navigate to http://localhost:5000/ to see them passing.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
