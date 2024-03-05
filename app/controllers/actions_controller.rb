class ActionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
      @actions = Action.all
      render json: @actions
  end

  def show
      @action = Action.find(params[:id])
      render json: @action
  end

  def create
      @action = Action.new(action_params)
      if @action.save
          render json: @action
      else
          render json: {error: 'Error creating action'}
      end
  end

  def update
      @action = Action.find(params[:id])
      if @action.update(action_params)
          render json: @action
      else
          render json: {error: 'Error updating action'}
      end
  end

  def destroy
      @action = Action.find(params[:id])
      if @action.destroy
          render status: :ok
      else
          render json: {error: 'Error deleting action'}
      end
  end

  private
  def action_params
    params.require(:action).permit(:title, :body)
end
  
  
end

