class HardWorker
  include Sidekiq::Worker

  def perform(name)
  	UserMailer.send_mail("ashu96@gmail.com").delivery.now
    # Do something
  end
end

