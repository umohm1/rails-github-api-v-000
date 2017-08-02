class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  private

    # def authenticate_user
    #     client_id = ENV['GITHUB_CLIENT_ID']
    #     redirect_uri = CGI.escape("https://localhost:3000/auth")
    #     github_url = "http://github.com/login/oauth/authorize?=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
    #     redirect_to github_url unless logged_in?   #should prob include state/scope
    # end

    def authenticate_user
      redirect_to "https://github.com/login/oauth/authorize?client_id=#{ENV['GITHUB_CLIENT_ID']}&scope=repo" if !logged_in?
    end

    def logged_in?
        !!session[:token]
    end
end
