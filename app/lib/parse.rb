class Parse
  attr_reader :params

  COMMAND_PREFIX = '!'

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
    @body ||= params[:body].gsub("\r\n", " ").strip
  end

  def command
    @command ||= (
      str = content.split(COMMAND_PREFIX)[1]
      if str
        str = str.strip.split(' ')
        OpenStruct.new(
          prefix: str[0],
          args:   str[1..-1]
        )
      end
    )
  end
end
