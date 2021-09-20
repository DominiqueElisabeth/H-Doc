require 'rails_helper'
RSpec.describe 'Patient management function', type: :system do

  describe 'Patient creation function' do
    context 'When creating a new patient' do
      it 'Account  is registered and  page is displayed'  do
      visit root_path
      click_on 'Sign Up'
        fill_in 'name', with: 'patient1'
        fill_in 'email', with: 'patient@gmail.com'
        fill_in 'password', with: '123456'
        fill_in 'password_confirmation', with: '123456'
        click_button "Sign up"
        expect(page).to have_content 'My page'
      end
    end
  end

    describe'login  function'  do
    context'If  you enter the required information on the login page and press the login button'  do
      it 'Your page is displayed'  do
        visit root_path
        click_on 'Sign Up'
          fill_in 'name', with: 'patient1'
          fill_in 'email', with: 'patient@gmail.com'
          fill_in 'password', with: '123456'
          fill_in 'password_confirmation', with: '123456'
          click_button "Sign up"
          click_link 'logout'
          visit root_path
          click_on 'Login'
          fill_in 'email', with: 'patient@gmail.com'
          fill_in 'password', with: '123456'
          click_on 'Login'
          expect(page).to have_content 'My page'
        end
      end
    end

    describe 'logout  function'  do
      context 'if  you press the logout link in the header'  do
        it 'Log  out and return to the top page'  do
          visit root_path
          click_on 'Sign Up'
          fill_in 'name', with: 'patient1'
          fill_in 'email', with: 'patient@gmail.com'
          fill_in 'password', with: '123456'
          fill_in 'password_confirmation', with: '123456'
          click_button "Sign up"
          fill_in 'email', with: 'patient@gmail.com'
          fill_in 'password', with: '123456'
          click_on 'Login'
          click_link  'logout'
          expect(page).to have_content 'Logged  out'
        end
      end
    end

      describe 'Profile  editing function'  do
    context 'When  you enter the account information on the user edit screen and press the update button'  do
      it 'Account  information is updated and community list page is displayed'  do
        visit root_path
        click_on 'Sign Up'
        fill_in 'name', with: 'patient2'
        fill_in 'email', with: 'patient2@gmail.com'
        fill_in 'password', with: '123456'
        fill_in 'password_confirmation', with: '123456'
        click_button "Sign up"
        click_on 'My  Page'
        click_on 'Edit  profile'
        fill_in 'name', with: 'patient2'
        fill_in 'email', with: 'patient2@gmail.com'
        fill_in 'password', with: '123456'
        fill_in 'password_confirmation', with: '123456'
        click_on 'update'
        expect(page).to have_content 'Your  account information has changed.'
      end
    end
  end
  describe 'account  deletion function'  do
  context 'When  you press the delete account button in the profile edit screen'  do
    it 'Account  is deleted and returns to top page'  do
      visit root_path
      fill_in 'name', with: 'patient2'
      fill_in 'email', with: 'patient2@gmail.com'
      fill_in 'password', with: '123456'
      fill_in 'password_confirmation', with: '123456'
      click_button 'Sign up'
      click_on 'My  Page'
      click_on 'Edit  profile'
      click_button 'cancel my account'
      page.driver.browser.switch_to.alert.accept
      expect(page).to have_content 'Your  account has been deleted. We look forward to seeing you again. '
    end
  end
end
  describe 'Guest  login function'  do
      context 'When  you press the guest login button'  do
        it 'Transition to my page'  do
          visit root_path
          click_link 'login as a patient'
          expect(page).to have_content 'You have  logged in. '
          expect(page).to have_content 'guest'
        end
      end
    end

    describe 'Guest  administrator login function'  do
      context 'When  you press the guest login button'  do
        it 'Transition to post page' do
          visit root_path
          click_link 'Login as an administrator '
          expect(page).to have_content 'You have  logged in. '
          expect(page).to have_content 'administrator'
        end
      end
    end
  end
