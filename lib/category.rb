class Category
  attr_accessor :name

  def initialize
    @stories = []
  end

  def stories
    @stories.dup.freeze
  end

=begin
think this is un-necessary
  def stories=(story)
    raise AssociationTypeMismatchError, "#{story.class} received, Story expected" if !story.is_a?(Story)
    @stories << story
    author.add_story(self) unless author.stories.include?(self)
  end
=end

  def add_story(story)
    raise AssociationTypeMismatchError, "#{story.class} received, Story expected" if !story.is_a?(Story)
    @stories << story
    story.category=self unless story.category == self
  end

  def authors
    self.stories.collect {|s| s.author}.uniq
  end
end
