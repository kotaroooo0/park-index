require 'test_helper'

class ParkTest < ActiveSupport::TestCase

  def setup
    @park = parks(:valid_park)
  end

  # test "should be valid" do
  #   assert @park.valid?
  # end
  #
  # test "name should be presence" do
  #   @park.name = ""
  #   assert_not @park.valid?
  # end
  #
  # test "item should be presence" do
  #   @park.item = ""
  #   assert_not @park.valid?
  # end
  #
  # test "level should be presence" do
  #   @park.level = ""
  #   assert_not @park.valid?
  # end
  #
  # test "skiresort_id should be presence" do
  #   @park.skiresort_id = ""
  #   assert_not @park.valid?
  # end
  #
  # test "comment_count should be presence" do
  #   @park.comment_count = ""
  #   assert_not @park.valid?
  # end

end
