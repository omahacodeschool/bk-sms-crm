class ClientsController < ApplicationController

  def current_client
    @client = Client.find_by_id(params[:id])
  end

  # def client_name
  #   current_client
  #   render "name"
  # end

  # def client_number
  #   current_client
  #   render "number"
  # end

  # def client_notes
  #   current_client
  #   render "notes"
  # end

  def change_status
    current_client
    if @client.active == true
      @client.active = false
    else
      @client.active = true
    end
    @client.save
    redirect_to "/clients/info"
  end

  def new
    @business = Business.find_by_id(params[:business_id])
    render "new"
  end

  def add
    client = Client.new
    client.first_name = params[:first_name]
    client.last_name = params[:last_name]
    client.phone_number = params[:phone_number]
    client.notes = params[:notes]
    client.active = true
    client.save
    redirect_to "/clients/info"
  end

  def edit_client
    current_client
    render "edit"
  end

  def update_client
    current_client
    @client.first_name = params[:first_name]
    @client.last_name = params[:last_name]
    @client.phone_number = params[:phone_number]
    @client.notes = params[:notes]
    @client.save
    redirect_to "/clients/info"
  end

  def delete
    current_client
    Client.destroy(@client)
    redirect_to "/clients/info"
  end

  def view
    @business = Business.find_by_id(params[:business_id])
    if client_from_params = Client.find_by_id(params[:client_id])
      @client = client_from_params
    else
      @client = nil
    end
    # current_client
    # @client = Client.find_by_id(params[:client_id])
    redirect_to "/clients/info/#{@business.id}"
    # redirect_to "/dashboard/#{@client.id}"
  end

   def info
    @business = Business.find_by_id(params[:business_id])
    @list_clients = Client.find_business_clients(params[:id])
     # @list_clients = Client.where({"active" => true},)
    if client_from_params = Client.find_by_id(params[:client_id])
      @client = client_from_params
    else
      @client = nil
    end
    # current_client
    # @client = Client.find_by_id(params[:client_id])
    render "view"
    # redirect_to "/dashboard/#{@client.id}"
  end

end