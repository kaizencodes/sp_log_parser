# frozen_string_literal: true

# Uses the reader to load line by line from the input
# and saves the data for the presenters to use.
class PageProcessor
  attr_reader :reader, :pages, :ips
  private :reader, :pages, :ips

  def initialize(reader)
    @reader = reader
    @pages = []
    @ips = []
  end

  def process
    reader.read_line do |line|
      ip = process_ip(line.ip)
      process_page(line.path, ip)
    end

    pages
  end

  private

  def process_ip(address)
    new_ip = Ip.new(address)
    if (existing_ip = ips.find { |ip| ip == new_ip })
      return existing_ip
    else
      ips << new_ip
    end

    new_ip
  end

  def process_page(path, ip)
    new_page = Page.new(path)

    if (existing_page = pages.find { |page| page == new_page })
      existing_page.viewed_by(ip)
    else
      new_page.viewed_by(ip)
      pages << new_page
    end
  end
end
