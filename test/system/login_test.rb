require 'application_system_test_case'

class FoodsTest < ApplicationSystemTestCase
  def setup
    @user = User.create!(name: 'Tetteh', email: 'tkamen@outlook.com', password: '123456')
    @user.save!
    visit new_user_session_path
  end

  test 'displays email and password input field and submit button' do
    assert_text 'Email'
    assert_text 'Password'
    assert_button 'Log in'
  end

  test 'click on SIGNUP button' do
    # Find the link using a CSS selector that targets both the link text and the icon
    link = find('a', text: 'Sign up', match: :first)
    # Click on the link
    link.click
    sleep(1)
    assert_current_path new_user_registration_path
  end

  test 'click on `Forgot your password?`' do
    click_link 'Forgot your password?'
    assert_current_path new_user_password_path
  end

  test 'click on `Didn`t receive confirmation instructions?`' do
    click_link "Didn't receive confirmation instructions?"
    assert_current_path new_user_confirmation_path
  end
end
