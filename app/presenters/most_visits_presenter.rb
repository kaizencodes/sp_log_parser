# frozen_string_literal: true

# orders the pages based on most visits.
class MostVisitsPresenter
  attr_reader :pages, :visit_counts
  private :pages, :visit_counts

  DESCRIPTION = "list of webpages with most page views ordered from most pages views " \
    "to less page views\n"
  NO_VISITS = "We can't list the total page views as there are no views."

  def initialize(pages:)
    @pages = pages

    populate_visit_counts
  end

  def populate_visit_counts
    @visit_counts = pages.map do |page|
      VisitCount.new(page: page, count: page.page_views.size)
    end.sort.reverse
  end

  def to_s
    return NO_VISITS if visit_counts.empty?

    DESCRIPTION + visit_counts.map do |visit|
      "#{visit.page} #{count_text(visit.count)}"
    end.join("\n")
  end

  private

  def count_text(count)
    result = count.to_s + " visit"

    result += "s" if count > 1
    result
  end

  # represents a single page visit.
  class VisitCount
    include Enumerable

    attr_reader :page, :count

    def initialize(page:, count:)
      @page = page
      @count = count
    end

    def <=>(other)
      count <=> other.count
    end
  end
end
