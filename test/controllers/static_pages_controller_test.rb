require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "My就活"
  end
  
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "本サイトについて | My就活"
  end
  
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | My就活"
  end

end
