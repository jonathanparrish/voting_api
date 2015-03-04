module Api
  module V1
    class CandidatesController < ApplicationController
      before_filter :restrict_access
  protect_from_forgery with: :null_session
  # http_basic_authentication_with name: "admin", password: "secret"
  respond_to :json

  def index
    render json: Candidate.all(candidate_params)
  end

  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate
  end

  private def candidate_params
    params.require(:candidate).permit(:name, :party)
  end

  # private def restrict_access
  #   api_key = ApiKey.find_by_access_token(params[:access_token])
  #   head :unauthorized unless api_key
  # end
  private def restrict_access
    authenticate_or_request_with_http_token do |token, options|
      ApiKey.exists?(access_token: token)

  end
end
end
end
