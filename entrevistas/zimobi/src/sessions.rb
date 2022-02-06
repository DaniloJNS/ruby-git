require 'json'

class Sessions
  attr_reader :title, :description, :ingredients, :cook_time, :featured

  def initialize(title:, description:, ingredients:, cook_time:,
                 featured: false)
    @title = title
    @description = description
    @ingredients = ingredients
    @cook_time = cook_time
    @featured = featured
  end

  def self.from_json(json_file)
    attributes = JSON.parse(File.read(json_file))
    # Sessions.new()
  end
  def save_to_file
    data = {title: @title, 
            description: @description,
            ingredients: @ingredients,
            cook_time: @cook_time,
            featured: @featured}
    File.new('data/recipe.json', 'w').write JSON.generate data
  end
end
