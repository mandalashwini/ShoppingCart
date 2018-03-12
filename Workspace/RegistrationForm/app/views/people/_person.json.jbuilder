json.extract! person, :id, :firstname, :lastname, :emailid, :date_of_birth, :gender, :password, :confirm_password, :created_at, :updated_at
json.url person_url(person, format: :json)
