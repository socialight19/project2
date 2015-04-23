class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    if params[:q]
      # @beans = Bean.where(name: params[:q])
      @search = (params[:q])
      @users = User.where("name ilike ?", "%#{@search}%")
    else
      @users = User.all 
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @question = Question.new
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id.to_s
      flash[:welcome] = "Thanks for signing up, #{@user.name}!"
      redirect_to users_path
    else
      render :new
    end

  end


  def answer
    @question = Question.find(params[:answer][:question_id])
    answer = Answer.new(params.require(:answer).permit(:answer_given, :user_id, :answered_by))
    @question.answers << answer
    @question.save
    redirect_to user_path
  end




  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
     def set_user
       @user = User.find(params[:id])
       @user_id = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :password,:password_confirmation, :image, :last_name, :job, :hobbies, :areas_of_expertise)
    end
end
