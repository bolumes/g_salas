require "application_system_test_case"

class FormacaosTest < ApplicationSystemTestCase
  setup do
    @formacao = formacaos(:one)
  end

  test "visiting the index" do
    visit formacaos_url
    assert_selector "h1", text: "Formacaos"
  end

  test "should create formacao" do
    visit formacaos_url
    click_on "New formacao"

    fill_in "Descricao", with: @formacao.descricao
    fill_in "Nome", with: @formacao.nome
    click_on "Create Formacao"

    assert_text "Formacao was successfully created"
    click_on "Back"
  end

  test "should update Formacao" do
    visit formacao_url(@formacao)
    click_on "Edit this formacao", match: :first

    fill_in "Descricao", with: @formacao.descricao
    fill_in "Nome", with: @formacao.nome
    click_on "Update Formacao"

    assert_text "Formacao was successfully updated"
    click_on "Back"
  end

  test "should destroy Formacao" do
    visit formacao_url(@formacao)
    click_on "Destroy this formacao", match: :first

    assert_text "Formacao was successfully destroyed"
  end
end
