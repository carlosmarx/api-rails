class ApiConstraints
  attr_reader :options, :default

  def initialize(options)
    @version = options[:version]
    @default = options[:default] || false
  end
  
  def matches?(request)
    @default || (
      request.headers['Accept'].include?("application/vnd.marketplace.v#{@version}")
    )
  end
end