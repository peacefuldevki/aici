# frozen_string_literal: true

RSpec.describe Aici do


  let(:json_file_name) { 'localitati' }
  let!(:data) { JSON.parse(spec_resource_content("#{json_file_name}.json")) }


  describe '#all_data' do
    it "returns all  the data" do
      expect(Aici.all_data).to eq data
    end
  end


  describe '#find_city_by_id' do
    it "returns the exact city data" do
      expect(Aici.find_city_by_id('22')).to eq 'data'
    end
  end
end
