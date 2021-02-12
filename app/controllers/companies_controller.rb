class CompaniesController < ApplicationController
  def new
    @company = current_user.build_company
  end

  def edit
    @company = current_user.company
  end

  def create
    @company = current_user.build_company(company_params)

    if @company.save
      flash[:notice] = "Foi realizada a criação."
      redirect_to root_path
    else
      flash[:error] = "Não foi possível salvar."
      render :new
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :url, :logo)
  end
end
