require 'test_helper'

class CorporatesInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:kohei)
  end

  test "corporate interface" do
    log_in_as(@user)
    get root_path
    # 無効な送信
    assert_no_difference 'Corporate.count' do
      post corporates_path, params: { corporate: { corp_name: "", aspiration: "" } }
    end
    assert_select 'div#error_explanation'
    # 有効な送信
    assert_difference 'Corporate.count', 1 do
      post corporates_path, params: { corporate: { corp_name: "A", aspiration: "A" } }
    end
    assert_redirected_to user_path(@user)
    # 違うユーザーのプロフィールにアクセス（削除リンクがないことを確認）
    get user_path(users(:archer))
    assert_select 'a', text: 'delete', count: 0
  end
end
