class Api::V1::AvailibilityController < ApplicationController
  def index 
    availibilitys = Availibility.all
    render json: {
        data: ActiveModelSerializers::SerializableResource.new(availibilitys, each_serializer: AvailibilitySerializer),
        message: ['avalibility list fetched successfully'],
        status: 200,
        type: 'Success'
      }
  end

  def show 
    availibilitys = Availibility.where(employee_id: params[:id])
    render json:  {
      data: ActiveModelSerializers::SerializableResource.new(availibilitys, each_serializer: AvailibilitySerializer),
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
    @availibilitys = Availibility.where(employee_id: params[:id])
    avalibility_params[:availibilities].each do |availibility|
      @availibilitys.find(availibility[:id]).update(availibility)
    end
    if @availibilitys
      render json: {
        data: ActiveModelSerializers::SerializableResource.new(@availibilitys, each_serializer: AvailibilitySerializer),
        message: 'avalibility updated succesfully'},status: 200
    else
      render error: {error: 'Unable to update.'}, status: 400
    end
  end

  def destroy 
    @avalibility = Availibility.where(employee_id: params[:id])
    if @avalibility
      @avalibility.delete_all
      render json: {message: 'avalibility is deleted succesfully'},status: 200
    else
      render error: {error: 'Unable to delete.'}, status: 400
    end
  end


  def avalibility_params
    params.permit(availibilities:
      [:id, :employee_id, :day, :active, :not_active,
      slots_attributes: [:id, :from, :to]]
      )
  end
end
