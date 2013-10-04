module Ukigumo
  class HTTPResponseFailed < StandardError; end

  class Client
    def initialize(server, port = 80, url = "http://#{server}:#{port}")
      @server = server
      @port = port
      @base_url = url
    end

    def search(elements, limit = 1)
      query_string = URI.encode_www_form({
        project:  elements[:project].to_s,
        branch:   elements[:branch].to_s,
        revision: elements[:revision].to_s,
        limit:    limit.to_s,
      })

      Net::HTTP.start(@server, @port) do |http|
        responce = http.get("/api/v1/report/search?#{query_string}")

        if !response.is_a?(Net::HTTPSuccess)
          raise HTTPResponseFailed, "could not get result from Ukigumo server"
        end

        responce.body
      end
    end

    def post(elements)
      response = Net::HTTP.post_form(
        URI.parse("#{@base_url}/api/v1/report/add"),
        {
          status:   elements[:status],
          project:  elements[:project],
          branch:   elements[:branch],
          repo:     elements[:repo],
          revision: elements[:revision],
          vc_log:   elements[:vc_log],
          body:     elements[:body],
        }
      )

      if !response.is_a?(Net::HTTPSuccess)
        raise HTTPResponseFailed, "could not post result to Ukigumo server"
      end

      response.body
    end
  end
end
