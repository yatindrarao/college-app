class Api::V1::StudentsController < ApplicationController
  before_action :authenticate_user
  before_action :set_student, only: [:update, :show, :destroy]

  def create
    @student = Student.new(student_params)

    if @student.save
      render status: :created
    else
      render json: { type: "Failure", code: 422, message: "Failure", error: true },
        status: :unprocessable_entity
    end
  end

  def update
    if @student.update(student_params)
      render status: :ok
    else
      render json: { type: "Failure", code: 422, message: "Failure", error: true },
        status: :unprocessable_entity
    end

  end

  def index
    @students = Student.all
  end

  def show
    if @student.present?
      render
    else
      render json: { type: "Failure", code: 404, message: "Record not found", error: true },
        status: :not_found
    end
  end

  def destroy
    if @student.present? && @student.destroy
      render
    else
      render json: { type: "Failure", code: 404, message: "Record not found", error: true },
        status: :not_found
    end
  end

  private

  def student_params
    params.permit(:name, :age, :dob, :description, :semester_id)
  end

  def set_student
   @student = Student.find_by_id(params[:id])
  end
end