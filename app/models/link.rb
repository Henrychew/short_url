class Link < ActiveRecord::Base
    before_save :check_short_url

  private
  #Use a before_save callback in the Url model to generate the short URL.
    def check_short_url #to generate &to check if short_url generated so ngam duplicated jor in table, rare!
      if short_url.nil? #first time, short_url is nil, so this will run
        self.short_url = random_key #generate first time
        while !self.valid? #it will be not valid its duplicated upon validation(see above)
          self.short_url = random_key #its invalid, so regenerate again
        end
      end
    end

  def random_key
    # a = ('a'..'z').to_a + (0..9).to_a
    # a = a.shuffle.join("").slice(0,7)
    a = SecureRandom.hex(3)
  end
end
