module Parsers
  class YahooDirMainPage
    def initialize(url)
      @url=url
    end

    def produce
      binding.pry

      dom=Nokogiri::HTML(open(@url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}))
      cats_a = dom.css '.lft_cat a'
      cats_a |= dom.css('.rgt_cat a')

      cats_a.map do |elt|
        {cat_name: elt.text, href: elt.attr('href')}
      end
    end
  end
end
