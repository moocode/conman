class Recipe

  def self.method_missing(m, *args, &block)
    Recipe.execute_recipe(m, args)
  end
  
  def method_missing(m, *args, &block)
    Recipe.execute_recipe(m, args)
  end
  
  def self.execute_recipe(class_name, args={})
    clazz_name = (class_name.to_s.split('_').map {|w| w.capitalize}.join) + 'Recipe'
    clazz = Kernel.const_get(clazz_name)
    method = args.shift
    #puts "Calling #{clazz.name}##{method} with #{args.first.inspect}"
    recipe = clazz.new
    if args.empty?
      recipe.send method
    else
      recipe.send method, args.first
    end
  end
  
  def option?(options, targets)
    targets = [targets] unless targets.is_a? Array
    targets.each do |target|
      return false unless options[target] and !options[target].nil? and !options[target].to_s.strip.empty?
    end
  end
  
  def option!(options, targets)
    raise ArgumentError, "Missing required parameter from #{options.inspect}, required = #{targets.inspect}" unless option?(options, targets)
  end
  
end