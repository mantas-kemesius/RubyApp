require 'rspec'
require './src/model/Student'

RSpec.describe Student do
		it "name should be Petras" do
		student = Student.new("Petras", "Petraitis")
		expect(student.name).to eq ("Petras")
	end
end
