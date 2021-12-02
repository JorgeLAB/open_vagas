class ApplicationController < ActionController::Base
  def index
  end

  def new
  end

  def create
    @applicant = current_user.applicants.new(applicant_params)

    if @applicant.save
      flash[:success] = "Você acabou de aplicar para a vaga com success."
    else
      flash[:error] = "Houve um error ao aplicar para a vaga. Tente novamente."
    end

    redirect_to public_position_path(@applicant.position)
  end

  private

  def applicant_params
    params.require(:applicant).permit(:name, :phone, :email)
  end
end
