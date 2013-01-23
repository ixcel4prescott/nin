#!/usr/bin/env ruby
#
# Originally written by http://redartisan.com/tags/csv
# Added and minor changes by Gavin Laking
# Rewritten by Andrew Bennett for Ruby 1.9
# 
# Usage: ruby csvimport.rb file.csv [--json]
#
# "id","name","mime_type","extensions","icon_url"
# "1","unknown","unknown/unknown","||","/images/icon/file_unknown.gif"
# "2","image/tiff","image/tiff","|tiff|tif|","/images/icon/blank.png"
#
# if you want to remove the id: "number" line from the resulting YAML file
# do a find and replace for: ^( id: \"\d*\"\n) in Textmate

require 'csv'
require 'json'
require 'yaml'
require 'pp'

def seeds(records)
  records.each do |key, fields|
    print "XXX.create! "
    fields.each_with_index do |field, index|
      print field[0]
      print ": "
      print '"'
      print field[1]
      print '"'
      print ', ' unless index == fields.length - 1
    end
    puts ""
  end
end

input = ARGV.shift
is_file = (input.nil? ? false : File.exist?(input))
file = is_file ? input : STDIN

doc = is_file ? CSV.read(file) : CSV.parse(file.read)
fields = doc.shift
records = Hash.new
doc.each_with_index do |row, i|
  record = Hash.new
  fields.each_with_index do |field, j|
    record[field] = row[j]
  end
  records["record_#{i}"] = record
end

flag = ARGV.shift unless input.nil?
flag ||= input || '--yaml'

case flag
when '--json' then
  puts records.to_json
when '--seed' then
  seeds(records)
else
  puts records.to_yaml
end