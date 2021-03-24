# Pull down default ubuntu image
FROM ubuntu:20.04

#Make the frontend noninteractive. Initially done to not deal with tzdata
ENV DEBIAN_FRONTEND=noninteractive 

#Copy and run setup script
COPY setup.sh /setup.sh
CMD ["./setup.sh"]