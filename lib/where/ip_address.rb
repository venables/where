module Where
  class IpAddress < Where::Base
    GEOCODER_URL = 'http://www.geoplugin.net/json.gp?ip='

    def self.geocode(address, api_url=nil)
      super(address, api_url || GEOCODER_URL)
    end

    def initialize(data='')
      super(data.to_s.gsub('geoplugin_', ''))
    end

    def latitude=(val)
      @lat = val
    end

    def longitude=(val)
      @lng = val
    end

    def accuracy
      if street
        'street_address'
      elsif city
        'city'
      elsif region
        'region'
      elsif country
        'country'
      else
        ''
      end
    end

  end
end
