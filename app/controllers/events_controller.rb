class EventsController < ApplicationController
  before_action :set_wide_view
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :breadcrumb, only: [:show, :edit, :new]
  load_and_authorize_resource 

  def breadcrumb
    add_breadcrumb "Events", events_path, :title => "Back to the Events List"  
    add_breadcrumb @event.name if @event
  end
  def from_template
    raise params.permit('name', 'description', 'starts_at', 'ends_at', 'all_day', 'period', 'frequency', 'commit_button', :service, :heritage, :hobbies, :hobbies, :life_skills, :outdoor_activities, :pioneer_skills, :sci_tech, :values, :location_id)
  end
  def new
    if params[:tid]
      template = Template.find(params[:tid])
      name = [template.rank, Date.today.year, template.name].join(" - ")
      p = {
        :name => name,
        :location_id => 1,
        :life_skills => template.life_skills.to_i || 0,
        :heritage => template.heritage.to_i || 0,
        :hobbies => template.hobbies.to_i || 0,
        :pioneer_skills => template.pioneer_skills.to_i || 0,
        :life_skills => template.life_skills.to_i || 0,
        :values => template.values.to_i || 0,
        :outdoor_activities => template.outdoor_activities.to_i || 0,
        :period => "Does not repeat",
        :description => "Cloned from Template: #{name}",
        :starts_at => (DateTime.now.change(hour: 18)).strftime('%Y-%m-%d %H:%M')
       }
       respond_to do |format|
         @event = Event.create(p)
         format.html { redirect_to edit_event_path(@event), notice: 'event was successfully updated.' }
       end
     end
    @event = Event.new
  end
  
  def take_attendance
    @title = "Taking Attendance"
    @events = Event.where(starts_at: 7.days.ago..(Time.now.midnight + 4.hours)).sort_by(&:starts_at).reverse
    render :index
  end
  def create
    event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        @event.create_activity :create, owner: current_user

      # raise "GOOD:" + @event.inspect
        format.html { redirect_to event_url @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        
      # raise "Bad:" + @event.inspect
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
        # render :text => event.errors.full_messages.to_sentence, :status => 422
      end
    end
  end
  
  def index
    @title = "Events"
    @events = Event.order(:starts_at).reverse_order.page params[:page]
  end
  def get_events
    @events = Event.find(:all, :conditions => ["starts_at >= '#{Time.at(params['start'].to_i).to_formatted_s(:db)}' and ends_at <= '#{Time.at(params['end'].to_i).to_formatted_s(:db)}'"] )
    events = [] 
    @events.each do |event|
      events << {:id => event.id, :title => event.title, :description => event.description || "Some cool description here...", :start => "#{event.starts_at.iso8601}", :end => "#{event.ends_at.iso8601}", :allDay => event.all_day, :recurring => (event.event_series_id)? true: false}
    end
    render :text => events.to_json
  end
  
  def move
    @event = Event.find_by_id params[:id]
    if @event
      @event.starts_at = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.starts_at))
      # @event.ends_at = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.ends_at))
      @event.all_day = params[:all_day]
      @event.save
    end
    render :nothing => true
  end
  
  
  def resize
    @event = Event.find_by_id params[:id]
    if @event
      # @event.ends_at = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.ends_at))
      @event.save
    end    
    render :nothing => true
  end
  
  def edit
    @event = Event.find_by_id(params[:id])
    # render :json => { :form => render_to_string(:partial => 'edit_form') } 
  end
  def show
    
    @attendees = @event.attendances.sort_by { |a| a.boy.lastnamefirst }.map {|a| a if a.boy.active?}.compact

    find_candidates
  end
  def update
    # raise params.inspect
    # @event = Event.find_by_id(params[:event][:id])
    # if params[:event][:commit_button] == "Update All Occurrence"
    #   @events = @event.event_series.events #.find(:all, :conditions => ["starts_at > '#{@event.starts_at.to_formatted_s(:db)}' "])
    #   @event.update_events(@events, event_params)
    # elsif params[:event][:commit_button] == "Update All Following Occurrence"
    #   @events = @event.event_series.events.find(:all, :conditions => ["starts_at > '#{@event.starts_at.to_formatted_s(:db)}' "])
    #   @event.update_events(@events, event_params)
    # else
    #   @event.update_events(@events, event_params)
    # end
    # render :show    
    respond_to do |format|
      if @event.update(event_params)
        @event.attendances.each do |a|
          a.boy.recalcuate_leaves
        end
        @event.create_activity :update, owner: current_user
        format.html { redirect_to @event, notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end
  def template
    @template = Template.find(params[:template_id])
    # raise @template.inspect
  end
  
  def destroy
    @event = Event.find_by_id(params[:id])
    

    if params[:delete_all] == 'true'
      @event.event_series.destroy
    elsif params[:delete_all] == 'future'
      @events = @event.event_series.events.find(:all, :conditions => ["starts_at > '#{@event.starts_at.to_formatted_s(:db)}' "])
      @event.event_series.events.delete(@events)
    else
      @event.attendances.delete_all
      @event.destroy
    end
    Boy.all.each do |boy|
      boy.recalcuate_leaves
    end
    
    @event.create_activity :destroy, owner: current_user
    redirect_to :action => 'index' 
  end

  private
    def event_params
      # params.require(:event).permit('name' ,'location_id' ,'heritage' ,'hobbies' ,'life_skills' ,'outdoor_activities' ,'pioneer_skills' ,'sci_tech' ,'values' ,'service' ,'starts_at' ,'description')
      params.require(:event).permit('name', 'description', 'starts_at', 'all_day', 'period', 'frequency', 'commit_button', :service, :heritage, :hobbies, :hobbies, :life_skills, :outdoor_activities, :pioneer_skills, :sci_tech, :values, :location_id)    
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
end
