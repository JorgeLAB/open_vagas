class ApplicantsController < ApplicationController
  def index; end

  def new; end

  def create
    @applicant = current_user.applicants.new(applicant_params)
    @position = Position.find(applicant_params[:position_id])

    respond_to do |format|
      if @applicant.save
        flash[:success] = 'Você acabou de aplicar com sucesso.'
        format.html { redirect_to public_position_path(@applicant.position.slug) }
        format.js { render 'applicants/success' }
      else
        flash[:error] = 'Deu Ruim.'
        format.html { render 'positions/public_position' }
        format.js { render partial: 'applicants/new' }
      end
    end
  end

  private

  def applicant_params
    params.require(:applicant).permit(:email, :phone, :position_id)
  end
end
