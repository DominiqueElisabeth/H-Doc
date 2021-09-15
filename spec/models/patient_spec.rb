require 'rails_helper'

RSpec.describe Patient, type: :model do

  describe 'Validation test' do
		context 'If the Patient name is empty' do
			it 'It is hard to Validation' do
				patient = Patient.new(name: '', email: "guest@ex.com", password: "123456", password_confirmation: "123456")
				expect(patient).not_to be_valid
			end
	    end
	    context 'If the patient email is empty' do
			it 'Validation is not pass' do
				patient = Patient.new(name: 'no', email: "", password: "123456", password_confirmation: "123456")
				expect(patient).not_to be_valid
			end
	    end
	    context 'If the patient password or password_confirmation is empty' do
			it 'It is hard to Validation' do
				patient = Patient.new(name: 'no', email: "test@ex.com", password: "", password_confirmation: "123456")
				patient2 = Patient.new(name: 'no', email: "test@ex.com", password: "123456", password_confirmation: "")
				expect(patient).not_to be_valid
				expect(patient2).not_to be_valid
			end
	    end
	    context 'If the patient password and password_confirmation are different' do
			it 'Validation is not pass' do
				patient = Patient.new(name: 'no', email: "test@ex.com", password: "109876", password_confirmation: "123456")
				expect(patient).not_to be_valid
			end
	    end
	    context 'If the user password and password_confirmation are less than 6 characters' do
			it 'Validation is not pass' do
				patient = Patient.new(name: 'no', email: "test@ex.com", password: "7456", password_confirmation: "7456")
				expect(patient).not_to be_valid
			end
	    end
	    context 'If the User Name and email are present; password is at least 6 characters and matches with password_confirmation' do
			it 'Validation passes' do
				patient = Patient.new(name: 'no', email: "test@ex.com", password: "123456", password_confirmation: "123456")
				expect(patient).to be_valid
			end
	    end
    end
end
