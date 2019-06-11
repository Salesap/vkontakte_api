# frozen_string_literal: true

require 'faraday_middleware/response_middleware'

module VkontakteApi
  module Extensions
    class OjSerializer < ::FaradayMiddleware::ResponseMiddleware
      dependency 'oj'

      define_parser do |body|
        unless body.strip.empty?
          Oj.load(
            body,
            mode: :json
          ).merge(
            raw_body: body
          )
        end
      end
    end
  end
end

Faraday::Response.register_middleware(oj: VkontakteApi::Extensions::OjSerializer)
