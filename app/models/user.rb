require "validates_email_format_of"

class User < ApplicationRecord

	validates_presence_of :username, :first_name, :last_name, :password, :email
	validates_length_of :username, :password, maximum: 24, message: "Username/Password cannot be longer than 24 characters"
	validates :email, :email_format => { :message => 'is not looking good' }

end
