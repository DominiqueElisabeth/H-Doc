require 'rails_helper'
RSpec.describe 'Patient management function', type: :system do

  describe 'Patient user registration test' do
    context 'When creating a new patient' do
      it 'cannot be created without reCAPTCHA' do

        visit new_patient_registration_path
        fill_in :name,                  with: "patient"
        fill_in :email,                 with: "test@ex.com"
        fill_in :password,              with: "123456"
        fill_in :password_confirmation, with: "123456"
        click_button "Sign Up"
        expect(page).to have_content "Sign up"
      end
    end
  end

  describe 'Sign in' do
    before do
      fill_in :name,     with: @patient.name
      fill_in :password, with: @patient.password
      click_button "Sign in"
    end
    context 'Sign in' do
      it 'You signed in' do
        expect(page).to have_content "Sign in"
      end
    end
    context 'When you logged in' do
      it 'Transfert to your page' do

        expect(page).to have_content "patient1"
        expect(current_path).to have_content "/patients/#{patient1.id}"
      end
    end
    context 'Patient edit screen' do
      it 'Patient can edit his details' do
        click_link 'Edit your account'

        fill_in :name,     with: "patient1"
        fill_in :email,     with: "test@gmail.com"
        fill_in :password,     with: "111111"
        fill_in :password_confirmation,     with: "111111"
        fill_in :current_password,     with: "password"
        click_button "Sign up"
        expect(page).to have_content "Account information changed."
      end
    end
    context 'If the edit is empty' do
      it 'Editing fails and does not transition' do
        click_link 'Account edit'
        expect(current_path).to have_content "/patients/edit.#{patient1.id}"
        click_button "Update"
        expect(page).to have_content "Patient information was not saved due to an error."
      end
    end
    context 'Delete account' do
      it 'Transfer to login screen' do
        click_link 'Edit your account'
        click_on 'Cancel my account'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "I deleted my account. We look forward to seeing you again."
      end
    end
    context 'Logout' do
      it 'Transfer to login screen' do
        click_on "Sign out"
        expect(page).to have_content "Logged out"
      end
    end
  end
end
