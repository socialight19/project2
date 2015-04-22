require 'pry'
class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json


    def index 

      if params[:q]
        # @questions = Question.where(name: params[:q])
        @search = (params[:q])
        @questions = Question.where("question_asked ilike ?", "%#{@search}%")
        #@user = User.find(params[:question][:user_id])
        
      else
        @questions = Question.all
      end
    end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # def answerinsidequestion
  # @question = Question.find(params[:id])
  # #@answer = @question.answers.new(params.require(:answer).permit(:answer_given, :user_id))
  # @answer = Answer.new(params.require(:answer).permit(:answer_given, :user_id))
  # @answer.save
  # redirect_to question_path(@question)
  # end

  # POST /questions
  # POST /questions.json
  def create
    #binding.pry
    @user = User.find(params[:id])
    
    @question = @user.questions.new(params.require(:question).permit(:question_asked, answer_attributes: [:answer_given]))

    respond_to do |format|
      if @question.save
        format.html { redirect_to user_path(@user), notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to user_path(@question.user_id), notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json

#   def destroy
    
#     @question.destroy
#     respond_to do |format|
#       format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

   #Reviewer.find_or_create_by(email: params[:review][:reviewer_attributes][:email]
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@question.user_id), notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question_asked, :user_id)
    end
end
