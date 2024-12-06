class HomeController < ApplicationController


    # Ação 'index' que renderiza a view 'index.html.erb'
  def index
    render "index"
  end

  # Ação 'home' que renderiza a view 'home.html.erb'
  def home
    render "home"
  end

  # Ação 'home' que renderiza a view 'logout.html.erb'
  def logout
    render "logout"
  end


end
