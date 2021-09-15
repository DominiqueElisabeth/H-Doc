require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validation test' do
    before do
      @patient = FactoryBot.create(:patient)
    end
    context 'If the post symptom is empty' do
    it 'It is hard to Validation' do
      post = Post.new(symptom: '', remark: 'remark', patient_id: @patient.id)
      expect(post).not_to be_valid
    end
    end
    context 'If the post remark are empty' do
    it 'Validation is not pass' do
      post = Post.new(symptom: 'symptom', remark: '', patient_id: @patient.id)
      expect(post).to be_valid
    end
    end
    context 'If the post symptom and remark are described' do
    it 'Validation passes' do
      post = Post.new(symptom: 'symptom', remark: 'remark', patient_id: @patient.id)
      expect(post).to be_valid
    end
    end
  end
end
