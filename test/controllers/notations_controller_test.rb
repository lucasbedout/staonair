require 'test_helper'

class NotationsControllerTest < ActionController::TestCase
  setup do
    @notation = notations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:notations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create notation" do
    assert_difference('Notation.count') do
      post :create, notation: { appreciation: @notation.appreciation, mark: @notation.mark, results: @notation.results, student: @notation.student }
    end

    assert_redirected_to notation_path(assigns(:notation))
  end

  test "should show notation" do
    get :show, id: @notation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @notation
    assert_response :success
  end

  test "should update notation" do
    patch :update, id: @notation, notation: { appreciation: @notation.appreciation, mark: @notation.mark, results: @notation.results, student: @notation.student }
    assert_redirected_to notation_path(assigns(:notation))
  end

  test "should destroy notation" do
    assert_difference('Notation.count', -1) do
      delete :destroy, id: @notation
    end

    assert_redirected_to notations_path
  end
end
