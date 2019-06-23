class Api::V1::StudentsController < ApplicationController
  before_action :authenticate_user

  def index
    @students = Student.all

    render json: { students: @students }
  end

end