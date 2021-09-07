class HealthInterviews::GuideStatusesController < ActionController::Base
  before_action :set_health_interview, only: [:update]

  def update
    @guide_status = @health_interview.guide_status
    respond_to do |format|
      if @guide_status.update_attributes(guide_status_params)
        flash.now[:notice] = 'ok!'
        format.json { render json: @guide_status }
      # else
      #   format.json { render json: { status: 'error' } }
      end
    end
  end

  private

  def set_health_interview
    @health_interview = HealthInterview.find(params[:health_interview_id])
  end

  def guide_status_params
    params.require(:guide_status).permit(:status)
  end
end