class BoysController < ApplicationController
  before_action :set_boy, only: [:show, :edit, :update, :destroy]
  before_action :breadcrumb, only: [:show, :edit, :new]

  def breadcrumb
    add_breadcrumb "Woodland Boys", boys_path, :title => "Back to the Events List"
  end
  def index
    @foxes = Patrol.find(1).boys
    @hawks = Patrol.find(2).boys
    @lions = Patrol.find(3).boys

  end

  def show
    @events = @boy.events.sort_by &:starts_at
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
    p = boy_params
    rank = p[:rank] 
    p.delete(:rank)
    @boy = Woodland.new(p)
    # raise @boy.inspect

    respond_to do |format|
      if @boy.save
        @boy.current_rank.update(rank)
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

  # DELETE /boys/1
  # DELETE /boys/1.json
  def destroy
    @boy.destroy
    respond_to do |format|
      format.html { redirect_to boys_url, notice: 'Boy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def boy_params
      params.require(:boy).permit(:name, :current_rank_id, :patrol_id, rank: [:grace])
    end
end
