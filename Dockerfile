FROM mjmg/fedora-supervisor-base:latest

# Install OpenJDK8 and R
RUN \
  dnf install -y java-1.8.0-openjdk-headless R
  
# Setup default cran repo
RUN \
  echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
  
ADD \
  r-base.conf /etc/supervisor/conf.d/r-base.conf

# default command
#CMD ["supervisord", "-c", "/etc/supervisor.conf"]
CMD ["/usr/bin/R"]
