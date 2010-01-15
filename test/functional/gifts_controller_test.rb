require File.dirname(__FILE__) + '/../test_helper'

class GiftsControllerTest < ActionController::TestCase
  fixtures do
    @user = User.make
    @gift = Gift.make
    @friend = User.make
    @user.friends << @friend
    @friends_gift = @user.gifts.give(@gift, @friend, "Here's your gift")
  end

  describe "admin user" do
    before do
      stub(@controller).current_user { @user }
    end

    it "#index shows all gifts" do
      get :index
      assigns(:gifts).should == [@gift]
    end
  end
end
