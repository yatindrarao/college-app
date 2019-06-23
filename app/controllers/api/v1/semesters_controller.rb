class Api::V1::SemestersController < ApplicationController
  before_action :authenticate_user
  before_action :set_semester, only: [:update, :show, :destroy]

  def create
    @semester = Semester.new(semester_params)

    if @semester.save
      render status: :created
    else
      render json: { type: "Failure", code: 422, message: "Failure", error: true },
        status: :unprocessable_entity
    end
  end

  def update
    if @semester.update(semester_params)
      render status: :ok
    else
      render json: { type: "Failure", code: 422, message: "Failure", error: true },
        status: :unprocessable_entity
    end

  end

  def index
    @semesters = Semester.all
  end

  def show
    if @semester.present?
      render
    else
      render json: { type: "Failure", code: 404, message: "Record not found", error: true },
        status: :not_found
    end
  end

  def destroy
    if @semester.present? && @semester.destroy
      render
    else
      render json: { type: "Failure", code: 404, message: "Record not found", error: true },
        status: :not_found
    end
  end

  private

  def semester_params
    params.permit(:name, :credits, :start_date, :end_date)
  end

  def set_semester
   @semester = Semester.find_by_id(params[:id])
  end
end