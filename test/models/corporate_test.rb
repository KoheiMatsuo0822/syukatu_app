require 'test_helper'

class CorporateTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:kohei)
    @corporate = @user.corporates.build(corp_name: "A", aspiration: "B")
  end
  
  test "should be valid" do
    assert @corporate.valid?
  end
  
  test "user id should be present" do
    @corporate.user_id = nil
    assert_not @corporate.valid?
  end
  
  test "corp_name should be present" do
    @corporate.corp_name = " "
    assert_not @corporate.valid?
  end
  
  test "corp_name should be at most 50 characters" do
    @corporate.corp_name = "a" * 51
    assert_not @corporate.valid?
  end
  
  test "aspiration should be present" do
    @corporate.aspiration = " "
    assert_not @corporate.valid?
  end
  
  test "order should be most recent first" do
    assert_equal corporates(:most_recent), Corporate.first
  end
  
end
