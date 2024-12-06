require "test_helper"

class FormacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @formacao = formacaos(:one)
  end

  test "should get index" do
    get formacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_formacao_url
    assert_response :success
  end

  test "should create formacao" do
    assert_difference("Formacao.count") do
      post formacaos_url, params: { formacao: { descricao: @formacao.descricao, nome: @formacao.nome } }
    end

    assert_redirected_to formacao_url(Formacao.last)
  end

  test "should show formacao" do
    get formacao_url(@formacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_formacao_url(@formacao)
    assert_response :success
  end

  test "should update formacao" do
    patch formacao_url(@formacao), params: { formacao: { descricao: @formacao.descricao, nome: @formacao.nome } }
    assert_redirected_to formacao_url(@formacao)
  end

  test "should destroy formacao" do
    assert_difference("Formacao.count", -1) do
      delete formacao_url(@formacao)
    end

    assert_redirected_to formacaos_url
  end
end
