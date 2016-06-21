require_relative "../lib/scraper.rb"
require_relative "../lib/recording.rb"
require 'nokogiri'


class CommandLineInteface

def run
  puts " Hey! You are at the Library of Congress' Digital Collections, specifically the Alan Lomax Collection of Michigan Recordings! Here is a list of the Michigan cities from which Mr.Lomax collected recordings of local musicians. Type the name of a city from the list to view all the recordings made in that city"
#display list method here
  city_answer = gets.chomp #it is a string

  #iterate over Scraper.get_places and find the name of the city they typed in
  #then, get the url in that same hash, then using that url you will call Scraper.get_recordings
  #dump that into a variable, which will be aan array, then I'll iterate over that array and spit the data from that back at the user.




end













end