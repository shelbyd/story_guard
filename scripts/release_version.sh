git co . &&
git pull -r &&
bundle exec rake &&
sed -i "s/VERSION.*/VERSION = \"$1\"/g" ./lib/story_guard/version.rb &&
git ci -am "version $1" &&
git tag $1 &&
git push &&
git push origin $1 &&
rm *.gem &&
gem build story_guard.gemspec &&
gem push "story_guard-$1.gem"
