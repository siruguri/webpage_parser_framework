class AppRunner
  def self.run
    urls=MyQueue.find_by_key('yahoo_dir').target_urls.where(last_crawled: nil)
    puts urls
  end
end
