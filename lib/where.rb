require 'where/base'
require 'where/address'
require 'where/ip_address'

module Where  
  def self.is(address = "")
    address ||= ""
    if address.match(/^(\d{1,3}\.){3}\d{1,3}$/)
      Where::IpAddress.geocode address
    else
      Where::Address.geocode address
    end    
  end
end