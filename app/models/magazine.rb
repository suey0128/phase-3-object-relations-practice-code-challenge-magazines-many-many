class Magazine < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers, through: :subscriptions

  def email_list
    self.readers.map{|reader| reader.email}.join(';')
  end

    def self.most_popular
    arr = self.all.collect{|magazine| magazine.subscriptions.count} 
    popular = arr.max(1).first
    self.all.select{|magazine| 
        if magazine.subscriptions.count == popular
            magazine
        end
    }
    end

end