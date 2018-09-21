class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:main, :map, :about, :how_to]
  def main
    render template: "pages/main"
  end

  def about
    render template: "pages/about"
  end

  def how_to
    render template: "pages/how_to"
  end

  def map
    render template: "pages/map"
  end


end
