class Api::HomeController < ApplicationController
  def index
    render json: {}, status: :ok
  end
end
