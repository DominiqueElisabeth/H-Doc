json.extract! post, :id, :symptom, :age, :dob, :weight, :phone, :sex, :remark, :patient_id, :created_at, :updated_at
json.url post_url(post, format: :json)
