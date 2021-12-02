module PositionsHelper
  def url_position(position)
    public_position_url(position.slug)
  end

  def career_name(career)
    I18n.t('activerecord.attributes.position.careers')[career.to_sym]
  end

  def contract_name(contract)
    I18n.t('activerecord.attributes.position.careers')[contract.to_sym]
  end

  def modality(position)
    position.remote ? 'Remoto' : 'Presencial'
  end
end
