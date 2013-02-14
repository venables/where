Where
=====

A basic geolocation library for Ruby.

Installation
------------

Add this line to your application's Gemfile:

    gem 'where'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install where

Usage
-----

Search by Address:

    result = Where.is '4 yawkey way boston ma'
    if result.success?
      puts "Address: #{result.address}"
      puts "Street Number: #{result.street_number}"
      puts "Street: #{result.street}"
      puts "City: #{result.city}"
      puts "State: #{result.state}"
      puts "Zip: #{result.postal_code}"
      puts "Country: #{result.country}"
      puts "Lat: #{result.lat}"
      puts "Lng: #{result.lng}"
    end

Or, by IP-Address:

    result = Where.is "173.194.33.104"
    ...


Copyright
---------

Copyright (c) 2013 Matt Venables. See LICENSE.txt for details.
