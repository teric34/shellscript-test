# shellscript-test
This is a toy program to test my shellprogram for https certificate check.  
  
[environmental variables in .env]  
DOMAINS = specify your domain name  
EXPIRE = set lifetime of certificate in days  
BFDAY = set how many days before you would like to renew certificate.  
  
[how to run this test script]  
1. docker-compose build  
2. docker-compose up -d
3. docker run exec -it shell ash  (get into the container)
4. sh shellscript.sh (run the script to test)
5. cat /tmp/shellscript.log (to check the result from log)
