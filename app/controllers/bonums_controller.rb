class BonumsController < ApplicationController
  before_action :set_boy
  before_action :set_bonum, only: [:show, :edit, :update, :destroy]
  before_action :breadcrumb

  def breadcrumb
    add_breadcrumb @boy.name, boy_path(@boy)
    add_breadcrumb "Bonuses", boy_bonums_path(@boy), :title => "Back to the Bonus"  
    add_breadcrumb @bonum.name if @bonum
  end

  def index
    @bonums = Bonum.all
  end
  def show
  end
  def new
    @bonum = Bonum.new
  end
  def edit
  end
  def create
    @bonum = @boy.current_rank.bonums.new(bonum_params)
    @bonum.reporter = current_user

    respond_to do |format|
      if @bonum.save
        @boy.create_activity :new_bonum, owner: current_user
        @boy.recalcuate_leaves
        @boy.current_rank.check_accruals
        format.html { redirect_to boy_path(@boy), notice: 'Bonum was successfully created.' }
        format.json { render :show, status: :created, location: @bonum }
      else
        format.html { render :new }
        format.json { render json: @bonum.errors, status: :unprocessable_entity }
      end
    end
  end
  def update
    respond_to do |format|
      if @bonum.update(bonum_params)
        @boy.create_activity :update_bonum, owner: current_user
        @boy.recalcuate_leaves
        @boy.current_rank.check_accruals
        format.html { redirect_to boy_path(@boy), notice: 'Bonum was successfully updated.' }
        format.json { render :show, status: :ok, location: @bonum }
      else
        format.html { render :edit }
        format.json { render json: @bonum.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @bonum.destroy
    respond_to do |format|
      format.html { redirect_to bonums_url, notice: 'Bonum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bonum
      # raise [params, @boy].inspect
      @bonum = @boy.current_rank.bonums.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bonum_params
      params.require(:bonum).permit(:boy_id, :rank_id, :name, :reported_by, :summary, :service, :heritage, :hobbies, :life_skills, :outdoor_activities, :pioneer_skills, :sci_tech, :values, :nights)
    end
end
