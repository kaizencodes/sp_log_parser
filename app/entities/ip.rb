# frozen_string_literal: true

# represents an ip address.
class Ip
  attr_reader :address

  def initialize(address)
    @address = address
  end

  def ==(other)
    address == other.address
  end

  def to_s
    address
  end
end
