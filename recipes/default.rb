package 'docker'

# Enable and start Docker service

package 'docker.io'

# Starting the Docker service
service 'docker' do
  action [:enable, :start]
end

# Run the first container (fixed container in Challenge 1)
docker_container 'app_container' do
  repo 'krishz0303/docker-challenge-solved-mohitkjadon'
  tag 'latest'
  port '80:80'
  action :run
end

# Running the second container (OS metrics scraping container)
docker_container 'metrics_scraper' do
  repo 'ubuntu'
  tag 'latest'
  command 'sh -c "apt-get update && apt-get install -y python3-pip && pip3 install psutil flask && python3 /metrics_scraper.py"'
  port '8080:8080'  # Expose the metrics endpoint
  action :run
end

