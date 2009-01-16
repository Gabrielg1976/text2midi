require 'test_helper'

class ChordsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:chords)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create chord" do
    assert_difference('Chord.count') do
      post :create, :chord => { }
    end

    assert_redirected_to chord_path(assigns(:chord))
  end

  test "should show chord" do
    get :show, :id => chords(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => chords(:one).id
    assert_response :success
  end

  test "should update chord" do
    put :update, :id => chords(:one).id, :chord => { }
    assert_redirected_to chord_path(assigns(:chord))
  end

  test "should destroy chord" do
    assert_difference('Chord.count', -1) do
      delete :destroy, :id => chords(:one).id
    end

    assert_redirected_to chords_path
  end
end
