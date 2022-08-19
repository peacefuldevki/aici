# frozen_string_literal: true

require 'json'

class City
  def find_by_id(id)
    data_file.select { |city| city['id'] == id.to_i }
  end

  def find_by_county_code(code)
    data_file.select { |city| city['auto'] == code }
  end

  def find_by_zip_code(zip)
    data_file.select { |city| city['zip'] == zip.to_i }
  end

  def list_cities(with_diacritics)
    if with_diacritics
      data_file.map { |k| k['diacritice'] }.sort!
    else
      data_file.map { |k| k['nume'] }.sort!
    end
  end

  def data_file
    JSON.parse(File.read(File.join(File.dirname(__FILE__), 'data/localitati.json')))
  end
end
