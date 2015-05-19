class Parse
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def sender
    @sender ||= params[:sender].split("\"")[1]
  end

  def content
    @body ||= params[:body].gsub("\r\n", " ")
  end
end
