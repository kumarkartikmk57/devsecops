
Dashboard
Issues
Pull Requests
Milestones
Explore
Notifications
 Create…
bob Profile and Settings…
bob
/
kubernetes-devops-security
Unwatch
1
Star
0
Fork
0
Code
Issues
Pull Requests
Projects
Releases
Wiki
Activity
Settings
devsecops app
Manage Topics
 2 Commits
 1 Branch
 0 Tags
 327 KiB
 Branch: master 
kubernetes-devops-security/integration-test.sh
37 lines
801 B
Raw
Permalink
Blame
History
#!/bin/bash
#integration-test.sh

sleep 5s

PORT=$(kubectl -n default get svc ${serviceName} -o json | jq .spec.ports[].nodePort)

echo $PORT
echo $applicationURL:$PORT$applicationURI

if [[ ! -z "$PORT" ]];
then

    response=$(curl -s $applicationURL:$PORT$applicationURI)
    http_code=$(curl -s -o /dev/null -w "%{http_code}" $applicationURL:$PORT$applicationURI)

    if [[ "$response" == 100 ]];
        then
            echo "Increment Test Passed"
        else
            echo "Increment Test Failed"
            exit 1;
    fi;

    if [[ "$http_code" == 200 ]];
        then
            echo "HTTP Status Code Test Passed"
        else
            echo "HTTP Status code is not 200"
            exit 1;
    fi;

else
        echo "The Service does not have a NodePort"
        exit 1;
fi;
Powered by Gitea Version: 1.14.1 Page: 32ms Template: 2ms Licenses API Website Go1.16.3