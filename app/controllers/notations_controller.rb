class NotationsController < ApplicationController
  before_action :set_notation, only: [:show, :edit, :update, :destroy]
  after_action :set_exam_stats, only: [:create, :update, :destroy]

  # GET /notations
  # GET /notations.json
  def index
    @notations = Notation.all
  end

  # GET /notations/1
  # GET /notations/1.json
  def show
    @questions = @notation.questions
  end

  # GET /notations/new
  def new
    @notation = Notation.new
  end

  # GET /notations/1/edit
  def edit
  end

  # POST /notations
  # POST /notations.json
  def create
    @notation = Notation.new(notation_params)
    @notation.exam_id = params[:exam_id]
    @notation.user = current_user

    respond_to do |format|
      if @notation.save
        format.html { redirect_to @notation, notice: 'Notation was successfully created.' }
        format.json { render :show, status: :created, location: @notation }
      else
        format.html { render :new }
        format.json { render json: @notation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notations/1
  # PATCH/PUT /notations/1.json
  def update
    respond_to do |format|
      if @notation.update(notation_params)
        format.html { redirect_to @notation.exam, notice: 'Notation was successfully updated.' }
        format.json { render :show, status: :ok, location: @notation }
      else
        format.html { render :edit }
        format.json { render json: @notation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notations/1
  # DELETE /notations/1.json
  def destroy
    @exam = @notation.exam

    if @notation.questions.any?
      @notation.questions.each do |q|
        Question.destroy(q)
      end
    end

    @notation.destroy
    respond_to do |format|
      format.html { redirect_to @exam, notice: 'Notation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notation
      @notation = Notation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def notation_params
      params.require(:notation).permit(:student, :mark, :results, :appreciation)
    end

    # Used to recalculate average, min & max marks
    def set_exam_stats
      # Set exam for both destroy and other methods
      if @notation.present?
        exam = @notation.exam
      else
        exam = @exam
      end

      exam.average = exam.notations.average(:mark)
      exam.max =  exam.notations.maximum(:mark)
      exam.min =  exam.notations.minimum(:mark)

      if !exam.save
        respond_to do |format|
          format.html { render :edit }
          format.json { render json: @notation.errors, status: :unprocessable_entity }
          end
      end
    end
end
