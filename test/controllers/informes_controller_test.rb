require 'test_helper'

class InformesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @informe = informes(:one)
  end

  test "should get index" do
    get informes_url
    assert_response :success
  end

  test "should get new" do
    get new_informe_url
    assert_response :success
  end

  test "should create informe" do
    assert_difference('Informe.count') do
      post informes_url, params: { informe: { archivo: @informe.archivo, nombre: @informe.nombre } }
    end

    assert_redirected_to informe_url(Informe.last)
  end

  test "should show informe" do
    get informe_url(@informe)
    assert_response :success
  end

  test "should get edit" do
    get edit_informe_url(@informe)
    assert_response :success
  end

  test "should update informe" do
    patch informe_url(@informe), params: { informe: { archivo: @informe.archivo, nombre: @informe.nombre } }
    assert_redirected_to informe_url(@informe)
  end

  test "should destroy informe" do
    assert_difference('Informe.count', -1) do
      delete informe_url(@informe)
    end

    assert_redirected_to informes_url
  end
end
