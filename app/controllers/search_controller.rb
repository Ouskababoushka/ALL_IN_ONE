class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def search
    search_term = params[:search_term]
    @result_items = []

    # Perform search on each website
    websites = ["facebook marketplace", "leboncoin", "geev"]
    websites.each do |website|
      # TODO: Perform search on each website and append the results to @result_items
    end
  end

  def index
    query = params[:query]

    if query.present?
      @results = perform_search(query)
    end
  end

  private

  require 'httparty'

  def perform_search(query)
    results = []

    # Perform search on Facebook Marketplace
    response = HTTParty.get("https://www.facebook.com/marketplace/search/?query=#{query}")
    html = Nokogiri::HTML(response.body)
    html.css('div[data-testid="marketplace_feed_item"]').each do |item|
      title = item.css('span[dir="auto"]').text.strip
      description = item.css('span[dir="auto"]').last.text.strip
      price = item.css('div span[dir="auto"]').last.text.strip
      url = "https://www.facebook.com#{item.css('a')[0]['href']}"
      results << { title: title, description: description, price: price, url: url }
    end

    # Perform search on Leboncoin
    # TODO: Implement search on Leboncoin using HTTParty

    # Perform search on Geev
    # TODO: Implement search on Geev using HTTParty

    return results
  end
end
