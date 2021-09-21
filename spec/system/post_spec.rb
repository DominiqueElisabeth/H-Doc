require 'rails_helper'
RSpec.describe 'Post', type: :system do
  describe 'New creation function' do
     before do
       @patient = FactoryBot.create(:patient)
       visit root_path
     end
     context 'When creating a new post' do
       it 'The created post is displayed' do
         fill_in 'name', with: @patient.name
         fill_in 'password', with: @patient.password
         click_button "Sign in"
         visit new_post_path
         fill_in 'symptom', with: 'symptom'
         fill_in 'age', with: '1'
         fill_in 'dob', with: '2021-09-07'
         fill_in 'weight', with: '1'
         fill_in 'phone', with: '12345678'
         fill_in 'sex', with: 'M'
         fill_in "remark", with: "remark"

         click_button "Create Post"
         expect(page).to have_content 'post'
       end
     end
   end
   describe 'List display function' do
     before do
       @patient = FactoryBot.create(:patient2)
       visit posts_path
     end
     context 'When transitioning to the list screen' do
       it 'The created post list is displayed' do
         fill_in 'name', with: @patient.name
         fill_in 'password', with: @patient.current_password
         click_button "Sign in"
         post = FactoryBot.create(:post, symptom: 'symptom', age:'1', dob: '2021-09-07', weight: '1', phone: '1234567', sex: 'F', remark: "remark")
         visit posts_path
         expect(page).to have_content 'post'
       end
     end
   end
   describe 'Detailed display function' do
     before do
       @patient = FactoryBot.create(:patient2)

       visit posts_path
     end

     context 'When transitioned to any post details screen' do
       it 'The content of the relevant post is displayed' do
         fill_in 'name', with: @patient.name
         fill_in 'password', with: @patient.current_password
         click_button "Login"
         post = FactoryBot.create(:post, symptom: 'symptom', age:'1', dob: '2021-09-07', weight: '1', phone: '1234567', sex: 'F', remark: "remark2")
         visit post_path(post.id)
         expect(page).to have_content 'post'
       end
     end
   end
 end
