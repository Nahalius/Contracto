require 'test_helper'

class AgreemntsControllerTest < ActionController::TestCase
  setup do
    @agreemnt = agreemnts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:agreemnts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create agreemnt" do
    assert_difference('Agreemnt.count') do
      post :create, agreemnt: { amount: @agreemnt.amount, budget_hours: @agreemnt.budget_hours, client_id: @agreemnt.client_id, date: @agreemnt.date, manager: @agreemnt.manager, name: @agreemnt.name }
    end

    assert_redirected_to agreemnt_path(assigns(:agreemnt))
  end

  test "should show agreemnt" do
    get :show, id: @agreemnt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @agreemnt
    assert_response :success
  end

  test "should update agreemnt" do
    patch :update, id: @agreemnt, agreemnt: { amount: @agreemnt.amount, budget_hours: @agreemnt.budget_hours, client_id: @agreemnt.client_id, date: @agreemnt.date, manager: @agreemnt.manager, name: @agreemnt.name }
    assert_redirected_to agreemnt_path(assigns(:agreemnt))
  end

  test "should destroy agreemnt" do
    assert_difference('Agreemnt.count', -1) do
      delete :destroy, id: @agreemnt
    end

    assert_redirected_to agreemnts_path
  end
end
