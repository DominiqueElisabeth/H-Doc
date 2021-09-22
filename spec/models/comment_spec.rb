require 'rails_helper'
describe 'Comment model function', type: :model do

  describe 'Validation test' do
    context 'If the comment is empty' do
      it 'It is hard to Validation' do
        post = FactoryBot.create(:post )
        doctor = FactoryBot.create(:doctor)
        comment = Comment.create( content: "", post_id: post.id, doctor_id: doctor.id )
        expect(comment).not_to be_valid
      end
    end
    context 'If the comment section is described' do
      it 'Validation passes' do
        post = FactoryBot.create(:post )
        doctor = FactoryBot.create(:doctor)
        comment = Comment.create( content: "okay", post_id: post.id, doctor_id: doctor.id )
        expect(comment).to be_valid
      end
    end
  end
end
