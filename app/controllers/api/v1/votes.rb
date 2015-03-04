class Api::V1::VotesController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote
    else
      render json: "Invalid parameters"
    end
  end

  def show
    @vote = Vote.find(params[:id])
    render json: @vote
  end

  # Never trust parameters from the scary internet, only allow the white list through.
    private def vote_params
      params.require(:voter).permit(:voter_id, :candidate_id)
    end
end
