require 'story_guard/version'
require 'story_guard/git_reader'

module StoryGuard
  def self.go!
    project = PivotalTracker::Project.find(ENV['TRACKER_PROJECT_ID'])
    stories = project.stories.all(state: %w(started finished delivered rejected), story_type: %w(bug feature))
    puts 'The following stories are not accepted in tracker, but have commits'
    stories.select do |story|
      GitReader.grep_log(story.id).length > 0
    end.each do |story|
      puts "[#{story.id}] #{story.name} (#{story.url})"
    end
  end
end
