class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = Booking.all.page params[:page]
  end

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @schedules = Schedule.where(booking_id: @booking.id).present?
    cars = @booking.customer.no_of_cars
    appointments = @booking.pack.no_of_appointments * @booking.no_of_pack
    @appointments =  (appointments/cars).to_i
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_params)
    @booking.amount = @booking.pack.amount * @booking.no_of_pack
    balance = @booking.amount - @booking.amount_paid.to_i

    respond_to do |format|
      if @booking.save
        customer= Customer.find(@booking.customer)
        customer.update_attributes(amount_pending: (balance + customer.amount_pending.to_i))
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
  def update
    prev_balance = @booking.amount - @booking.amount_paid.to_i
    respond_to do |format|
      if @booking.update(booking_params)
        @booking.amount = @booking.pack.amount * @booking.no_of_pack
        balance = @booking.amount - @booking.amount_paid.to_i - prev_balance
        customer= Customer.find(@booking.customer)
        customer.update_attributes(amount_pending: (balance + customer.amount_pending))
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Booking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:customer_id, :pack_id, :no_of_pack, :amount, :amount_paid)
    end
end
