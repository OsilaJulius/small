require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'Julius', email: 'jules@example.com')
  end

  test "user is valid" do
    @user.save
    assert @user.valid?
  end
end
