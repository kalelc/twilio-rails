class Sms < ActiveRecord::Base
	validates :message, presence: true
end
