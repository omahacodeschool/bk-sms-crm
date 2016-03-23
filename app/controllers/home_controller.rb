class HomeController < ApplicationController
  def index
    x = "Foo"

    if "A" === "B"
      return "Bar"
    end

    return nil
  end
end