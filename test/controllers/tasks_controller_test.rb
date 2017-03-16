require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  test "should get homepage" do
    get :homepage
    assert_response :success
  end

  test "should get createtask" do
    get :createtask
    assert_response :success
  end

  test "should get updatetask" do
    get :updatetask
    assert_response :success
  end

end
