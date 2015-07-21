class AchievementsController < ApplicationController
  load_and_authorize_resource
  before_action :set_achievement
  def fine
    @achievement.completed_on = Date.today
    @achievement.save
    redirect_to (request.referrer || root_path)
  end
  def undo
    @achievement.completed_on = nil
    @achievement.save
    redirect_to (request.referrer || root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement
      @achievement = Achievement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achievement_params
      params.require(:achievement).permit(:requirement_id, :done)
    end
end
