
def reload
  load 'prytest.rb'
end

module HelloModule
  #TryIt.new.say_hello
  def say_hello
    puts "hello from HelloModule!"
  end
 
  # TryIt::HelloModule.say_ahoj
  def self.say_ahoj
    puts "ahoj from HelloModule!"
  end
end

class TryIt
  include HelloModule

  def say_hi # TryIt.new.say_hi
    puts "hi from public method!"
  end

  private
  
  def self.say_ciao # TryIt.say_hi
    puts "hi from self.say_hi private method"
  end
  
end

module Chatty
  def greeting
    puts "Aloha from Chatty-Module"
  end
end

### some pry tips:

language = 'Ruby'
number = 11

binding.pry # ruby -r pry prytest.rb

number = 20

# inside pry Ctrl-D for the next 'breakpoint'
binding.pry 


# view the documentation or source for a method with e.g.
# show-doc Array

binding.pry 

# search in pry history:
# hist --grep foo

# run shell commands by prepending the commands with a '.' like
# .ls
# .cd ~/ror_workshop/ruby_tutorial

# dive into objects with cd and list methods with ls
# cd my_array
# ls
my_array = [1,2,3,4,'matt', 'ruff']


# assign last statement by usign underscore '_'
# [1,2,3]
# a = _
# => a = [1,2,3]
