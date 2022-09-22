Build the image and run the tests:
```shell
project="project-a-$(date +%s)"

docker-compose -p $project -f docker-compose.test.yml build tests
docker-compose -p $project -f docker-compose.test.yml run tests
```

Do Docker cleanup (using $project from above):
```shell
docker-compose -p $project -f docker-compose.test.yml stop
docker-compose -p $project -f docker-compose.test.yml down --remove-orphans --volumes
```


```shell
docker-compose -f docker-compose.test.yml run tests
docker-compose ls
```

```shell
fake_jenkins=$HOME/Projects/fake-jenkins
for n in 1000 1001 1002; do
  docker-compose -f $fake_jenkins/branch-$n/workspace/docker-compose.test.yml build tests && \
  docker-compose -f $fake_jenkins/branch-$n/workspace/docker-compose.test.yml run tests
done
```
n=1000
docker-compose -f $fake_jenkins/branch-$n/workspace/docker-compose.test.yml build tests && \
  docker-compose -f $fake_jenkins/branch-$n/workspace/docker-compose.test.yml run tests

n=1001
docker-compose -f $fake_jenkins/branch-$n/workspace/docker-compose.test.yml build tests && \
  docker-compose -f $fake_jenkins/branch-$n/workspace/docker-compose.test.yml run tests

```shell
fake_jenkins=$HOME/Projects/fake-jenkins
for n in 1000 1001 1002; do
  docker-compose -f $fake_jenkins/branch-$n/workspace/docker-compose.test.yml stop
  docker-compose -f $fake_jenkins/branch-$n/workspace/docker-compose.test.yml down --remove-orphans --volumes
done 
```
