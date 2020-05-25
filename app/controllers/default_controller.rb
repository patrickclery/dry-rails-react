# frozen_string_literal: true

class DefaultController < ApplicationController
  before_action :authenticate_user!
  def index
    render component: 'App', layout: 'application', prerender: true
  end

end
