class StaticPagesController < ApplicationController
  def home
    render 'home'
  end

  def property
    @data = { property_id: params[:id] }.to_json
    render 'property'
  end

  def login
    render 'login'
  end

  def add_property
    render 'add_property'
  end

  def listings
    @data = { username: params[:username] }.to_json
    render 'listings'
  end

  def edit_property
    @data = { property_id: params[:id] }.to_json
    render 'edit_property'
  end
end

