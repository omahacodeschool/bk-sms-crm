class ClientsController < ApplicationController
  def client_name
    @client = Client.find_by_id(params[:id])
    render "name"
  end

  def client_number
    @client = Client.find_by_id(params[:id])
    render "number"
  end

  def client_notes
    @client = Client.find_by_id(params[:id])
    render "notes"
  end

end