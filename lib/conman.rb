require 'conman/recipe'

class Conman
  def self.init(options)
    recipe_folder = options[:recipes]
    
    puts "initializing with recipes folder: #{recipe_folder}"
    
    abort "You must specify a recipe" if recipe_folder.nil? or recipe_folder.empty?
    
    recipes = []
    
    Dir.glob(recipe_folder + '*').each do |f|
      recipes << "#{File.join f, File.basename(f)}.rb" if File.directory? f
      recipes << f unless File.directory? f
    end
    
    #puts "Loading recipes: #{recipes.inspect}"
    puts "Loading #{recipes.size} recipe(s)"
    
    recipes.each {|recipe| load recipe}
  end
  
  def self.run(options)
    script = options[:script]
    load script
  end 
end
