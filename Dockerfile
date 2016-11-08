FROM mjmg/fedora-supervisor-base:latest

# Install OpenJDK8 and R
RUN \
  dnf install -y java-1.8.0-openjdk-headless R
  
# Setup default cran repo
RUN \
  echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
  
# default command
CMD ["/usr/bin/R"]
