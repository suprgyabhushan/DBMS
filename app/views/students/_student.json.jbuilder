json.extract! student, :id, :rollNumber, :user_id, :created_at, :updated_at
json.url student_url(student, format: :json)