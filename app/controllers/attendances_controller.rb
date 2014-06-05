class AttendancesController < ApplicationController
  before_action :set_event, except: [:destroy]
  before_action :set_attendance, only: [:show, :edit, :update, :destroy]
  before_action :breadcrumb, only: [:index]

  def breadcrumb
    add_breadcrumb "Events", events_path, :title => "Back to the Events List"
    add_breadcrumb @event.name, event_path(@event)
    add_breadcrumb "Attendees"
  end
  def index
    @attendees = @event.attendances.sort_by(&:name)
    @candidates = (Boy.all - @event.boys).sort_by(&:name)
  end


  # GET /attendances/new
  def add
    @boy = Boy.find(params[:id])
    @attendance = Attendance.new({:boy_id => @boy.id, :event_id => @event.id})
    
    respond_to do |format|
      if @attendance.save
        @boy.recalcuate_leaves
        format.html { redirect_to event_url(@event), notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /attendances/1/edit
  def edit
  end

  # POST /attendances
  # POST /attendances.json
  def create
    @attendance = Attendance.new(attendance_params)

    respond_to do |format|
      if @attendance.save
        format.html { redirect_to @attendance, notice: 'Attendance was successfully created.' }
        format.json { render :show, status: :created, location: @attendance }
      else
        format.html { render :new }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @attendance.update(attendance_params)
        format.html { redirect_to @attendance, notice: 'Attendance was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance }
      else
        format.html { render :edit }
        format.json { render json: @attendance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event = @attendance.event
    @boy = @attendance.boy
    @attendance.destroy
    @boy.recalcuate_leaves
    respond_to do |format|
      format.html { redirect_to event_url(@event), notice: 'Attendance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:boy_id, :event_id)
    end
end
