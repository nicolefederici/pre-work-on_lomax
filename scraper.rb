require_relative 'recording.rb'
require 'open-uri'
require 'nokogiri'

class Scraper

def self.get_places
  doc = Nokogiri::HTML(open('https://www.loc.gov/collections/alan-lomax-in-michigan/index/location/'))
  places_array = []
  doc.css(".index li").each do |item|
    city_hash = {}
    city_hash[:name] = item.css("span.label").text
    city_hash[:count] = item.css("span.count").text
    city_hash[:url] = "https:" + item.css("a")[0]["href"]
    places_array << city_hash
  end
  places_array.delete_if { |hash| hash[:name] == "United States" || hash[:name] == "Michigan" || hash[:name] == "Illinois"}
  return places_array
end

def self.get_recordings(url)
  doc = Nokogiri::HTML(open(url + "&c=150&st=list"))
  recordings_array = []
  doc.css(".search-results.list-view li").each do |item|
    title = item.css("div.description h2 a")[0].text.strip
    contributors = item.css("ul li.contributors span")[0].text.strip
    date = item.css("ul li.date span")[0].text.strip
    recording_url = item.css("div.description h2 a")[0]["href"]
    recordings_array << Recording.new(title,contributors,date,recording_url)
  end
  return recordings_array
end










end