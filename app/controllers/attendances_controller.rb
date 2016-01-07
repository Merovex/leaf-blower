class AttendancesController < ApplicationController
  before_action :set_event

  def breadcrumb
    add_breadcrumb "Events", events_path, :title => "Back to the Events List"
    add_breadcrumb @event.name, event_path(@event)
    add_breadcrumb "Attendees"
  end
  def index
    @attendees = @event.attendances.sort_by(&:name)
    update_candidates
  end
  def del
    @attendance = Attendance.find(params[:id])
    @boy = @attendance.boy
    @attendance.destroy
    update_candidates

  end
  def add
    @boy = Boy.find(params[:id])
    @attendance = Attendance.new({:boy_id => @boy.id, :event_id => @event.id})
    @attendance.save
    update_candidates    
  end

  private
    def update_candidates
      @boy.recalcuate_leaves
      
      find_candidates
      respond_to do |format|
        format.js { render :update_roster }
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:event_id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_params
      params.require(:attendance).permit(:boy_id, :event_id)
    end
end
