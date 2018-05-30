class Student < ApplicationRecord

    validates :firstname ,presence:true, format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    validates :lastname ,presence:true,format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
    validates :emailid ,presence:true,uniqueness:true, format:{with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i}
    validates :mobilenumber ,presence:true,format: { with: /\A[0-9]{10}+\z/,message: "only numbers allowed" }
    validates :date_of_birth,presence:true
    validates :gender ,presence:true
    validates :password,presence:true, length: {minimum: 6, maximum: 10}
    validates :confirm_password,presence:true
end
