FROM ubuntu:18.04
LABEL maintainer="Julien Marrec <julien@effibem.com>"
LABEL version="1.0"
LABEL description="A test container to run a cron job every 1 minute to run a python script and do some timestamp logging as well."

WORKDIR /var/test/

# Send build context (cf .dockerignore) to WORKDIR
ADD . .

RUN apt-get update && apt-get install -y cron python3

# This will correctly install dependencies as listed in setup.py (if setup.py is correct)
# RUN pip3 install -e .

# Copy run-1min-cron file to the cron.d directory
COPY run-1min-cron /etc/cron.d/run-1min-cron

# Give execution rights on the cron job
# Apply cron job
# Create the log file to be able to run tail
RUN chmod 0644 /etc/cron.d/run-1min-cron &&\
    crontab /etc/cron.d/run-1min-cron &&\
    touch /var/log/cron.log

# Run the command on container startup (this is an alternative to entrypoint.sh)
CMD cron && tail -f /var/log/cron.log
