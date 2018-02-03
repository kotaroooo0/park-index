require 'test_helper'

class SkiresortTest < ActiveSupport::TestCase

  def setup
    @skiresort = skiresorts(:valid_skiresort)
  end

  test "should be valid" do
    assert @skiresort.valid?
  end

  test "name should be presence" do
    @skiresort.name = ""
    assert_not @skiresort.valid?
  end

  test "prefecture should be presence" do
    @skiresort.prefecture = ""
    assert_not @skiresort.valid?
  end

  test "area should be presence" do
    @skiresort.area = ""
    assert_not @skiresort.valid?
  end

  test "park_count should be presence" do
    @skiresort.park_count = ""
    assert_not @skiresort.valid?
  end



end
