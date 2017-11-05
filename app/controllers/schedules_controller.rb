class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    #@schedules = Schedule.ransack(params[:q])
    @schedules = Schedule.all.order("appointment desc").page params[:page]
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
    customer = Customer.find(params[:customer])
    @nearby_employees = Employee.near([customer.latitude, customer.longitude], 20, units: :km)
    @dates = params[:dates].present? ? (session[:dates] || []) : []
  end

  # GET /schedules/1/edit
  def edit
    customer = Customer.find(params[:customer])
    @nearby_employees = Employee.near([customer.latitude, customer.longitude], 20, units: :km)
  end

  # POST /schedules
  # POST /schedules.json
  def create
    begin
      @schedule = Schedule.new(schedule_params)

      respond_to do |format|
        if @schedule.save
          format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
          format.json { render :show, status: :created, location: @schedule }
        else
          format.html { render :new }
          format.json { render json: @schedule.errors, status: :unprocessable_entity }
        end
      end
    rescue NoMethodError
      Schedule.transaction do
        appointments = params[:schedule].count
        session[:dates] = []
        params[:schedule].each do |schedule|
          @schedule = Schedule.new(schedule.permit(:customer_id, :booking_id, :pack_id, :employee_id, :appointment))
          if @schedule.valid?
            session[:dates] << @schedule.appointment
            @schedule.save
          else
            customer = Customer.find(@schedule.customer_id)
            @nearby_employees = Employee.near([customer.latitude, customer.longitude], 20, units: :km)
            @errors = true
            respond_to do |format|
              format.html {redirect_to new_schedule_path(appointments: appointments, customer: @schedule.customer.id, pack: @schedule.pack.id, booking: @schedule.booking.id, dates: "true"), notice: "#{@schedule.employee.name} not available for #{@schedule.appointment.to_formatted_s(:long_ordinal)}"}
            end
            raise ActiveRecord::Rollback
            break
          end
        end
      end
      unless @errors
        respond_to do |format|
          format.html { redirect_to schedules_path, notice: 'Schedule was successfully created.' }
        end
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        customer = Customer.find(@schedule.customer_id)
        @nearby_employees = Employee.near([customer.latitude, customer.longitude], 20, units: :km)
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def schedule_params
    params.require(:schedule).permit(:customer_id, :booking_id, :pack_id, :employee_id, :appointment, :status)
  end
end
