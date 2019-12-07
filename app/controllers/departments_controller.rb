class DepartmentsController < ApplicationController
    before_action :set_department, only: [:show, :update, :destroy]

    def index
        @departments = Department.all
        render json: {data: @departments}
    end
    
    def show
        render json:  {data: @department}
    end

    def create
        @department = Department.new(department_params)
        if @department.save
            render json: {data: @department}
        else
            render json: {data: "cannot save"}
        end
    end

    def update
        @department.update(department_params)
        render json:  {data: @department}
    end

    def destroy
        @department.destroy
        render json: {data: "deleted"}
    end

    private 

    def set_department
        @department = Department.find(params[:id])
    end
    def department_params
        params.permit(:department_name)
    end
end
