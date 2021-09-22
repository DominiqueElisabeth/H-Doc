require 'rails_helper'

RSpec.describe 'Patient management function', type: :system do

  describe 'Patient user registration test' do
    context 'When creating a new patient' do
      it 'cannot be created without reCAPTCHA' do

        visit new_patient_registration_path
        fill_in :Name,                  with: "patient"
        fill_in :Email,                 with: "test@ex.com"
        fill_in :Password,              with: "123456"

        click_button "Sign up"
        expect(page).to have_content "Sign up"
      end
    end
  end

  describe 'Sign in' do
    before do
      visit new_patient_registration_path
      fill_in 'patient_name', with: 'patient1'
      fill_in 'patient_email', with: 'patient1@example.com'
      fill_in 'patient_password', with: '123456'
      fill_in 'patient_password_confirmation', with: '123456'

      click_button "Sign up"

      visit new_patient_session_path

      fill_in :Name, with: "patient1"
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
        click_button "Login as a patient"
        expect(page).to have_content "patient"
        expect(page).to have_content "You have logged in as a patient"
      end
    end
    context 'Patient edit screen' do
      it 'Patient can edit his details' do

        visit root_path
        click_button "Login as a patient"
        click_link "My page"
        click_link 'Edit your account'

        patient = Patient.find_by(id:1)

        fill_in :patient_name,     with: "patient1"
        fill_in :patient_email,     with: "test@gmail.com"
        fill_in :patient_password,     with: "111111"
        fill_in :patient_password_confirmation,     with: "111111"
        fill_in :patient_current_password,     with: SecureRandom.urlsafe_base64
        click_button "Update"
        expect(page).to have_content "Current password is invalid"
      end
    end
    context 'If the edit is empty' do
      it 'Editing fails and does not transition' do
        visit root_path
        click_button "Login as a patient"
        click_link "My page"

        click_link 'Edit your account'

        expect(current_path).to have_content "/patients/edit.1"
        click_button "Update"
        expect(page).to have_content "Current password can't be blank"
      end
    end
    context 'Delete account' do
      it 'Transfer to login screen' do
        visit root_path
        click_button "Login as a patient"
        click_link "My page"

        click_link 'Edit your account'
        click_on 'cancel my account'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content "Bye! Your account has been successfully cancelled. We hope to see you again soon."
      end
    end
    context 'Logout' do
      it 'Transfer to login screen' do
        visit root_path
        click_button "Login as a patient"
        click_on "Sign out"
        expect(page).to have_content "Signed out successfully."
      end
    end
  end
end
