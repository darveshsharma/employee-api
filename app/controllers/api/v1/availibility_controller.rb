class Api::V1::AvailibilityController < ApplicationController
  def index 
    @avalibilitys = Availibility.all
    render json: {
        data: @availibilitys,
        message: ['avalibility list fetched successfully'],
        status: 200,
        type: 'Success'
      }
  end

  def show 
    @avalibilitys = Availibility.find(params[:id])
    render json:  {
      data: @availibilitys,
      message: ['avalibility fetched successfully'],
      status: 200,
      type: 'Success'
      }
  end

  def create
    @availibilities=[]
    avalibility_params[:availibilities].each do |i|
      @availibilities << Availibility.create(i)
      # avalibility = AvalibilityCreator.new(avalibility_params).call
    end
    if @avalibilities != []
      render json:  {
      data: @availibilities.map {|one| [one,]},
      message: ['avalibility created successfully'],
      status: 200,
      type: 'Success'
      }
    else
      render error: {error: 'Unable to create avalibility.'}, status: 400
    end
  end
  
  def update 
    @avalibility = Availibility.find(params[:id])
    if @avalibility
      @avalibility.update(avalibility_params)
      render json: {message: 'avalibility updated succesfully'},status: 200
    else
      render error: {error: 'Unable to update.'}, status: 400
    end
  end

  def destroy 
    @avalibility.find(params[:id])
    if @avalibility
      @avalibility.destroy
      render json: {message: 'avalibility is deleted succesfully'},status: 200
    else
      render error: {error: 'Unable to delete.'}, status: 400
    end
  end


  def avalibility_params
    params.permit(availibilities:
      [:employee_id, :day, :active, :not_active,
      slots_attributes: [:id, :from, :to]]
      )
  end
end
