# GlobalizeSpree

This is a fork of Tomash's globalize-spree plugin, that was updated to be compatible with Rails 3.2 and Spree 1.2. 
It provides localization using the gem globalize3.
I also added an admin form for specifying the taxon name. This can be done by right clicking on the taxon in the Categories pages and choosing Edit. (ignore the errors displayed in the dropdown, they are harmless)

[![Build Status](https://secure.travis-ci.org/tomash/globalize-spree.png)](http://travis-ci.org/tomash/globalize-spree)



## Installation

Add to Gemfile:

    gem "globalize_spree", :git => 'https://github.com/victor-github/globalize-spree'
    gem "i18n"
    gem "globalize3"

Now run the rake task to copy migrations and run them:
    bundle rake globalize_spree:install
    bundle rake db:migrate


## Usage

Currently globalizes: Product (name, description), Taxon (name).

### Basic usage

It works like Globalize. To set your locale, add your default locale, for example inside config/initializers/spree.rb

Spree.config do |config|
  default_locale = "ro"
end

Then you can do:

    Product.last.name # <= get name for this product for :en locale
    Product.last.name = "something" # <= set name for this product for :en locale

### Easy Globalize Accessors

For easy editing of translated stuff for predefined locales, it uses code from easy-globalize2-accessors. Inside config.to_prepare of your config/application.rb put

    Product.class_eval do
      globalize_accessors :en, :ro, :de
      attr_accessible :name_en, :name_ro, name_de, :description_en, :description_ro, :description_de
    end

And spree-globalize will replace Product form's "name" field with, respectively, "name_en", "name_ro" and "name_de" fields ("description" following same pattern) in admin panel. 

The attr_accessible line is necessary since in Rails 3.2 attributes need to be whitelisted explicitly in order for assignment to work.

### TO DOs:
  Fix taxon edit menu errors
  More models
