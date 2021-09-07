require 'rails_helper'

RSpec.describe Staff, type: :model do
  describe 'バリデーションのテスト' do
    context '名前が空の場合' do
      it 'バリデーションにひっかる' do
        staff = Staff.new(name: '', password: 'password')
        expect(staff).not_to be_valid
      end
    end
    context '名前が20文字以上の場合' do
      it 'バリデーションにひっかる' do
        staff = Staff.new(name: 'a'*21, password: 'password')
        expect(staff).not_to be_valid
      end
    end
    context '名前が20文字以内の場合' do
      it '正常に通る' do
        staff = Staff.new(name: 'a'*20, password: 'password')
        expect(staff).to be_valid
      end
    end
    context 'パスワードが空の場合' do
      it 'バリデーションにひっかかる' do
        staff = Staff.new(name: 'test', password: '')
        expect(staff).not_to be_valid
      end
    end
    context 'パスワードが6文字以下の場合' do
      it 'バリデーションにひっかかる' do
        staff = Staff.new(name: 'test', password: 'a'*5)
        expect(staff).not_to be_valid
      end
    end
    context 'パスワードが6文字以上の場合' do
      it '正常に通る' do
        staff = Staff.new(name: 'test', password: 'a'*7)
        expect(staff).to be_valid
      end
    end
    context '必須項目が記載されている場合' do
      it 'バリデーションが通る' do
        staff = Staff.new(name: 'test', password: 'password')
        expect(staff).to be_valid
      end
    end
  end
end
