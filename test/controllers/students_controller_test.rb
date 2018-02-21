require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get insert" do
    get students_insert_url
    assert_response :success
  end

  test "should get edit" do
    get students_edit_url
    assert_response :success
  end

  test "should get delete" do
    get students_delete_url
    assert_response :success
  end

  test "should get show" do
    get students_show_url
    assert_response :success
  end

  test "should get updateattendance" do
    get students_updateattendance_url
    assert_response :success
  end

end
