# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/incoming_service
  def incoming_service
    ReservationMailer.incoming_service
  end

  # Preview this email at http://localhost:3000/rails/mailers/reservation_mailer/new_service
  def new_service
    ReservationMailer.new_service
  end

end
