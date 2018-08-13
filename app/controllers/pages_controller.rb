class PagesController < ApplicationController

  skip_before_action :authorize_request, only: :main
  def main
    render template: "pages/main"
  end


end
