class PositionsController < ApplicationController
  before_action :set_company, :set_i18n_careers, :set_i18n_contracts, except: [:public_position]
  before_action :set_position, only: [ :update, :show, :edit ]

  def index
    @positions = @company.positions
  end

  def new
    @position = @company.positions.new
  end

  def edit; end

  def show; end

  def update
    @position.update(params_position)

    if @position.save
      redirect_to positions_path, notice: "Atualizado com sucesso"
    else
      render :edit
    end
  end

  def create
    @position = @company.positions.new(params_position)

    if @position.save
      redirect_to positions_path
    else
      render :new
    end
  end

  def public_position
    @position = Position.find_by(slug: params[:slug])
  end

  private

  def set_position
    @position = @company.positions.find(params[:id])
  end

  def set_company
    redirect_to new_company_path if current_user.company.nil?
    @company = current_user.company
  end

  def set_i18n_careers
    @careers = I18n.t("activerecord.attributes.position.careers")
    # @careers = []
    # Position.careers.each_with_index do |careers, index|
    #   @careers << [
    #     Postion.careers.to_a[index].first,
    #     I18n.t("activerecord.attributes.position.careers").values.to_a[index]
    #   ]
    # end
  end

  def set_i18n_contracts
    @contracts =t("activerecord.attributes.position.contracts")
    # @contracts = []
    # Position.contracts.each_with_index do |contracts, index|
    #   @contracts << [
    #     Postion.contracts.to_a[index].first,
    #     I18n.t("activerecord.attributes.position.contracts").values.to_a[index]
    #   ]
    # end
  end

  def params_position
    params.require(:position).permit(:name, :career, :contract, :remote, :city,
                                     :state, :summary, :description, :publish, presence: true)
  end
end
