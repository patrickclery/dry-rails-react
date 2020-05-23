# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "default#index"
  devise_for :users
end
