class DragcronWorker
  include Sidekiq::Worker
  sidekiq_options queue: 'high'
 
  def perform()
    require 'rest-client'
    require 'logger'
    response = RestClient.get("https://app.dragapp.com/pubsub/emailData/renintialize-gmail-push-cron")
   logger.info(response)

 end
end
