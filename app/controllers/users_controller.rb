class UsersController < ActionController::Base
  layout 'application'

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by_id(params[:id])

    render :show
  end

  def expert_search
    @user = User.find_by_id(params[:id])
    @related_headings = @user.find_related_headings_by_topic(params[:topic])

    render partial: 'result_list', locals: { user: @user, headings: @related_headings }, content_type: 'text/html'
  end
end
