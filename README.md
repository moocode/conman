conman - Server Configuration Management
========================================

__This is still under active development and is subject to change__

Conman is a simple server configuration management library.  The core concepts are around:

_Ingredients_ - reusable, sharable components that achieve specific tasks
_Recipes_ - your private recipes that make use of the Ingredients

Installation
------------

gem install conman

Ingredient Repository
---------------------

Our ingredient library can be found at: [github.com/moocode/ingredients](http://github.com/moocode/ingredients)

Creating your first Ingredient
------------------------------

An ingredient is a simple Ruby Class whose name ends with Ingredient and (optionally) subclasses Ingredient.
The Ingredient superclass just provides some helper methods if you wish to use them.

    class FileIngredient < Ingredient
      def create(options={})
    	`touch #{options[:path]}` unless exists? :path => options[:path]
      end

	  def exists?(options={})
	    File.exists? options[:path]
	  end
	end

Your first Recipe
-----------------

	class MyServer < Recipe
		file :create, :path => '/tmp/foo.txt'
	end

Preparing a live server
-----------------------

First you need to install all the pre-requisites (ruby, rubygems, conman, git-core)

	apt-get install ruby git-core -y
	ruby -v
	
	cd /tmp
	wget http://rubyforge.org/frs/download.php/70696/rubygems-1.3.7.tgz
	tar zxf rubygems-1.3.7.tgz
	cd rubygems-1.3.7
	sudo ruby setup.rb --no-ri --no-rdoc
	cd /tmp
	rm -rf rubygems-1.3.7
	ln -sf /usr/bin/gem1.8 /usr/bin/gem
	gem -v
	
	gem install conman