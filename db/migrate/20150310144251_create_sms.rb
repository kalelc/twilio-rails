class CreateSms < ActiveRecord::Migration
  def change
    create_table :sms do |t|
      t.string :message
	  t.text :response_twilio
      t.timestamps
    end
  end
end
