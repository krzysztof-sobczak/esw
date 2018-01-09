FROM python:2.7

RUN apt-get update && apt-get -y install netcat

# We use /app as working directory
WORKDIR /app

# Adding requirements.txt first before anything else. If there has not been any
# changes to requirements.txt since last build, Docker will use the cached
# version instead of running pip install again.
ADD ./requirements.txt /app/requirements.txt
RUN pip install --requirement requirements.txt

# Finally, add the rest of the code
ADD . /app

# The port where our API application is listening.
EXPOSE 80

# We set our own entrypoint, allowing us to verify database availability before
# the application is started.
ENTRYPOINT ["./docker/docker-entrypoint.sh"]

# Start the API by default if no other command is given when running the
# container
CMD ["api"]
