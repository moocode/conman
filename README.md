conman - Server Configuration Management
========================================

__This is still under active development and is subject to change__

Installation
------------

gem install conman

Recipes
-------

Our recipe library can be found at: [github.com/moocode/recipes](http://github.com/moocode/recipes)

Creating your first Recipe
--------------------------

    class FileRecipe < Recipe
      def create(options={})
    	`touch #{options[:path]}` unless exists? :path => options[:path]
      end

	  def exists?(options={})
	    File.exists? options[:path]
	  end
	end

Your first server definition
----------------------------

	class MyServer < Recipe
		file :create :path => '/tmp/foo.txt'
	end

Why another chef/puppet/...?
----------------------------

* More ruby-like
* Simple to understand
* Designed for smaller scale systems

On a live server
----------------

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