class ErrorsController < ApplicationController
  def file_not_found
  	@message = "file not found"
  	respond_to do |format|
	  format.html
	  format.xml  { render :xml => @message }
	  format.json { render :json => @message }
	end
  end

  def unprocessable
  	@message = "unprocessable"
  	respond_to do |format|
	  format.html
	  format.xml  { render :xml => @message }
	  format.json { render :json => @message }
	end
  end

  def internal_server_error
  	@message = "internal server error"
  	respond_to do |format|
	  format.html
	  format.xml  { render :xml => @message }
	  format.json { render :json => @message }
	end
  end
end
