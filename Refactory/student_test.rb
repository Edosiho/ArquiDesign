require 'minitest/autorun'
require './student'


class StudentTest < Minitest::Test

	def setup
	  @s = Student.new('Quinn',-1,2333)
	end


	def test_student_creation
	s = Student.new('Quinn',-1,2333)
	assert_equal 'Quinn', s.name
	assert_equal -1,  s.id
	end

	def test_reset_anual_income
		assert_equal 25_000 @s.test_reset_anual_income(30000)
		assert_equal
	end
end