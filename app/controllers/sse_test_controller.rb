class SseTestController < ApplicationController
  include ActionController::Live
  skip_before_action :authenticate_shop!
 
  def stream
    response.headers['Content-Type'] = 'text/event-stream'
    10.times {
      response.stream.write "This is a test Message"
      sleep 1
    }
    response.stream.close
  end
end
