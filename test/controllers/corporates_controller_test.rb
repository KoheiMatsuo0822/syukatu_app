require 'test_helper'

class CorporatesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @corporate = corporates(:corp_A)
    @user = users(:kohei)
    @other_user = users(:archer)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Corporate.count' do
      post corporates_path, params: { corporate: { corp_name: "A", aspiration: "A" } }
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do
    assert_no_difference 'Corporate.count' do
      delete corporate_path(@corporate)
    end
    assert_redirected_to login_url
  end
  
  
  test "should redirect detail when not logged " do
    get detail_path(@corporate)
    assert_redirected_to login_url
  end
  
  test "should redirect detail when logged in as wrong user" do
    log_in_as(@other_user)
    get detail_path(@corporate)
    assert_redirected_to root_path
  end
  
  test "should redirect edit when logged in as wrong user" do
    log_in_as(@other_user)
    get edit_corp_path(@corporate)
    assert_redirected_to root_path
  end
  
  test "should redirect destroy when logged in as wrong user" do
    log_in_as(@other_user)
    assert_no_difference 'Corporate.count' do
      delete corporate_path(@corporate)
    end
    assert_redirected_to root_url
  end
  
  
end
