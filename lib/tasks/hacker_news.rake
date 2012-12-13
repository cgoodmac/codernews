namespace :hacker_news  do
  desc "get hacker news"
  task :getnews => :environment do
    require 'open-uri' #require open-uri lets you do the open in the next line
    doc = Nokogiri::HTML(open('http://news.ycombinator.com/newest'))
    links = doc.css('table table tr:nth-child(3n+1) td:nth-child(3) > a')
    links.each do |link|
      record = Link.where(:name => link.content, :url => link.get_attribute('href')).first # .content is how Nokogiri pulls out the content (the title)
      Link.create(:name => link.content, :url => link.get_attribute('href')) if record.nil? # if record doesn't already exist
    end
 end
end


# namespace :hacker_news do 
  
  # desc 'this is a'
  # task :a => :environment do
  #   puts Link.all.count
  # end

  # desc 'this is b'
  # task :b do
  #   @x = 'hello'
  #   puts 'bbb'
  # end

  # desc 'this is c'
  # task :c do
  #   puts 'ccc'
  # end

  # desc 'this is d'
  # task :d => [:b,:c] do
  #   puts 'd'
  #   puts @x
  # end

# end