# frozen_string_literal: true

class DefaultController < ApplicationController
  # before_action :authenticate_user!, only: [:index]

  def index
    render component: 'App',
           props:     {
             apiUrl: test_with_billy? ? 'http://billy.local' : ''
           },
           layout:    'application',
           prerender: false
  end

  # Puffing-billy does not stub localhost, so instead use this domain
  # This must be stubbed from RSpec test
  def test_with_billy?
    false
  end

end
