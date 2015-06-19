class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(params.require(:question).permit(:title, :body, :resolved))
    if @question.save
      flash[:notice] = "Post was saved."
      redirect_to @question
    else
      flash[:error] = "There was an error saving the question. Please try again."
      render :new
    end
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params.require(:question).permit(:title, :body, :resolved))
      flash[:notice] = "Question was updated."
      redirect_to @question
    else
      flash[:error] = "There was an error updating the question. Please try again."
      render :edit
    end
  end

  def destroy
    @question = Question.find(params[:id])
    if @question.destroy
      redirect_to @question, notice: "Question was destroyed"
    else
      flash[:error] = "There was an error deleting the question. Please try again."
      render :show
    end
  end

  def complete
    @question = Question.find(params[:question_id])
    @question.resolved = true
    @question.save
    redirect_to @question, notice: "Question was answered"
  end




end
