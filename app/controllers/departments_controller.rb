class DepartmentsController < ApplicationController
    def index
        @departments = Department.all
        render json: {data: @departments}
    end
    
    def show
        @department = Department.find(params[:id])
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
        @department = Department.find(params[:id])
        @department.update(department_params)
        render json:  {data: @department}
    end

    def destroy
        @department = Department.find(params[:id])
        @department.destroy
        render json: {data: "deleted"}
    end

    private 
    def department_params
        params.permit(:department_name)
    end
end
