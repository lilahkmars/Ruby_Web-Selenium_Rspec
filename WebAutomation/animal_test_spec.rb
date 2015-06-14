require 'rspec'
require 'animal'

describe 'Tesy Animal Test' do

  context 'to test name' do
    it 'should get initialized name' do
    #create an animal class object and initialize it
    #pass some variables to the constructor
  
    animal = Animal.new('dino', 5)  
  
    #get the name value
  
    nameValue = animal.getName
  
    #and check that it is correct
  
    puts nameValue
  
    end
  
    it 'should get set name' do
    #create an animal class object and initialize it
    #pass some variables to the constructor
  
    animal = Animal.new('dino', 5)  
    animal.setName('max')
 
    #get the name value
  
    nameValue = animal.getName
  
    #and check that it is correct
  
    puts nameValue
  
    end
    
  end
  
  context 'to test age' do
  
    it 'should get initialized age' do
    #create an animal class object and initialize it
    #pass some variables to the constructor
  
    animal = Animal.new('dino', 5)  
  
 
    #get the name value
  
    ageValue = animal.getAge
  
    #and check that it is correct
  
    puts ageValue
  
    end
  
    it 'should get set age' do
    #create an animal class object and initialize it
    #pass some variables to the constructor
  
    animal = Animal.new('dino', 5)  
    animal.setAge(10)
 
    #get the name value
  
    ageValue = animal.getAge
  
    #and check that it is correct
  
    puts ageValue
  
    end

  end
  
end