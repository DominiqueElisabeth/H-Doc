require 'rails_helper'
RSpec.describe HealthInterview, type: :model do
  let!(:patient) { FactoryBot.create(:patient) }
  let!(:health_interview_0) { FactoryBot.create(:health_interview, patient_id: patient.id) }
  let!(:health_interview_1) { FactoryBot.create(:health_interview, patient_id: patient.id) }
  let!(:health_interview_3) { FactoryBot.create(:health_interview, patient_id: patient.id) }
  let!(:guide_status_0) { FactoryBot.create(:guide_status, health_interview_id: health_interview_0.id) }
  let!(:guide_status_1) { FactoryBot.create(:guide_status, health_interview_id: health_interview_1.id, status: "calling") }
  let!(:guide_status_3) { FactoryBot.create(:guide_status, health_interview_id: health_interview_3.id, status: "pending") }

  describe 'scopeのテスト' do
    # binding.irb
    before do
      @health_interviews = HealthInterview.with_guide_status
    end
    context 'scopeメソッドで絞り込み' do
      example 'initialのみ' do
        expect(@health_interviews.search_initial.sample.guide_status.status).to eq 'initial'
      end
      example 'callingのみ' do
        expect(@health_interviews.search_calling.sample.guide_status.status).to eq 'calling'
      end
      example 'pendingのみ' do
        expect(@health_interviews.search_pending.sample.guide_status.status).to eq 'pending'
      end
    end
  end
end
