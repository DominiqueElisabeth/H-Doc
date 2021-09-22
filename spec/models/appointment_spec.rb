require 'rails_helper'
describe 'Appointment model function', type: :model do

  describe 'Appointment model function' do
    context 'If the date is set empty' do
      it 'It is hard to Validation' do
        post = FactoryBot.create(:post )
        doctor = FactoryBot.create(:doctor)
        appointment = Appointment.create( date: "", time: "16:17:00", post_id: post.id, doctor_id: doctor.id )
        expect(appointment).not_to be_valid
      end
    end
    context 'If the time is set empty' do
      it 'It is hard to Validation' do
        post = FactoryBot.create(:post )
        doctor = FactoryBot.create(:doctor)
        appointment = Appointment.create( date: "2021-09-07", time: "", post_id: post.id, doctor_id: doctor.id )
        expect(appointment).not_to be_valid
      end
    end
    context 'If the date and time are described' do
      it 'Validation passes' do
        post = FactoryBot.create(:post )
        doctor = FactoryBot.create(:doctor)
        appointment = Appointment.create( date: "2021-09-07", time: "16:17:00", post_id: post.id, doctor_id: doctor.id )
        expect(appointment).to be_valid
      end
    end
  end
end
