class Link < ApplicationRecord
  acts_as_votable
  acts_as_punchable
  belongs_to :user
  has_many :comments, :dependent => :destroy

  def self.sort(sort_condition)
    if sort_condition == 'Trending'
      @links = Link.sort_by_popularity('DESC')
    else
      @links = Link.all.sort_by.reverse_each
    end
  end
end
