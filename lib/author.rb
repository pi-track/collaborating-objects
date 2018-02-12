class Author
  attr_accessor :name

  def initialize
    @stories = []
  end

  def stories
    @stories.dup.freeze
  end

  def add_story(story)
    raise AssociationTypeMismatchError, "got #{story.class}, expected Story" if !story.is_a?(Story)
    @stories << story
    story.author = self unless story.author == self
  end

  def bibliography
    self.stories.collect {|s| s.name}
  end

  def categories
    self.stories.collect {|s| s.category}.uniq
  end

end
