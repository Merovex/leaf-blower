class BoysController < ApplicationController
  before_action :set_boy, only: [:show, :edit, :update, :destroy, :promote]
  before_action :breadcrumb, only: [:show, :edit, :new]
  load_and_authorize_resource

  def breadcrumb
    add_breadcrumb "Woodland Boys", boys_path, :title => "Back to the Events List"
  end
  def index
    @foxes = get_active_boys(1)
    @hawks = get_active_boys(2)
    @lions = get_active_boys(3)
  end
  def foxes
    @foxes = get_active_boys(1)
  end
  def hawks
    @hawks = get_active_boys(2)
  end
  def lions
    @lions = get_active_boys(3)
  end
  def advance
    @boys = Boy.all.map{|b| b if (b.active and b.grade < 6)}.compact.sort_by &:lastnamefirst
  end
  def promote
    @boy.promote
    @boys = Boy.all.map{|b| b if (b.active and b.grade < 6)}.compact.sort_by &:lastnamefirst
    respond_to do |format|
      format.js { render :update_promotees }
    end
  end

  def show
    @events = @boy.current_events.sort_by &:starts_at
    @badges = Badge.all
    @boy.check_badges
    render {:show }
  end
  def new
    @boy = Woodland.new
    @rank = Rank.new
  end
  def edit
    @rank = @boy.current_rank
  end
  def create
    # raise "HERE".inspect
    p = boy_params
    rank = p[:rank] 
    p.delete(:rank)
    @boy = Woodland.new(p)

    respond_to do |format|
      if @boy.save
        @boy.set_current_rank
        # @boy.current_rank.update(rank)
        @boy.save
        format.html { redirect_to @boy.becomes(Boy), notice: 'Boy was successfully created.' }
        format.json { render :show, status: :created, location: @boy }
      else
        format.html { render :new }
        format.json { render json: @boy.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    # raise @boy.inspect
  
    respond_to do |format|
      p = boy_params
      rank = p[:rank] 
      p.delete(:rank)
      # raise [p, rank].inspect
      if @boy.update(p)
        @boy.current_rank.update(rank)
        format.html { redirect_to @boy.becomes(Boy), notice: 'Boy was successfully updated.' }
        format.json { render :show, status: :ok, location: @boy }
      else
        format.html { render :edit }
        format.json { render json: @boy.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @boy.destroy
    respond_to do |format|
      format.html { redirect_to boys_url, notice: 'Boy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def update_promotees
    puts "Updating Promotees"
    puts @boys.inspect
    respond_to do |format|
      format.js { render :update_promotees }
    end
  end
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def boy_params
      params.require(:boy).permit(:name, :current_rank_id, :patrol_id, :active, :rank, [:grace])
    end
    def get_active_boys(r)
      Patrol.find(r).boys.map{|b| b if b.active}.compact.sort_by{|b| b.lastnamefirst}
    end
end
