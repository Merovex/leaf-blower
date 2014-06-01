class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :breadcrumb, only: [:show, :edit, :new]

  def breadcrumb
    add_breadcrumb "Events", events_path, :title => "Back to the Events List"
  end
  def new
    @event = Event.new(:ends_at => 1.hour.from_now, :period => "Does not repeat")
    # render :json => {:form => render_to_string(:partial => 'form')}
  end
  
  def create

    if params[:event][:period] == "Does not repeat"
      event = Event.new(event_params)
    else
      #      @event_series = EventSeries.new(:frequency => params[:event][:frequency], :period => params[:event][:repeats], :starts_at => params[:event][:starts_at], :ends_at => params[:event][:ends_at], :all_day => params[:event][:all_day])
      # event = EventSeries.new(event_params)
      event = Event.new(event_params)
    end
    if event.save
      format.html { redirect_to @event, notice: 'Event was successfully created.' }
      format.json { render :show, status: :created, location: @event }
    else
      render :text => event.errors.full_messages.to_sentence, :status => 422
    end
  end
  
  def index
    @events = Event.all
    
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
      @event.ends_at = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.ends_at))
      @event.all_day = params[:all_day]
      @event.save
    end
    render :nothing => true
  end
  
  
  def resize
    @event = Event.find_by_id params[:id]
    if @event
      @event.ends_at = (params[:minute_delta].to_i).minutes.from_now((params[:day_delta].to_i).days.from_now(@event.ends_at))
      @event.save
    end    
    render :nothing => true
  end
  
  def edit
    @event = Event.find_by_id(params[:id])
    # render :json => { :form => render_to_string(:partial => 'edit_form') } 
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
        format.html { redirect_to @event, notice: 'event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end  
  
  def destroy
    @event = Event.find_by_id(params[:id])
    if params[:delete_all] == 'true'
      @event.event_series.destroy
    elsif params[:delete_all] == 'future'
      @events = @event.event_series.events.find(:all, :conditions => ["starts_at > '#{@event.starts_at.to_formatted_s(:db)}' "])
      @event.event_series.events.delete(@events)
    else
      @event.destroy
    end
    redirect_to :action => 'index' 
  end

  private
    def event_params
      params.require(:event).permit('name', 'description', 'starts_at', 'ends_at', 'all_day', 'period', 'frequency', 'commit_button', :service, :heritage, :hobbies, :hobbies, :life_skills, :outdoor_activities, :pioneer_skills, :sci_tech, :values, :location_id)    
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end
end
