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

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(permitted_params)

    if @user.save
      redirect_to root_path, flash: "New user added succesfully"
    else
      render :new
    end
  end

  def expert_search
    @user = User.find_by_id(params[:id])
    @related_headings = @user.find_related_headings_by_topic(params[:topic])

    render partial: 'result_list', locals: { user: @user, headings: @related_headings }, content_type: 'text/html'
  end

  private

  def permitted_params
    params.require(:user).permit(:name, :website_url)
  end
end
