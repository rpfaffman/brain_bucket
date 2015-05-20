class Parse
  attr_reader :params

  def initialize(params)
    @params = params
  end

  def identifier
    @sender ||= params[:subject].split(' ')[2..3].join(' ')
  end

  def sms_number
    @sms_number ||= params[:subject].split(' ')[4..5].join.gsub(/\[|\]|\(|\)|-/,'')
  end

  def content
    @body ||= params[:body].gsub("\r\n", " ")
  end
end
