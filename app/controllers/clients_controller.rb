class ClientsController < ApplicationController

  def current_client
    @client = Client.find_by_id(params[:id])
  end

  def current_business
    @business = Business.find_by_id(params[:business_id])
  end

  def change_status
    current_client
    current_business
    if @client.active == true
      @client.active = false
    else
      @client.active = true
    end
    @client.save
    redirect_to "/clients/view/#{current_business.id}/#{@client.id}"
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
    redirect_to "/clients/view/#{current_business.id}"
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
    redirect_to "/clients/view/#{current_business.id}"
  end

  def delete
    current_business
    current_client
    Client.destroy(@client)
    redirect_to "/clients/view/#{current_business.id}"
  end

  def info
    current_business
    if client_from_params = Client.find_by_id(params[:client_id])
      @client = client_from_params
    else
      @client = nil
    end
    # current_client
    # @client = Client.find_by_id(params[:client_id])
    redirect_to "/clients/view/#{current_business.id}/#{@client.id}"
  end

   def view
    current_business
     # @list_clients = Client.where({"active" => true},)
    #if client_from_params = Client.find_by_id(params[:client_id])
    #@client = client_from_params
    if current_client != nil
      current_client
    else
      @client = nil
    end
    render "view"
  end

end