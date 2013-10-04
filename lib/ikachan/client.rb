require "uri"
require "net/http"

module Ikachan
  class HTTPResponseFailed < StandardError; end

  class Client
    def initialize(server, port = 4979, url = "http://#{server}:#{port}")
      @server = server
      @port = port
      @base_url = url
    end

    def notice(channel, message)
      post("notice", { channel:channel, message:message })
    end

    def privmsg(channel, message)
      post("privmsg", { channel:channel, message:message })
    end

    def join(channel, channel_keyword = "nil") #channel_keyword is channel password
      post("join", { channel:channel, channel_keyword:channel_keyword })
    end

    def leave(channel)
      post("leave", { channel:channel })
    end

    private
    def post(type, post_value)
      response = Net::HTTP.post_form(URI.parse("#{@base_url}/#{type}"), post_value)

      if !response.is_a?(Net::HTTPSuccess)
        raise HTTPResponseFailed, "could not post to Ikachan server"
      end
      response.body
    end
  end
end
