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
      new_ip = Ip.new(line.ip)
      new_page = Page.new(line.path)
      next if new_ip.invalid? || new_page.invalid?

      process_ip(new_ip)
      process_page(new_page, new_ip)
    end

    pages
  end

  private

  def process_ip(new_ip)
    if (existing_ip = ips.find { |ip| ip == new_ip })
      existing_ip
    else
      ips << new_ip
    end
  end

  def process_page(new_page, new_ip)
    if (existing_page = pages.find { |page| page == new_page })
      existing_page.viewed_by(new_ip)
    else
      new_page.viewed_by(new_ip)
      pages << new_page
    end
  end
end
