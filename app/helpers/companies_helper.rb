module CompaniesHelper
  def redirecionar_para_edit
    unless current_user.company&.id.nil?
      edit_company_path(current_user.company)
    else
      new_company_path
    end
  end
end
