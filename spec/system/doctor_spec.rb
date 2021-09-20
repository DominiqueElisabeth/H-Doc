require 'rails_helper'
RSpec.describe 'Doctor management function', type: :system do
  describe 'Doctor creation function' do
    context 'When creating a new doctor' do
      it 'doctor is registered' do
        visit new_doctor_registration_path
        fill_in 'name', with: 'doctor'
        fill_in 'password', with: '123456'
        fill_in 'password_confirmation', with: '123456'
        click_button "Sign up"
        expect(page).to have_content 'your page'
      end
    end
    context 'When the user tries to jump to the plaint list screen without logging' do
      it 'Transition to the login screen' do
        visit posts_path
        expect(page).to have_content 'Log in'
      end
    end
  end
  describe 'Testing session functionality' do
    before do
      @doctor = FactoryBot.create(:doctor)
      @doctor2 = FactoryBot.create(:doctor2)
    end
    context 'When user tries login' do
      it 'Login is a success' do
        visit new_doctor_session_path
        fill_in 'name', with: @doctor.name
        fill_in 'password', with: @doctor.password
        click_button "Login"
        expect(page).to have_content 'Your page'
      end
    end
    context 'When the doctor tries to jump to your details screen' do
      it 'You can jump to your details screen' do
        visit new_doctor_session_path
        fill_in 'name', with: @doctor.name
        fill_in 'password', with: @doctor.password
        click_button "Login"
        visit user_path(@doctor.id)
        expect(page).to have_content 'Welcome to your page'
      end
    end
    context 'When a general user jumps to another person\'s details screen' do
      it 'It will transition to the plaint list screen' do
        visit new_patient_session_path
        fill_in 'name', with: @doctor.name
        fill_in 'password', with: @doctor.password
        click_button "Login"
        visit user_path(@doctor2.id)
        expect(page).to have_content 'Post index'
      end
    end
    context 'When the doctor tries to logout' do
      it 'Logout successfully' do
        visit new_doctor_session_path
        fill_in 'name', with: @doctor.name
        fill_in 'password', with: @doctor.password
        click_button "Login"
        click_link "Log out"
        expect(page).to have_content 'Sign up'
      end
    end
  end
  describe 'Admin screen test function' do
    before do
      @doctor = FactoryBot.create(:doctor)
      @doctor2 = FactoryBot.create(:doctor2)
      @admin = FactoryBot.create(:admin)
    end
    context 'When admin tries to access admin screen' do
      it 'Admin screen is successfully displayed' do
        visit new_doctor_session_path
        fill_in 'email', with: @admin.email
        fill_in 'password', with: @admin.password
        click_button "Login"
        visit admin_doctors_path
        expect(page).to have_content 'Doctor list'
      end
    end
    context 'When general user tries to access admin screen' do
      it 'Admin screen is not displayed' do
        visit new_doctor_session_path
        fill_in 'name', with: @doctor.name
        fill_in 'password', with: @doctor.password
        click_button "Login"
        visit admin_doctors_path
        expect(page).to have_content 'add an appointment'
      end
    end
    context 'When admin tries to register new doctor' do
      it 'Admin can register doctor successfully' do
        visit new_doctor_session_path
        fill_in 'email', with: @admin.email
        fill_in 'password', with: @admin.password
        click_button "Login"
        visit new_admin_doctor_path
        fill_in 'name', with: 'doctor3'
        fill_in 'password', with: '1234567'
        fill_in 'password_confirmation', with: '1234567'
        click_button "Register"
        expect(page).to have_content 'doctor3'
      end
    end
    context 'When admin tries to access the Appointments screen' do
      it 'The appointments screen is successfully displayed' do
        visit new_doctor_session_path
        fill_in 'email', with: @admin.email
        fill_in 'password', with: @admin.password
        click_button "Login"
        visit admin_doctor_path(@doctor.id)
        expect(page).to have_content 'Page of '+@doctor.name
      end
    end
    context 'When admin tries to edit the doctor' do
      it 'The doctor edit screen is successfully displayed' do
        visit new_doctor_session_path
        fill_in 'email', with: @admin.email
        fill_in 'password', with: @admin.password
        click_button "Login"
        visit edit_admin_doctor_path(@doctor.id)
        expect(page).to have_content 'Edit doctor'
      end
    end
    context 'When admin tries to delete a patient' do
      it 'The user is deleted successfully' do
        visit new_doctor_session_path
        fill_in 'email', with: @admin.email
        fill_in 'password', with: @admin.password
        click_button "Login"
        visit admin_doctors_path
        click_on "delete#{@doctor2.id}"
        expect(page).to_not have_content @doctor2.id
      end
    end
  end
end
