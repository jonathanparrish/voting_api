class Api::V1::VotersController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    @voter = Voter.new(voter_params)

    if @voter.save
      render json: @voter
    else
      render json: "Invalid parameters"
    end
  end

  def show
    @voter = Voter.find(params[:id])
    render json: @voter
  end

  def update

  end

# Never trust parameters from the scary internet, only allow the white list through.
  private def voter_params
    params.require(:voter).permit(:name, :party)
  end
end
