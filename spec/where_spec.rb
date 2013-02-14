require 'spec_helper'

describe Where do
  describe '.is' do
    context 'given nil' do
      it 'returns an empty object' do
        result = Where.is(nil)
        result.accuracy.should be_nil
        result.address.should be_nil
        result.street_number.should be_nil
        result.street.should be_nil
        result.city.should be_nil
        result.region.should be_nil
        result.postal_code.should be_nil
        result.country.should be_nil
        result.lat.should be_nil
        result.lng.should be_nil
      end
    end

    context 'given an empty string' do
      it 'returns an empty object' do
        result = Where.is('')
        result.accuracy.should be_nil
        result.address.should be_nil
        result.street_number.should be_nil
        result.street.should be_nil
        result.city.should be_nil
        result.region.should be_nil
        result.postal_code.should be_nil
        result.country.should be_nil
        result.lat.should be_nil
        result.lng.should be_nil
      end
    end

    context 'given an IP address' do
      it 'returns a valid geolocation object' do
        result = Where.is("173.194.33.104")
        result.accuracy.should == 'city'
        result.address.should_not be_nil
        result.street_number.should be_nil
        result.street.should be_nil
        result.city.should == 'Mountain View'
        result.city(true).should == 'Mountain View'
        result.region.should == 'California'
        result.region(true).should == 'CA'
        result.postal_code.should be_nil
        result.country.should == 'United States'
        result.country(true).should == 'US'
        result.lat.should_not be_nil
        result.lng.should_not be_nil
      end
    end

    context 'given a specific physical address' do
      it 'returns a valid geolocation object' do
        result = Where.is("4 yawkey way boston ma")
        result.accuracy.should == 'street_address'
        result.address.should_not be_nil
        result.street_number.should == '4'
        result.street.should == 'Yawkey Way'
        result.city.should == 'Boston'
        result.city(true).should == 'Boston'
        result.region.should == 'Massachusetts'
        result.region(true).should == 'MA'
        result.postal_code.should == '02215'
        result.country.should == 'United States'
        result.country(true).should == 'US'
        result.lat.should_not be_nil
        result.lng.should_not be_nil
      end
    end

    context 'given a neighborhood physical address' do
      it 'returns a valid geolocation object' do
        result = Where.is("brighton ma")
        result.accuracy.should == 'neighborhood'
        result.address.should_not be_nil
        result.street_number.should be_nil
        result.street.should be_nil
        result.city.should == 'Boston'
        result.city(true).should == 'Brighton'
        result.region.should == 'Massachusetts'
        result.region(true).should == 'MA'
        result.postal_code.should be_nil
        result.country.should == 'United States'
        result.country(true).should == 'US'
        result.lat.should_not be_nil
        result.lng.should_not be_nil
      end
    end
  end
end
