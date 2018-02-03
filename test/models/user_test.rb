require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:valid_user)
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "name should not be too long" do
    @user.name = 'a' * 31
    assert_not @user.valid?
  end

  test "name should be presence" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "self_introduction should not be too long" do
    @user.self_introduction = 'a' * 142
    assert_not @user.valid?
  end

end
