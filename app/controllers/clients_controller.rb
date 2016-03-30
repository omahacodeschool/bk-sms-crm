class ClientsController < ApplicationController

  def current_client
    @client = Client.find_by_id(params[:id])
  end

  def current_business
    @business = Business.find_by_id(params[:business_id])
  end 

  def change_status
    current_client
    @business = current_client.business
    if @client.active == true
      @client.active = false
    else
      @client.active = true
    end
    @client.save

    if @client.active?
      render text: "Active", layout: nil
    else
      render text: "Inactive", layout: nil
    end
  end

  def new
    current_business
    render "new"
  end

  def add
    current_business
    client = Client.new
    client.first_name = params[:first_name]
    client.last_name = params[:last_name]
    client.phone_number = params[:phone_number]
    client.notes = params[:notes]
    client.business_id = params[:business_id]
    client.active = true
    client.save
    redirect_to "/clients/view/#{@business.id}"
  end

  def edit_client
    current_client
    current_business
    render "edit"
  end

  def update_client
    current_client
    current_business
    @client.first_name = params[:first_name]
    @client.last_name = params[:last_name]
    @client.phone_number = params[:phone_number]
    @client.notes = params[:notes]
    @client.save
    redirect_to "/dashboard/business/#{@business.id}"
  end

  def delete
    current_business
    current_client
    Client.destroy(@client)
    redirect_to "/clients/view/#{@business.id}"
  end

  def info
    current_business
    # below is code for active users only checkbox
    # if params[:active_only] == nil
    #   @active_only = 2
    # else
    #   @active_only = params[:active_only]
    # end
    if client_from_params = Client.find_by_id(params[:client_id])
      @client = client_from_params
    else
      @client = nil
    end
    redirect_to "/clients/view/#{@business.id}/#{@client.id}"
  end

   def view
    @business = current_client.business
    # below is code for active users only checkbox
    # @active_only = params[:active_only]
    # if @active_only == 1
    #   @list_clients = current_business.clients.where({"active" => true})
    # else
    #   @list_clients = current_business.clients
    # end
    if client_from_params = Client.find_by_id(params[:id])
    @client = client_from_params
    else
      @client = nil
    end
    render "view"
  end

   def profile
    current_business = current_client.business
    # below is code for active users only checkbox
    # @active_only = params[:active_only]
    # if @active_only == 1
    #   @list_clients = current_business.clients.where({"active" => true})
    # else
    #   @list_clients = current_business.clients
    # end
    if client_from_params = Client.find_by_id(params[:id])
    @client = client_from_params
    else
      @client = nil
    end
    render "profile", layout: nil
  end

end