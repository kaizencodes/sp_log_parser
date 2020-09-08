# frozen_string_literal: true

# represents an page
class Page
  attr_reader :path, :page_views

  PATH_VALIDATOR = /\/\w*/

  def initialize(path, ips: [])
    @path = path
    @page_views = []

    ips.each { |ip| viewed_by(ip) }
  end

  def ==(other)
    path == other.path
  end

  def viewed_by(ip)
    page_views << PageView.new(ip)
  end

  def to_s
    path
  end

  def valid?
    path =~ PATH_VALIDATOR
  end

  def invalid?
    !valid?
  end

  PageView = Struct.new(:ip)
end
