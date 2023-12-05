Rails.configuration.stripe = {
  publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
  secret_key:      ENV['STRIPE_SECRET_KEY'],
  signing_secret:  ENV['STRIPE_WEBHOOK_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
StripeEvent.signing_secret = Rails.configuration.stripe[:signing_secret]

StripeEvent.configure do |events|
  events.subscribe "checkout.session.completed" do |event|
    session_id = event.data.object.id
    puts "[DEBUG] session_id: #{session_id}"
    booking = Booking.find_by(checkout_session_id: session_id)
    booking.update(state: 'paid')
  end
end
