require 'csv'

class CSVFile_Ex

	CSV.foreach("persondata.csv") do |data|
		print data
		puts ""
	end

	CSV.open("studentInfo.csv","wb") do |csv|

 		csv << ["name","per"]
 		loop do 
		 		puts "Enter name and per"
		 		name=gets.chomp
		 		per=gets.chomp
		 		csv << [name,per]
		 		puts "do u want to continue.(y/n)"
		 		ch=gets.chomp
		 		if  ch =='n' 
		 			break;
		 		end
		end
	end

end