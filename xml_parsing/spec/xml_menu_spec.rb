require 'spec_helper'

describe "XML menu" do

  before(:all) do
    @xml_menu = GuiseppesMenu.new
  end

  it "no price should be more than £10" do
    @xml_menu.price_array_maker
    @xml_menu.price_array.each do |price|
      expect(price).to be < 10
    end
  end

  it "should have no item with calories over 1000 except for the full breakfast" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @xml_menu.calories_array_maker
    @xml_menu.name_array_maker
    (0..(@xml_menu.name_array.length-1)).each do |n|
      if @xml_menu.name_array[n] != 'Full Breakfast'
        expect(@xml_menu.calories_array[n]).to be <= 1000
      end
    end
  end

  it "should have all waffle dishes stating you get two waffles" do
    # Consider children element methods - Remember to step through the data and print out to the command line if you need it
    @xml_menu.description_array_maker
    @xml_menu.name_array_maker
    (0..(@xml_menu.name_array.length-1)).each do |n|
      if @xml_menu.name_array[n].include? 'Waffle'
        expect(@xml_menu.description_array[n].downcase.include? 'two').to be true
      end
    end
  end

end
