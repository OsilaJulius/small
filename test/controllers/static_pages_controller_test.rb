require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_url
    assert_response :success
    assert_select 'title', 'Small'
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select 'title', 'About | Small'
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select 'title', 'Help | Small'
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select 'title', 'Contact | Small'
  end
end
