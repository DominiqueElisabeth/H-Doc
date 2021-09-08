require 'rails_helper'
RSpec.describe '予約機能', type: :system do
  let!(:patient1) { FactoryBot.create(:patient) }
  let!(:health_interview_1) { FactoryBot.create(:health_interview, patient_id: patient1.id) }
  let!(:guide_status_1) { FactoryBot.create(:guide_status, health_interview_id: health_interview_1.id, status: "done") }

  let!(:patient2) { FactoryBot.create(:second_patient) }
  let!(:health_interview_2) { FactoryBot.create(:health_interview, patient_id: patient2.id) }
  let!(:guide_status_2) { FactoryBot.create(:guide_status, health_interview_id: health_interview_2.id) }

  let!(:patient3) { FactoryBot.create(:third_patient) }
  let!(:health_interview_3) { FactoryBot.create(:health_interview, patient_id: patient3.id) }
  let!(:guide_status_3) { FactoryBot.create(:guide_status, health_interview_id: health_interview_3.id) }

  let!(:staff) { FactoryBot.create(:staff) }

  before do
    visit health_interviews_path
  end

  describe '一覧表示機能' do
    context '予約一覧画面に遷移した場合' do
      example 'created_atの昇順で表示される' do
        @list_top = first('.healthinterviewlist')
        expect(@list_top).to have_content health_interview_2.id
      end
    end
  end

  # patient_side
  describe '新規作成機能' do
    context '既に受付済みの場合' do
      example '予約できない' do
        click_link "ログイン"
        fill_in :patient_name,    with: patient2.name
        fill_in :patient_password, with: "password"
        click_on "commit"
        visit health_interviews_path
        expect(page).not_to have_content "新規受付"
      end
    end
    context 'ガイドステータスがスタッフ側から変更された時' do
      example 'マイページのコメントが切り替わる' do
        visit new_staff_session_path
        fill_in :staff_name,    with: staff.name
        fill_in :staff_password, with: "password"
        click_button "スタッフログイン"
        first("option[value='calling']").select_option
        click_link "ログアウト"
        click_link "ログイン"
        fill_in :patient_name,     with: patient2.name
        fill_in :patient_password, with: "password"
        click_button "ログイン"
        expect(page).to have_content "こちらの画面をご提示の上、診察室へお入り下さい。"
      end
    end
  end

  describe '新規作成機能' do
    before do
      click_link "ログイン"
      fill_in :patient_name,    with: patient1.name
      fill_in :patient_password, with: "password"
      click_button "ログイン"
      visit health_interviews_path
      click_link "新規受付"
      click_button "申し込む"
    end
    context '問診票を新規作成した場合' do
      example 'マイページに整理券番号が表示される' do
        expect(page).to have_content "登録しました"
      end
    end
    context '問診票を新規作成した場合' do
      example 'マイページに整理券番号が表示される' do
        expect(page).to have_content "番号"
      end
    end
  end

  # staff_side
  describe 'ガイドステータス機能' do
    context '任意の予約詳細画面に遷移した場合' do
      example '該当患者の予約履歴内容が表示される' do
        visit new_staff_session_path
        fill_in :staff_name,    with: staff.name
        fill_in :staff_password, with: "password"
        click_on "スタッフログイン"
        click_on health_interview_2.id
        expect(page).to have_content "patient-②"
      end
    end
  end
end
