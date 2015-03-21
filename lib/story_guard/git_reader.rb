module StoryGuard
  module GitReader
    def self.grep_log(string)
      `git log --grep '#{string}'`
    end
  end
end
