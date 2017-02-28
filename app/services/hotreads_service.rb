class HotreadsService
  def self.send_link(url)
    conn = Faraday.new(url: "https://fast-island-59356.herokuapp.com/")
    conn.post '/api/v1/reads', {url: url}
  end

  def self.get_hotreads
  #   conn = Faraday.new(url: "https://fast-island-59356.herokuapp.com/")
  #   response = conn.get '/api/v1/reads'
  #   hotreads = JSON.parse(response.body, symbolize_names: true)
  #   hotreads.each do |hotread|
  #     link = Link.find_by(url: hotread[:url])
  #     if Read.find_by(link_id: link.id)
  #       Read.find_by(link_id: link.id).update_attributes(count: hotread[:hit_count])
  #     else
  #       Read.create(link: link, count: hotread[:hit_count])
  #     end
  #   end
  ""
  end
end
