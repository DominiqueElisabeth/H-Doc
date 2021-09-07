require 'rails_helper'
RSpec.describe GuideStatus, type: :model do
  let!(:patient) { FactoryBot.create(:patient) }
  let!(:health_interview) { FactoryBot.create(:health_interview, patient_id: patient.id) }
  describe 'バリデーションのテスト' do
    context 'ステータスが空の場合' do
      it 'バリデーションにひっかる' do
        guide_status = GuideStatus.new(status: '', health_interview_id: health_interview.id)
        expect(guide_status).not_to be_valid
      end
    end
    context 'ステータスが記載されている場合' do
      it 'バリデーションが通る' do
        guide_status = GuideStatus.new(status: 'calling')
        expect(guide_status).to be_valid
      end
    end
  end
end
