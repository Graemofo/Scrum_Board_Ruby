class HomeController < ApplicationController

#On the home page, this code will add a uplifting quote every day 
  def index
    require 'rss'
    require 'open-uri'
    rss = RSS::Parser.parse('https://www.brainyquote.com/link/quotebr.rss')

    rss.items.each do |item|
	     @rss = item.description
       @rss_author = item.title
    end
  end

  def main
  end
end
