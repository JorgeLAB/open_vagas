class ApplicantsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @applicant = current_user.applicants.new(applicant_params)

    if @applicant.save
      flash[:success] = 'Você acabou de aplicar com sucesso.'
    else
      flash[:error] = 'Deu Ruim.'
    end

    redirect_to public_position_path(@applicant.position.slug)
  end

  private

  def applicant_params
    params.require(:applicant).permit(:email, :phone, :position_id)
  end
end
