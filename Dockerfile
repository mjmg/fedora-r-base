FROM fedora:latest

# Update System Image and install EPEL
RUN \
  dnf update -y && \
  dnf upgrade -y

# Install OpenJDK7 and R
RUN \
  yum install -y java-1.8.0-openjdk-headless R
  
#install additional tools and library prerequisites
RUN \
  dnf install -y unzip netcdf-devel libxml2-devel ImageMagick graphviz cairo-devel libXt-devel 
  
# Setup default cran repo
RUN \
  echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile

CMD "/bin/bash"
