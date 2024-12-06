require "test_helper"

class EventoSalasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @evento_sala = evento_salas(:one)
  end

  test "should get index" do
    get evento_salas_url
    assert_response :success
  end

  test "should get new" do
    get new_evento_sala_url
    assert_response :success
  end

  test "should create evento_sala" do
    assert_difference("EventoSala.count") do
      post evento_salas_url, params: { evento_sala: { evento_id: @evento_sala.evento_id, sala_id: @evento_sala.sala_id } }
    end

    assert_redirected_to evento_sala_url(EventoSala.last)
  end

  test "should show evento_sala" do
    get evento_sala_url(@evento_sala)
    assert_response :success
  end

  test "should get edit" do
    get edit_evento_sala_url(@evento_sala)
    assert_response :success
  end

  test "should update evento_sala" do
    patch evento_sala_url(@evento_sala), params: { evento_sala: { evento_id: @evento_sala.evento_id, sala_id: @evento_sala.sala_id } }
    assert_redirected_to evento_sala_url(@evento_sala)
  end

  test "should destroy evento_sala" do
    assert_difference("EventoSala.count", -1) do
      delete evento_sala_url(@evento_sala)
    end

    assert_redirected_to evento_salas_url
  end
end
