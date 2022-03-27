class Github::Repositories::Search < Github::Base
  DEFAULT_LANGUAGE_QUERY = 'ruby'
  DEFAULT_PER_PAGE = 10
  DEFAULT_PAGE = 1

  def initialize(params)
    @conn = Faraday.new(BASE_URL)
    @params = params
    @language = params[:language] || DEFAULT_LANGUAGE_QUERY
    @per_page = params[:per_page] || DEFAULT_PER_PAGE
    @page     = params[:page]     || DEFAULT_PAGE
  end

  def call!
    repositories_url = "#{BASE_URL}/search/repositories#{repositories_query_params}"

    response = Faraday.get(repositories_url)

    json = JSON.parse(response.body, symbolize_names: true)

    build_response(json[:items])
  end

  def self.call!(params)
    new(params).call!
  end

  private

  def build_query
    query = "#{@params[:query]} language:#{@language}"
    query += " user:#{@params[:user]}" if @params[:user]

    CGI.escape(query)
  end

  def repositories_query_params
    "?q=#{build_query}&sort=#{@params[:sort]}&order=#{@params[:order]}&per_page=#{@per_page}&page=#{@page}"
  end

  def build_response(items)
    items.map! do |item|
      {
        id: item[:id],
        full_name: item[:full_name],
        description: item[:description],
        stargazers_count: item[:stargazers_count],
        forks_count: item[:forks_count],
        owner: item[:owner][:login]
      }
    end
  end
end
