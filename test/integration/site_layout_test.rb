require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    #using syntax that allows us to test for the presence of a particular link-URL
    #by specifying the tag name s and attribute href
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
    get contact_path
    assert_select "title", full_title("Contact")
    #visit the sign up page
    get signup_path
    #to verify that the resulting page title is correct
    assert_select "title" , full_title("Sign up")
  end
end
