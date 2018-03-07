class CatRentalRequestRentalRequestsController < ApplicationController

  def index
    @requests = CatRentalRequest.all
    render :index
  end

  def show
    @request = CatRentalRequest.find(params[:id])
    render :show
  end

  def new
    @request = CatRentalRequest.new
    render :new
  end

  def create
    @request = CatRentalRequest.new(cat_rental_requests_params)

    if @request.save
      redirect_to cat_rental_request_url(@request)
    else
      render json: @request.errors.full_messages, status: 422
    end
  end

  def update
    @request = CatRentalRequest.find(params[:id])

    if @request.update(cat_rental_requests_params)
      redirect_to cat_rental_request_url(@request)
    else
      render json: @request.errors.full_messages, status: 422
    end
  end

  def edit
    @request = CatRentalRequest.find(params[:id])
    render :edit
  end

  def destroy
    @request = CatRentalRequest.find(params[:id])
    redirect_to cat_rental_requests_url
  end

  private

  def cat_rental_requests_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date, :status)
  end
end
