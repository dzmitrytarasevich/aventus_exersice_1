# aventus_exersice_1
!!Application was developed and tested on microk8s single-node cluster.

The repo contains 2 types of app:
- docker-compose
- helm chart

If you want to run flask app without deploying k8s cluster just run:
   `docker-compose up -d --build`

It will create postgresql and flask connected apps.

Also you can find helm chart in flask-app folder.
Before running helm install you need to create namespace `flask-app`, github personal access token
with permissions:
- admin:repo_hook,
- delete:packages,
- repo,
- write:packages

and kubernetes secret, containing that token:

  `k create secret docker-registry github-key --docker-server=ghcr.io --docker-username=YOUR_USERNAME --docker-password=ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx --docker-email=YOUR_EMAIL -n flask-app`

here:
github-key - is the name of the secret
YOUR_EMAIL - email you use to log in to github
YOUR_USERNAME - is your username)
docker-password - paste your github personal access token.

Additionally you need to download and update helm dependencies:
`helm dependencies update`

Now you can install helm chart, containing
- flask app chart
- postgresql v16.2 helm chart
- pgadmin4 helm chart

`helm install -f ./flask-app/values.yaml flask-app -n flask-app .`

Flask app will be accessble via http://K8S_NODE_IP:30500/
Flask endpoints available:
http://K8S_NODE_IP:30500/endpoint1
http://K8S_NODE_IP:30500/endpoint2

Those endpoints return content of postgresql tables endpoint1 and endpoint2, stored in db db_exercise_1

Postgresql credentials hardcoded into helm version but they are using env vars in docker-compsoe version:
dbname="db_exercise_1"
user="postgres"
password="postgres"
host="flask-app-postgresql" (here postgresql service's name is used).

pgadmin4 is available http://K8S_NODE_IP:PGADMIN4_SERVICE_PORT
pgadmin4 credentials:
username - devops@example.com
password - devops
