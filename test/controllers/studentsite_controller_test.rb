require 'test_helper'

class StudentsiteControllerTest < ActionDispatch::IntegrationTest
  test "should get showinformations" do
    get studentsite_showinformations_url
    assert_response :success
  end

  test "should get showtimetable" do
    get studentsite_showtimetable_url
    assert_response :success
  end

  test "should get showdayorder" do
    get studentsite_showdayorder_url
    assert_response :success
  end

  test "should get showreasons" do
    get studentsite_showreasons_url
    assert_response :success
  end

  test "should get showattendance" do
    get studentsite_showattendance_url
    assert_response :success
  end

end
