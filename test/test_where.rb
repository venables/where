require 'helper'

class TestWhere < Test::Unit::TestCase
    
  should "build an empty object when given a nil address" do
    result = Where.is(nil)
    assert result.accuracy.nil?
    assert result.address.nil?
    assert result.street_number.nil?
    assert result.street.nil?
    assert result.city.nil?
    assert result.region.nil?
    assert result.postal_code.nil?
    assert result.country.nil?
    assert result.lat.nil?
    assert result.lng.nil?
  end
  
  should "build an empty object when given an empty address" do
    result = Where.is("")
    assert result.accuracy.nil?
    assert result.address.nil?
    assert result.street_number.nil?
    assert result.street.nil?
    assert result.city.nil?
    assert result.region.nil?
    assert result.postal_code.nil?
    assert result.country.nil?
    assert result.lat.nil?
    assert result.lng.nil?
  end

  should "build a valid geolocation object when given a street address" do
    result = Where.is("4 yawkey way boston ma")
    assert result.accuracy == 'street_address'
    assert !result.address.nil?
    assert result.street_number == '4'
    assert result.street == 'Yawkey Way'
    assert result.city == 'Boston'
    assert result.city(true) == 'Boston'
    assert result.region == 'Massachusetts'
    assert result.region(true) == 'MA'
    assert result.postal_code == '02215'
    assert result.country == 'United States'
    assert result.country(true) == 'US'
    assert !result.lat.nil?
    assert !result.lng.nil?
  end
  
  should "build a valid geolocation object when given an address in a neighborhood" do
    result = Where.is("brighton ma")
    assert result.accuracy == 'neighborhood'
    assert !result.address.nil?
    assert result.street_number.nil?
    assert result.street.nil?
    assert result.city == 'Boston'
    assert result.city(true) == 'Brighton'
    assert result.region == 'Massachusetts'
    assert result.region(true) == 'MA'
    assert result.postal_code.nil?
    assert result.country == 'United States'
    assert result.country(true) == 'US'
    assert !result.lat.nil?
    assert !result.lng.nil?
  end
  
  
  should "build a valid geolocation object when given an ip address" do
    result = Where.is("173.194.33.104")
    assert result.accuracy == 'city'
    assert !result.address.nil?
    assert result.street_number.nil?
    assert result.street.nil?
    assert result.city == 'Mountain View'
    assert result.city(true) == 'Mountain View'
    assert result.region == 'California'
    assert result.region(true) == 'CA'
    assert result.postal_code.nil?
    assert result.country == 'United States'
    assert result.country(true) == 'US'
    assert !result.lat.nil?
    assert !result.lng.nil?
  end
  
  
end
