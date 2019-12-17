    build docker image locally :
docker build -f Dockerfile -t devops-eds-bl  .

    run container :
docker run -it `docker images | grep ansible-eds-bl | awk {'print $3'}`

    run ansible inside docker container :
cd ~/trainings/playbooks
ansible-playbook playbook.yml
