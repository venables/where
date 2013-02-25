module Where
  class IpAddress < Where::Base
    GEOPLUGIN_URL = 'http://www.geoplugin.net/json.gp?ip='
    FREEGEOIP_URL = 'http://freegeoip.net/json/'

    def self.geocode(address, opts={})
      api_url = opts[:geocoder] == 'geoplugin' ? GEOPLUGIN_URL : FREEGEOIP_URL
      super(address, api_url)
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
