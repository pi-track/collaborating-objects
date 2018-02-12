class Story
  attr_accessor :name
  attr_reader :author

  def author=(author)
    raise AssociationTypeMismatchError, "#{author.class} received, Author expected" if !author.is_a?(Author)
    @author = author
    author.add_story(self) unless author.stories.include?(self)
  end

  attr_reader :category

  def category=(category)
    raise AssociationTypeMismatchError, "#{category.class} received, Category expected" if !category.is_a?(Category)
    @category = category
    category.add_story(self)
  end

  def build_author(authorName)
    a = Author.new
    a.name=(authorName)
    self.author=(a)
  end
end
