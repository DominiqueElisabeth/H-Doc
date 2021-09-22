require 'rails_helper'

RSpec.describe 'Doctor management function', type: :system do

  context 'When creating a new doctor' do
    it 'The created doctor is displayed' do
      visit new_doctor_path
      fill_in :Name,                  with: "doctor"
      fill_in :Password,              with: "123456"
      click_button "Sign up"
      expect(page).to have_content "Sign up"
    end
  end

  describe 'Sign in' do
    before do
      visit new_doctor_path
      fill_in 'doctor_name',                 with: 'doctor1'
      fill_in 'doctor_password',              with: '123456'
      fill_in 'doctor_password_confirmation', with: '123456'

      click_button "Sign up"

      visit new_doctor_session_path

      fill_in :Name,     with: "doctor1"
      fill_in :Password, with: "123456"
      click_button "Sign in"

    end
    context 'Sign in' do
      it 'You signed in' do
        expect(page).to have_content "Sign in"
      end
    end
    context 'When you logged in' do
      it 'Transfert to your page' do
        visit root_path
        click_button "Login as an admin"
        expect(page).to have_content "admin"
        expect(page).to have_content "You have logged in as an admin"
      end
    end

    context 'Doctor edit screen' do
      it 'Doctor can edit his details' do

        visit root_path
        click_button "Login as an admin"
        click_link "Doctor Informations"
        click_link 'Edit'

        doctor = Doctor.find_by(id:1)

        fill_in :doctor_name,                    with: "doctor1"
        fill_in :doctor_password,                with: "111111"
        fill_in :doctor_password_confirmation,   with: "111111"
        fill_in :doctor_current_password,        with: SecureRandom.urlsafe_base64
        click_button "Update"
        expect(page).to have_content "Current password is invalid"
      end
    end

    context 'If the edit is empty' do
        it 'Editing fails and does not transition' do
          visit root_path
          click_button "Login as an admin"
          click_link "Doctor Informations"

          click_button 'Edit'

          expect(current_path).to have_content "/doctors/edit.1"
          click_button "Update"
          expect(page).to have_content "Current password can't be blank"
        end
      end
      context 'Delete account' do
        it 'Transfer to login screen' do
          visit root_path
          click_button "Login as an admin"
          click_link "Doctor Informations"

          click_button 'Edit'
          click_on 'cancel my account'
          page.driver.browser.switch_to.alert.accept
          expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
        end
      end

      context 'Logout' do
        it 'Transfer to login screen' do
          visit root_path
          click_button "Login as an admin"
          click_link "Doctor Informations"

          click_button 'Delete'
          click_on "Sign out"
          expect(page).to have_content "Signed out successfully."
        end
      end
    end
  end
