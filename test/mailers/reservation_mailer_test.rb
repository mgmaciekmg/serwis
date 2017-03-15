require 'test_helper'

class ReservationMailerTest < ActionMailer::TestCase
  test "incoming_service" do
    mail = ReservationMailer.incoming_service
    assert_equal "Incoming service", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "new_service" do
    mail = ReservationMailer.new_service
    assert_equal "New service", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
