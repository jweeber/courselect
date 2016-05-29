require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "validations: username can't be blank" do
    user = User.new

    assert_not user.valid?
    assert user.errors.keys.include?(:username), "username is not in the errors hash"
  end

 #  test "validations: email can't be blank" do
 #    user = User.new

 #    assert_not user.valid?
 #    assert user.errors.keys.include?(:email), "email is not in the errors hash"
 #  end

 #  test "can authenticate known users" do
 #    user1 = users(:first_user)
 #    assert_equal user1, User.log_in(user1.username, "password")
 #  end

 #  test "won't authenticate mismatched data" do
 #    assert_not User.log_in("my_username", "notpassword")
 #  end

 #  test "won't authenticate a known user with a bad password" do
 #    user2 = users(:second_user)
 #    assert_not User.log_in(user2.username, "otherpassword")
 # end
 
end
