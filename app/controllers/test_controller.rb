# frozen_string_literal: true

class TestController < ApplicationController
  # before_action :check_test_env

  def index
    render component: 'TestApp',
           props:     {apiUrl: 'http://billy.local'},
           layout:    'application',
           prerender: false
  end

  private

  def check_test_env
    render status: :forbidden unless Rails.env.test?
  end
end
