#Author: Sarah Higgens 
require_relative 'TVector'

# This class performs all the operations with TVectors. It also allows
# the user to decide which operators they want to happen. 

# 1. This program is different from Java because I used the delete_if function in
# the deleteTV method. This funtion searched through the array and deletes 
# an Object if it finds it. I did not write a loop for the Ruby program, 
# because it is already pre-built in. 
# 
# 2. I used the map funtion in TVector to convert array types. The map function 
#     automatically loops, so I did not have to write any sort of loop. I just
#     had to use Array maps, like you suggested.

class Vectorator
	 @@vect_list_temp = Array.new 
	 
	 #This is a constructor to create an empty array of TVectors.
	 def initialize(str = nil) 
		@vec_list = Array.new 
	 end 
	
	# This method allows the user to choose which operation they would like.
    # It also reads in any number value that must go along with the
    # operation. 
	def run()
		input = gets
		upperCase = input[0,1].upcase
		while(!upperCase.eql?("Q"))
			if upperCase.upcase.eql?("S")
				sum()
			elsif upperCase.upcase.eql?("A")
				vector = input[1,input.length];
				append(vector)
			elsif upperCase.upcase.eql?("D")
				vector = input[1,input.length];
				deleteTV(vector)
			elsif upperCase.upcase.eql?("M")
				scalar = input[1,input.length];
				multipy(scalar)
			elsif upperCase.upcase.eql?("P")
				print()
			else 
				puts upperCase + " is not a valid command!"
			end
			input = gets.chomp
			upperCase = input[0,1].upcase
		end
		puts "Normal Termination of Program 1"
	end
	
	# This method appends a vector to the end of the array. 
	def append(vector)
		tv = TVector.new(vector)
		@vec_list.push(tv)
		puts tv.to_s +  " was added to the list."
	end 
	
	# Prints out the vectors in the array. 
	def print()
		puts "The list of vectors is:" 
		@vec_list.each { |item| puts item}
	end
	
	# Sum up all vectors in the array and print out the result.
	def sum()
		n = 6
		results = Array.new(n, 0)
		numVect = Array.new
		resultsCounter = 0
		j = 0
		sum = 0
		for i in 0 .. n - 1 
			for vect in @vec_list
				numVect = vect.getVect
				result = numVect[i]	
				sum = sum + result.to_i
				j = j + 1
				if(j == @vec_list.length)
					results[resultsCounter] = sum
					sum = 0
					j = 0
					resultsCounter = resultsCounter + 1
				end
			end
		end
		puts "The sum of the list is: " + "(#{results.join(",")})"
	end
	
	# This method multiplies all vectors in the array with a scalar that the
    # user has entered.
	def multipy(scalar)
		vect_list_temp = Array.new
		vect_save = Array.new
		n = 6
		counter = 0
		for vect in @vec_list
			arrayVector = vect.getVect
			results = Array.new
			for i in 0..n -1
				result = arrayVector[i] * scalar.to_i
				results[i] = result
			end 	
		resultsStr = results.map(&:to_s)
		str = "(" + resultsStr.map{ |i|  %Q(#{i}) }.join(',') + ")"
		tv = TVector.new(str)
		vect_list_temp.push(tv)
		end	
		for i in 0...vect_list_temp.length
			num = vect_list_temp.at(i).to_s 
			tvSave = TVector.new(num)
		    @vec_list[i] = tvSave
		end
		puts "The new vector list: "
		for vect in @vec_list
			puts vect.to_s
		end	
	end
	
	# This method deletes any vectors that are equal to the ones the user
    # entered. 
	def deleteTV(vector)
		tv = TVector.new(vector)
		length = @vec_list.length
		@vec_list.delete_if { |x| x == tv }
		puts "All vectors equal to " + tv.to_s + " have been deleted." 
	end
	
end
