class GetProducts
  # TODO: Move this to environment variable
  # Shouldn't be in source for real prod app
  API_KEY = 'abc123key'.freeze

  OMEGA_ENDPOINT = 'https://omegapricinginc.com/pricing/records.json'.freeze

  def send_request
    one_month_ago = Date.today.prev_month.to_s
    today = Date.today.to_s

    # NOTE: Using RestClient for easy get request
    # RestClient.get OMEGA_ENDPOINT, {:params => {:api_key => API_KEY, :start_date => one_month_ago, :end_date => today}}

    # NOTE: Stubbed out response with sample from question
    {
      productRecords: [
        {
          id: 123456,
          name: "Nice Chair",
          price: "$30.25",
          category: "home-furnishings",
          discontinued: false
        },
        {
          id: 234567,
          name: "Black & White TV",
          price: "$43.77",
          category: "electronics",
          discontinued: true
        }
      ]
    }
  end
end
