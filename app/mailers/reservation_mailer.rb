class ReservationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.incoming_service.subject
  #
  def incoming_service(reservation)
    @reservation = reservation

    mail to: "krusmac@gmail.com"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.reservation_mailer.new_service.subject
  #
  def new_service(reservation)
    @reservation = reservation

    mail(to: 'krusmac@gmail.com', subject: 'Nowa rezerwacja na dzień ' + reservation.date.strftime('%d.%m.%Y %H:%M'))
  end
end
