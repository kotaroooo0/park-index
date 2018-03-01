require 'test_helper'

class AreaTest < ActiveSupport::TestCase

  def setup
    @area = areas(:valid_area)
  end

  test "should be valid" do
    assert @area.valid?
  end

  test "name should be presence" do
    @area.name = ""
    assert_not @area.valid?
  end

  test "description should be presence" do
    @area.description = ""
    assert_not @area.valid?
  end

end
