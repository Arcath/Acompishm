require 'test_helper'

class AchievementsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Achievement.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Achievement.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Achievement.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to achievement_url(assigns(:achievement))
  end
  
  def test_edit
    get :edit, :id => Achievement.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Achievement.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Achievement.first
    assert_template 'edit'
  end

  def test_update_valid
    Achievement.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Achievement.first
    assert_redirected_to achievement_url(assigns(:achievement))
  end
  
  def test_destroy
    achievement = Achievement.first
    delete :destroy, :id => achievement
    assert_redirected_to achievements_url
    assert !Achievement.exists?(achievement.id)
  end
end
