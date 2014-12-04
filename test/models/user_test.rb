require 'test_helper'

class UserTest < ActiveSupport::TestCase
	# test "the truth" do
	#   assert true
	# end
	
	setup do
		@user = User.new(
			name: 'eike', email: 'eike@gmail.com',
			password: 'password', password_confirmation: 'password')	
	end

	test "valid if all filled" do
		# user = User.new(name: 'tigabelas', email: 'tigabelas@email.me')
		assert @user.valid?
	end

	test "invalid if no name" do
		# user = User.new(name: '         ', email: 'tigabelas@email.me')
		@user.name = '         '
		assert @user.invalid?
	end

	test "invalid if name bigger than 50 character" do
		@user.name = 'a'*51
		assert @user.invalid?
		assert_equal true, @user.invalid?
	end

	test "invalid if no email" do
		@user.email = '       '
		assert @user.invalid?
	end

	test 'invalid if email already exist' do
		user = @user.dup
		user.save!
		assert @user.invalid?
	end

	test "valid if email format is valid" do
		@user.email = 'satu@gmail.com'
		assert @user.valid?
	end

	test "invalid if email format is invalid" do
		@user.email = 'satu@gmail'
		assert @user.invalid?
	end

end
