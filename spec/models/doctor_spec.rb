require 'rails_helper'

RSpec.describe Doctor, type: :model do
  describe 'Validation test' do
		context 'If the Doctor name is empty' do
			it 'It is hard to Validation' do
				doctor = Doctor.new(name: '', password: "123456", password_confirmation: "123456")
				expect(doctor).not_to be_valid
			end
	    end
	    context 'If the doctor password or password_confirmation is empty' do
			it 'It is hard to Validation' do
				doctor = Doctor.new(name: 'no', password: "", password_confirmation: "123456")
				doctor2 = Doctor.new(name: 'no', password: "123456", password_confirmation: "")
				expect(doctor).not_to be_valid
				expect(doctor2).not_to be_valid
			end
	    end
	    context 'If the doctor password and password_confirmation are different' do
			it 'Validation is not pass' do
				doctor = Doctor.new(name: 'no', password: "109876", password_confirmation: "123456")
				expect(doctor).not_to be_valid
			end
	    end
	    context 'If the doctor password and password_confirmation are less than 6 characters' do
			it 'Validation is not pass' do
				doctor = Doctor.new(name: 'no', password: "1234", password_confirmation: "1234")
				expect(doctor).not_to be_valid
			end
	    end
	    context 'If the Doctor Name is present; password is at least 6 characters and matches with password_confirmation' do
			it 'Validation passes' do
				doctor = Doctor.new(name: 'no', password: "123456", password_confirmation: "123456")
				expect(doctor).to be_valid
			end
	    end
    end
end
