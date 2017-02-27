class HotreadsService
  def self.send_link(url)
    conn.post '/api/v1/reads', {url: url}
  end

  def self.get_hotreads
    conn.get '/api/v1/reads'
  end

  def self.conn
    Faraday.new(url: "https://fast-island-59356.herokuapp.com/")
  end
end
