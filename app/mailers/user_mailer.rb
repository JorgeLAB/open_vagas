require_relative '../services/export_resume'
class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user

    mail to: @user.email, subject: 'Bem-vindo ao Open Vagas'
  end

  def export_resume(user, position)
    @user = user
    zip_name = "#{SecureRandom.alphanumeric(10)}-curriculos.zip"

    binding.pry

    ExportResume.new(user, position, zip_name).generate
    attachments[zip_name] = File.read(Rails.root.join('tmp', zip_name).to_s)

    mail to: @user.email, subject: 'Todos os curriculos foram exportados'
  end
end
