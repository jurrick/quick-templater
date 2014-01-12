# Quick Templater

Quick Templater is a rails generator that you can use to generate site templates quickly.
Today some bootstrap v3 templates already available to generate layouts.

[![Gem Version](https://badge.fury.io/rb/quick-templater.png)](http://badge.fury.io/rb/quick-templater)
[![Build Status](https://travis-ci.org/jurrick/quick-templater.png?branch=master)](https://travis-ci.org/jurrick/quick-templater)
[![Coverage Status](https://coveralls.io/repos/jurrick/quick-templater/badge.png)](https://coveralls.io/r/jurrick/quick-templater)
[![Dependency Status](https://gemnasium.com/jurrick/quick-templater.png)](https://gemnasium.com/jurrick/quick-templater)


## Installation

Add this line to your application's Gemfile:

    gem 'quick-templater'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quick-templater

## Usage

### Layout generator

Used without parameters, it generates the layout inside the application.html.erb file using the bootstrap template "Starter".

    rails g quick_templater:layout

You can specify the layout file name in the first parameter:

    rails g quick_templater:layout admin # it will generate a layout called `admin.html.erb`

If you want to use another bootstrap template layout (See a [list of all templates](https://github.com/jurrick/quick-templater/wiki/List-templates)), instead of the default, you can use the `--template` option:

    rails g quick_templater:layout admin --template="jumbotron"

You can specify the template engine with `--engine=name` option, where name can be erb (default), haml or slim:

    rails g quick_templater:layout --engine=slim # you must specify slim in your Gemfile

You can specify the text used in the header with the `--app-name` option:

    rails g quick_templater:layout --app-name="My New Application"

## Contributing

1. Fork it ( http://github.com/jurrick/quick-templater/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
