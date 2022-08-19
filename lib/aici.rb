# frozen_string_literal: true

require_relative '../lib/city.rb'
require_relative 'aici/version'
require 'json'
require 'pry'

  class Aici
    FILE_DATA = File.read(File.join(File.dirname(__FILE__), 'data/localitati.json'))

    def self.all_data
      return @all if defined? @all

      @all = JSON.parse(FILE_DATA)
    end

    def self.find_city_by_id(id)
      City.new.find_by_id(id)
    end

    def self.find_city_by_county_code(code)
      City.new.find_by_county_code(code)
    end

    def self.find_city_by_zip(zip)
      City.new.find_by_zip_code(zip)
    end

    def self.list_all_cities(with_diacritics)
      City.new.list_cities(with_diacritics)
    end
  end
