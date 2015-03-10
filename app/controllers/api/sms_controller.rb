class Api::SmsController < ApplicationController
	skip_before_filter  :verify_authenticity_token

	require 'rest_client'

	#POST /api/v1/sms
	def create

		message = params[:message]
		sms = Sms.new(message: message)
		if sms.valid?

			data = {
	          "Body" => message,
	          "From" => ENV['TWILIO_PHONE_NUMBER'],
	          "To" => ENV['TWILIO_PHONE_NUMBER']
	      	}

	      	headers = { 
	         :Accept => :json,
	         :Content_type => :json
	      	}
			resource = RestClient::Resource.new(ENV['TWILIO_URL'] + "/Accounts/" + ENV['TWILIO_SID'] + "/Messages.json", :user => ENV['TWILIO_SID'], :password => ENV['TWILIO_TOKEN'])
			response = resource.post(data, headers) do |response, request, result, &block|

				code = response.code

				case code
				when 200, 201
					sms.response_twilio = response
					sms.save
					render json: sms
				else
					head status: code
					return false
				end
			end
		else
			head status: :not_found
			return false
      	end
	end

	#GET  /api/v1/sms/:id
	def show
		id = params[:id]
		sms = Sms.find_by id: id

		if sms.nil?
			head status: :not_found
			return false
		else
			puts sms.to_json
			render json: sms.to_json
		end
	end
end
