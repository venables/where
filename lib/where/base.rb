require 'uri'
require 'net/http'
require 'active_support'

module Where
  class Base
    attr_accessor :street_number, :street, :city, :neighborhood, :postal_code,
                  :region_code, :region_name, :accuracy, :country_code,
                  :country_name, :lat, :lng

    def self.geocode(address, api_url='')
      url = api_url + URI.escape(address)
      response = Net::HTTP.get_response(URI.parse(url))
      new(response.body)
    rescue
      new
    end

    def initialize(data='')
      json = ActiveSupport::JSON.decode(data)
      return if json.nil? || json.empty?
      self.attributes = json
      self
    end

    def attributes=(opts={})
      opts.each do |k,v|
        var_name = ActiveSupport::Inflector.underscore(k)
        if self.respond_to?("#{var_name}=")
          self.send "#{var_name}=", v
        else
          self.instance_variable_set("@#{var_name}", v)
        end
      end
    end

    # Did the request return at least one result?
    def success?
      @status == 'OK' || !@region_code.nil?
    end

    def street_address
      arr = [street_number, street].compact
      arr.empty? ? nil : arr.join(" ")
    end

    def address
      arr = [street_address, city, region(true), postal_code, country(true)]
      arr.compact!
      arr.empty? ? nil : arr.join(", ")
    end

    def city(use_neighborhood=false)
      @neighborhood && use_neighborhood ? @neighborhood : @city
    end

    def country(short_version=false)
      short_version ? @country_code : @country_name
    end

    def region(short_version=false)
      short_version ? @region_code : @region_name
    end

  end

end
