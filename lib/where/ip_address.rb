module Where
  class IpAddress < Where::Base
    class << self
      GEOCODER_URL = 'http://www.geoplugin.net/json.gp?ip='
      
      def geocode(address, api_url=nil)
        super(address, api_url || GEOCODER_URL)
      end
    end
    
    def initialize(body="")
      data = body[10..-2] || ""
      super(data.empty? ? data : data.gsub('geoplugin_', ''))
    end
            
    def latitude=(val)
      @lat = val
    end
    
    def longitude=(val)
      @lng = val
    end
  
    def accuracy
      return 'street_address' unless street.nil?
      return 'city' unless city.nil?
      return 'region' unless region.nil?
      return 'country' unless country.nil?
      ""
    end
    
  end
end
