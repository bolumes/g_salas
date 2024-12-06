require "application_system_test_case"

class EventoSalasTest < ApplicationSystemTestCase
  setup do
    @evento_sala = evento_salas(:one)
  end

  test "visiting the index" do
    visit evento_salas_url
    assert_selector "h1", text: "Evento salas"
  end

  test "should create evento sala" do
    visit evento_salas_url
    click_on "New evento sala"

    fill_in "Evento", with: @evento_sala.evento_id
    fill_in "Sala", with: @evento_sala.sala_id
    click_on "Create Evento sala"

    assert_text "Evento sala was successfully created"
    click_on "Back"
  end

  test "should update Evento sala" do
    visit evento_sala_url(@evento_sala)
    click_on "Edit this evento sala", match: :first

    fill_in "Evento", with: @evento_sala.evento_id
    fill_in "Sala", with: @evento_sala.sala_id
    click_on "Update Evento sala"

    assert_text "Evento sala was successfully updated"
    click_on "Back"
  end

  test "should destroy Evento sala" do
    visit evento_sala_url(@evento_sala)
    click_on "Destroy this evento sala", match: :first

    assert_text "Evento sala was successfully destroyed"
  end
end
