require 'spec_helper'
describe Smartcore::Client do

  before do
    @client = Smartcore::Client.new(login: 'kent', password: 'Passw0rd12')
  end

  context '#brands_list' do
    it 'should return array' do
      expect(@client.brands_list.class).to eq(Array)
    end
    it 'should return array with brand items' do
      expect(@client.brands_list.first.class).to eq(Smartcore::Models::Brand)
    end

  end

  context '#brand_with_relations' do
    it 'should return single brand by brand id' do
      brand_id = @client.brands_list.first.id
      expect(@client.brand_with_relations(brand_id).class).to eq(Smartcore::Models::Brand)
    end
    it 'should brand with cigarette formats' do
      expect(@client.brand_with_relations.cigarette_formats.first.class).to eq(Smartcore::Models::CigaretteFormat)
    end
  end

  context '#brands_with_relations_list' do
    it 'should return array' do
      expect(@client.brands_with_relations_list.class).to eq(Array)
    end

    it 'should return array of brands' do
      expect(@client.brands_with_relations_list.first.class).to eq(Smartcore::Models::Brand)
    end
  end

  context '#cities_list' do
    it 'should return array' do
      expect(@client.cities_list.class).to eq(Array)
    end

    it 'should return array of cities' do
      expect(@client.cities_list.first.class).to eq(Smartcore::Models::City)
    end
  end

  context '#countries_list' do
    it 'should return array' do
      expect(@client.countries_list.class).to eq(Array)
    end

    it 'should return array of countries' do
      expect(@client.countries_list.first.class).to eq(Smartcore::Models::Country)
    end
  end

  context '#countries_with_relations_list' do
    it 'should return array' do
      expect(@client.countries_with_relations_list.class).to eq(Array)
    end

    it 'should return array of countries' do
      expect(@client.countries_with_relations_list.first.class).to eq(Smartcore::Models::Country)
    end

    it 'should return array of countries includes cities array' do
      expect(@client.countries_with_relations_list.first.cities.class).to eq(Array)
    end

    it 'should return array of countries includes cities' do
      expect(@client.countries_with_relations_list.first.cities.first.class).to eq(Smartcore::Models::City)
    end
  end

  context '#country_with_relations_list' do
    before do
      @country_id = '7c4d5a6f-5191-40aa-99b2-a97d8f0d81ea'
    end
    it 'should return array' do
      expect(@client.country_with_relations_list(@country_id).class).to eq(Array)
    end

    it 'should return array of countries includes cities array' do
      expect(@client.country_with_relations_list(@country_id).first.cities.class).to eq(Array)
    end

    it 'should return array of countries includes cities' do
      expect(@client.country_with_relations_list(@country_id).first.cities.first.class).to eq(Smartcore::Models::City)
    end
  end


end