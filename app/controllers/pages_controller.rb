class PagesController < ApplicationController
  def dashboard_business
    @business = current_user.businesses.find_by_id(params[:id])

    if @business.nil?
      redirect_to("/")
    else
      @clients = @business.clients

      if Touch.where({"client_id" => @current_client}) != nil
        @touches = Touch.where({"client_id" => @current_client})
      else
        @touches = nil
      end
    end
  end

  def dashboard
    touch = 1
    user = current_user
    @business = Business.find_by_id(params[:id])
    @client = Client.where("business_id" => @business.id)
    client.each do |client|
    @touch = Touch.where("client_id" => client.id)
    end
    @incoming = @touch.where("outgoing" => false)
    @outgoing = @touch.where("outgoing" => true)
    ############################################################
    @list_clients = Client.where({"active" => true})
    @touches = Touch.all
    if client_from_params = Client.find_by_id(params[:client_id])
      @client = client_from_params
    else
      @client = nil
    end

    # The view being rendered is not dependent on the value of @client.
    # It's just the view located at views/pages/dashboard.html.erb.
    render "pages/dashboard"
  end

  def onboard
    @user = current_user
    render "pages/onboard"
  end
end