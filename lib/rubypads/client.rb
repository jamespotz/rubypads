module Rubypads

  class Client

    SANDBOX_DOMAIN = "https://feedtest.hotpads.com"
    BASE_DOMAIN    = "https://hotpads.com"

    def initialize(api_key, write_key)
      @domain = Rubypads.sandbox_mode ? SANDBOX_DOMAIN : BASE_DOMAIN
      @api_key   = api_key
      @write_key = write_key
    end

    def mark_for_update(feed_id, listings = [])
      url = "#{@domain}/api/v1/listing/markForUpdate" \
            "?apikey=#{@api_key}&writekey=#{@write_key}" \
            "&feedId=#{feed_id}&feedListingIds=#{comma_separated(listings)}"

      response = httparty_get(url)
      fetch_response(response.parsed_response['result'])
    end

    def verify_listing(feed_id, id)
      url = "#{@domain}/listing/#{feed_id}/#{id}"
      response = httparty_get(url)
      response.parsed_response
    end

    private

    def fetch_response(response)
      entries = Hash.new()
      response.each do |key, value|
        entries[key.to_sym] = value
      end
      entries
    end

    def comma_separated(list)
      return list unless list.is_a?(Array)
      list.join(',')
    end

    def httparty_get(url)
      HTTParty.get url
    end

  end

end
