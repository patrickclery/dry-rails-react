# frozen_string_literal: true

class DefaultController < ApplicationController
  def index
    render component: 'App', layout: 'application', prerender: true
  end

end
