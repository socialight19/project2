#require pry
class AnswersController < ApplicationController

 def index
    @answers = Answer.all
  end


  def show
    @answer = Answer.find(params[:id])
  end

    def answerinsidequestion
      @question = Question.find(params[:id])
      @answer = @question.answers.new(params.require(:answer).permit(:answer_given, :user_id, :answered_by))
      @question.save
      redirect_to question_path(@question)
    end

def create
	#binding.pry
    @user = User.find(params[:id])
    @answer = @user.questions.answer.new(params.require(:answer).permit(:answer_given, :user_id, :answered_by))
    
    #@question = Question.find(params[:id])
    #@answer = @question.answers.new(params.require(:answer).permit(:answer_given, :user_id))
    
		@question.save
		redirect_to user_path(@user)
end

def destroy
    @answer = Answer.find(params[:id])
    @question = @answer.question_id
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@answer.user_id), notice: 'Answer deleted.' }
      format.json { head :no_content }
    end
 end

 private



def question_params
      params.require(:question).permit(:question_asked, :user_id, :answered_by)
    end


end