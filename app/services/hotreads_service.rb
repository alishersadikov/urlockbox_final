class HotreadsService
  def self.send_link(url)
    conn = Faraday.new(url: "https://fast-island-59356.herokuapp.com/")
    conn.post '/api/v1/reads', {url: url}
  end

  def self.get_hotreads
    conn = Faraday.new(url: "https://fast-island-59356.herokuapp.com/")
    response = conn.get '/api/v1/reads'
    binding.pry
  end
end
