echo "################################";
echo "Trying to make brew and Yosemite play nice ...";
echo "";
echo "More debugging info: https://github.com/Homebrew/homebrew/wiki/troubleshooting";
echo "################################";


echo "brew prune";
brew prune;
echo "brew cleanup";
brew cleanup;
echo "brew doctor";
brew doctor;
echo "brew install imagemagick";
brew install imagemagick;
echo "brew install memcached";
brew install memcached;
echo "brew install most";
brew install most;
echo "brew install phantomjs";
brew install phantomjs;
