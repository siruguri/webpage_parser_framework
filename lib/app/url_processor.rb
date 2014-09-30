class UrlProcessor
  def initialize(url)
    @url=url
  end

  def process
    ParserConfig.all.each do |parser_rec|
      # Find each matching regular expression for the URL and use its processor
      re=Regexp.new parser_rec.pattern
      if re.match @url
        json=("Parsers::#{parser_rec.class_name}").constantize.new(@url).produce
        store_json json
      end
    end
  end

  private
  def store_json(json)
    UrlPayload.create(url: @url, payload: json)
  end
end
