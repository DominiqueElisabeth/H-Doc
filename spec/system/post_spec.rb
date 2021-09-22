require 'rails_helper'
RSpec.describe 'Post', type: :system do
  describe 'New creation function' do
     before do
       @patient = FactoryBot.create(:patient)
       visit root_path
       click_button "Login as a patient"
     end
     context 'When creating a new post' do
       it 'The created post is displayed' do

         visit new_post_path
         fill_in 'Symptom', with: 'symptom'
         fill_in 'Dob', with: '2021-09-07'
         fill_in 'Weight', with: '1'
         fill_in 'Phone', with: '12345678'
         select 'Male',from: 'Sex'
         fill_in "Remark", with: "remark"

         click_button "Create Post"
         expect(page).to have_content 'Post was successfully created.'
       end
     end
   end
   describe 'List display function' do
     before do
       @patient = FactoryBot.create(:patient2)
       visit root_path
       click_button "Login as a patient"
     end
     context 'When transitioning to the list screen' do
       it 'The created post list is displayed' do
         post = FactoryBot.create(:post, symptom: 'headache and stomach ache', age:'1', dob: '2021-09-07', weight: '1', phone: '1234567', sex: 'F', remark: "remark")
         visit posts_path
         expect(page).to have_content 'headache and stomach ache'
       end
     end
   end
   describe 'Detailed display function' do
     before do
       @patient = FactoryBot.create(:patient2)

       visit root_path
       click_button "Login as a patient"
     end

     context 'When transitioned to any post details screen' do
       it 'The content of the relevant post is displayed' do

         post = FactoryBot.create(:post, symptom: 'symptom', age:'1', dob: '2021-09-07', weight: '1', phone: '1234567', sex: 'F', remark: "remark2")
         visit post_path(post.id)
         expect(page).to have_content 'post'
       end
     end
   end
 end
