require 'conman/ingredient'
require 'conman/recipe'

class Conman
  def self.init(options)
    ingredients_folder = options[:ingredients]
    
    puts "initializing with ingredients folder: #{ingredients_folder}"
    
    abort "You must specify an ingredient" if ingredients_folder.nil? or ingredients_folder.empty?
    
    ingredients = []
    
    Dir.glob(ingredients_folder + '*').each do |f|
      ingredients << "#{File.join f, File.basename(f)}.rb" if File.directory? f
      ingredients << f unless File.directory? f
    end
    
    #puts "Loading recipes: #{recipes.inspect}"
    puts "Loading #{ingredients.size} ingredient(s)"
    
    ingredients.each {|ingredient| load ingredient}
  end
  
  def self.run(options)
    script = options[:script]
    load script
  end 
end
