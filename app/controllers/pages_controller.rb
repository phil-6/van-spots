class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :main
  def main
    render template: "pages/main"
  end

  def map
    render template: "pages/map"
  end


end
