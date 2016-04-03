class ClientsController < ApplicationController

  def current_client
    @client = Client.find_by_id(params[:id])
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

  def toggle_status
    current_client
    @business = current_client.business
    if @client.active == true
      @client.active = false
    else
      @client.active = true
    end
    @client.save
    redirect_to "/clients/view/#{@business.id}/#{@client.id}"
  end

  def new
    @business = Business.find_by_id(params[:business_id])
    render "new", layout: nil
  end

  def add
    @business = Business.find_by_id(params[:business_id])
    client = Client.new
    client.first_name = params[:first_name]
    client.last_name = params[:last_name]
    client.phone_number = params[:phone_number]
    client.notes = params[:notes]
    client.business_id = params[:business_id]
    client.active = true
    client.save
    redirect_to "/dashboard/business/#{@business.id}"
  end

  def edit_client
    current_client
    @business = current_client.business
    render "edit", layout: nil
  end

  def update_client
    current_client
    @business = current_client.business
    @client.first_name = params[:first_name]
    @client.last_name = params[:last_name]
    @client.phone_number = params[:phone_number]
    @client.notes = params[:notes]
    @client.save
    redirect_to "/dashboard/business/#{@business.id}"
  end

  def notes
    current_client
    @business = current_client.business
    render "notes", layout: nil
  end

  def update_notes
    current_client
    @business = current_client.business
    @client.notes = params[:notes]
    @client.save
    redirect_to "/dashboard/business/#{@business.id}"
  end

  def delete
    current_client
    @business = current_client.business
    Client.destroy(@client)
    redirect_to "/clients/view/#{@business.id}"
  end

  def delete_dash
    current_client
    @business = current_client.business
    Client.destroy(@client)
    redirect_to "/dashboard/business/#{@business.id}"
  end

  def info
    @business = Business.find_by_id(params[:business_id])
    if client_from_params = Client.find_by_id(params[:client_id])
      @client = client_from_params
    else
      @client = nil
    end

    redirect_to "/clients/view/#{@business.id}/#{@client.id}"
  end

   def view
    current_client
    @business = Business.find_by_id(params[:business_id])
    if client_from_params = Client.find_by_id(params[:id])
      @client = client_from_params
    else
      @client = nil
    end

    render "view"
  end

   def profile
    current_client
    @business = current_client.business
    if client_from_params = Client.find_by_id(params[:id])
      @client = client_from_params
    else
      @client = nil
    end

    render "profile", layout: nil
  end

end