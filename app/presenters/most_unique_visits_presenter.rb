# frozen_string_literal: true

# orders the pages based on most unique visits.
class MostUniqueVisitsPresenter < MostVisitsPresenter
  DESCRIPTION = "list of webpages with most unique page views ordered from most unique views to less unique views\n"
  NO_VISITS = "We can't list the unique page views as there are no views."

  def initialize(pages:)
    @pages = pages
    @collection = []

    populate_visit_counts
  end

  def to_s
    return NO_VISITS if visit_counts.empty?

    DESCRIPTION + visit_counts.map do |visit|
      "#{visit.page} #{count_text(visit.count)}"
    end.join("\n")
  end

  private

  def populate_visit_counts
    @visit_counts = pages.map do |page|
      VisitCount.new(page: page, count: page.page_views.map { |pw| pw.ip.to_s }.uniq.size)
    end.sort.reverse
  end

  def count_text(count)
    result = count.to_s + " unique visit"

    result += "s" if count > 1
    result
  end
end
