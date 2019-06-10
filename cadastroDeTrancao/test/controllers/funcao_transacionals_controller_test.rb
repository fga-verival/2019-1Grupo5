require 'test_helper'

class FuncaoTransacionalsControllerTest < ActionController::TestCase
  setup do
    @funcao_transacional = funcao_transacionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funcao_transacionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create funcao_transacional" do
    assert_difference('FuncaoTransacional.count') do
      post :create, funcao_transacional: { complexity: @funcao_transacional.complexity, nameCounter: @funcao_transacional.nameCounter, nameFunc: @funcao_transacional.nameFunc, param1: @funcao_transacional.param1, param2: @funcao_transacional.param2, qntdPF: @funcao_transacional.qntdPF, registry: @funcao_transacional.registry, typeFunc: @funcao_transacional.typeFunc }
    end

    assert_redirected_to funcao_transacional_path(assigns(:funcao_transacional))
  end

  test "should show funcao_transacional" do
    get :show, id: @funcao_transacional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @funcao_transacional
    assert_response :success
  end

  test "should update funcao_transacional" do
    patch :update, id: @funcao_transacional, funcao_transacional: { complexity: @funcao_transacional.complexity, nameCounter: @funcao_transacional.nameCounter, nameFunc: @funcao_transacional.nameFunc, param1: @funcao_transacional.param1, param2: @funcao_transacional.param2, qntdPF: @funcao_transacional.qntdPF, registry: @funcao_transacional.registry, typeFunc: @funcao_transacional.typeFunc }
    assert_redirected_to funcao_transacional_path(assigns(:funcao_transacional))
  end

  test "should destroy funcao_transacional" do
    assert_difference('FuncaoTransacional.count', -1) do
      delete :destroy, id: @funcao_transacional
    end

    assert_redirected_to funcao_transacionals_path
  end
end
