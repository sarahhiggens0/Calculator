#Author: Sarah Higgens 

 #This class is the entity class for Vectors. It has getter method to
 # pass information to the Vectorator. 
class TVector 

 N = 6
 attr_reader :vect 
 
	 # This is the constructor that creates a non-default and default
	 # vector with values that the user entered.
	def initialize(str = nil)     
		@vect = Array.new(N,0)     
		if( str != nil )       
			tokens = str.to_s.delete("(").chop.split(",")  
			@vect = tokens.map(&:to_i)
		end
    end   
	
	# This overrides the to_s method, so it can be used for TV objects. 
	def to_s
		str_array = @vect.map(&:to_s)
		str = "(" + str_array.map{ |i|  %Q(#{i}) }.join(',') + ")"
	end
	
	#This returns the int array TVector stores. 
	def getVect()
		return @vect
	end
	
	#This sets new parameters for TVector object
	def setVect(str)
		@vect  = str	
	end
	
	#Overides equals so it can be used for TVector type. 
	def == (cmp)
		for i in 0 ... N
			return false if cmp.vect[i] != @vect[i]
		end
	   return true
	end
end 