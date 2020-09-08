# frozen_string_literal: true

# represents an ip address.
class Ip
  attr_reader :address

  ADDRESS_VALIDATOR = /^(\d{1,3}\.){3}\d{1,3}$/

  def initialize(address)
    @address = address
  end

  def ==(other)
    address == other.address
  end

  def to_s
    address
  end

  def valid?
    address =~ ADDRESS_VALIDATOR
  end

  def invalid?
    !valid?
  end
end
