class AppRunner
  def self.run
    target_urls = MyQueue.find_by_key('yahoo_dir').target_urls.where(last_crawled: nil)

    target_urls.each do |url_rec|
      UrlProcessor.new(url_rec.url).process
    end
  end
end
