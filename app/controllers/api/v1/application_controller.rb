# frozen_string_literal: true
module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :authenticate_user!
    end
  end
end
