class TouchController < ApplicationController
  def list
    @touches = Touch.all
    render "touches"
  end
end