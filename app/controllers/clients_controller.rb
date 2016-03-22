class ClientsController < ApplicationController

  def current_client
    @client = Client.find_by_id(params[:id])
  end

  def client_name
    current_client
    render "name"
  end

  def client_number
    current_client
    render "number"
  end

  def client_notes
    current_client
    render "notes"
  end

  def change_status
    current_client
    @client.active = true
    @client.save
    redirect_to "dashboard"
  end

  def edit_client
    current_client
    render "edit"
  end

    def update_client
    current_client
    client.first_name = params[:first_name]
    client.last_name = params[:last_name]
    client.phone_number = params[:phone_number]
    client.notes = params[:notes]
    @client.save
    redirect_to "dashboard"
  end
end