module Where
  class Address < Where::Base
    GEOCODER_URL = 'http://maps.googleapis.com/maps/api/geocode/json?sensor=false&address='

    def self.geocode(address, api_url=nil)
      super(address, api_url || GEOCODER_URL)
    end

    def results=(results_array=[])
      results_array.each { |result| self.attributes = result }
    end

    def types=(val=[])
      @accuracy = determine_type(val)
    end

    def formatted_address=(val)
      @address = val
    end

    def address_components=(components=[])
      components.each do |component|
        type = determine_type(component['types'])
        next if type.empty?

        if %w(region country).include?(type)
          send("#{type}_code=", component['short_name'])
          send("#{type}_name=", component['long_name'])
        else
          send("#{type}=", component['long_name'])
        end
      end
    end

    def geometry=(val={})
      self.attributes = val['location']
    end

    private

    def determine_type(val = [])
      { 'street_address'              => 'street_address',
        'street_number'               => 'street_number',
        'route'                       => 'street',
        'neighborhood'                => 'neighborhood',
        'locality'                    => 'city',
        'administrative_area_level_1' => 'region',
        'postal_code'                 => 'postal_code',
        'country'                     => 'country'
      }.each do |k, v|
        return v if val.include?(k)
      end
      ""
    end

  end
end
