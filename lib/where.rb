require "where/version"
require 'where/base'
require 'where/address'
require 'where/ip_address'

module Where
  def self.is(address = "", opts={})
    if address.to_s.match(/^(\d{1,3}\.){3}\d{1,3}$/)
      Where::IpAddress.geocode(address, opts)
    else
      Where::Address.geocode(address, opts)
    end
  end
end
