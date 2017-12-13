require 'nokogiri'

class GuiseppesMenu

  attr_accessor :menu, :price_array, :calories_array, :name_array, :description_array

  def initialize
    @menu = Nokogiri::XML(File.open('./xml_menu.xml'))
    @price_array = []
    @calories_array = []
    @name_array = []
    @description_array = []
  end

  def get_menu_names
    @menu.search('name')
  end

  def xpath_get_name
    @menu.xpath('//name').text
  end

  def price_array_maker
    @menu.xpath('//price').each do |price|
      @price_array << price.text.gsub('£', '').to_f
    end
  end

  def xpath_get_description
    @menu.xpath('//description').text
  end

  def calories_array_maker
    @menu.xpath('//calories').each do |calories|
      @calories_array << (calories.text).to_i
    end
  end

  def name_array_maker
    @menu.xpath('//name').each do |name|
      @name_array << name.text
    end
  end

  def description_array_maker
    @menu.xpath('//description').each do |description|
      @description_array << description.text
    end
  end

  def xpath_get_menu_items
    @menu.xpath('//food')
  end

end
