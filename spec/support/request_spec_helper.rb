module RequestSpecHelper
  def json_body
    JSON.parse(response.body, symbolize_names: true) if response.body.present?
  end
end
