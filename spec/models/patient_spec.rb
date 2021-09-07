require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションにひっかる' do
        patient = Patient.new(name: '', email: 'test@mail.com', password: 'password')
        expect(patient).not_to be_valid
      end
    end
    context '名前が20文字以上の場合' do
      it 'バリデーションにひっかる' do
        patient = Patient.new(name: 'a'*21, email: 'test@mail.com', password: 'password')
        expect(patient).not_to be_valid
      end
    end
    context '名前が20文字以内の場合' do
      it '正常に通る' do
        patient = Patient.new(name: 'a'*20, email: 'test@mail.com', password: 'password')
        expect(patient).to be_valid
      end
    end
    context 'メールアドレスが空の場合' do
      it 'バリデーションにひっかかる' do
        patient = Patient.new(name: 'test', email: '', password: 'password')
        expect(patient).not_to be_valid
      end
    end
    context 'メールアドレスが255文字以上の場合' do
      it 'バリデーションにひっかかる' do
        patient = Patient.new(name: 'test', email: 'a'*256+"@gamil.com", password: 'password')
        expect(patient).not_to be_valid
      end
    end
    context 'メールアドレスが255文字以内の場合' do
      it 'バリデーションにひっかかる' do
        patient = Patient.new(name: 'test', email: 'a'*245+"@gamil.com", password: 'password')
        expect(patient).to be_valid
      end
    end
    context 'メールアドレスが重複の場合' do
      it 'バリデーションにひっかかる' do
        patient_a = Patient.create(name: 'test', email: 'test@mail.com', password: 'password')
        patient_b = Patient.new(name: 'test_copy', email: 'test@mail.com', password: 'password')
        expect(patient_a).to be_valid
        expect(patient_b).not_to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        patient = Patient.new(name: 'test', email: 'test@mail.com', password: '')
        expect(patient).not_to be_valid
      end
    end
    context 'パスワードが6文字以上の場合' do
      it '正常に通る' do
        patient = Patient.new(name: 'test', email: 'test@mail.com', password: 'a'*7)
        expect(patient).to be_valid
      end
    end
    context 'パスワードが6文字以下の場合' do
      it '正常に通る' do
        patient = Patient.new(name: 'test', email: 'test@mail.com', password: 'a'*5)
        expect(patient).not_to be_valid
      end
    end
    context '必須項目が記載されている場合' do
      it 'バリデーションが通る' do
        patient = Patient.new(name: 'test', email: 'test@mail.com', password: 'password')
        expect(patient).to be_valid
      end
    end
  end
end