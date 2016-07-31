# Webhook deploy example

## Instructions

1. Start the containers

        docker-compose up

2. Navigate to [http://localhost:8080](http://localhost:8080) and login with 
   **root** user (Hint: The default password is **5iveL!fe**)
3. Create a new project and name it **webapp**
4. Open [**Project Settings**/**Deploy Keys** and click on **New Deploy Key** button](http://localhost:8080/root/webapp/deploy_keys/new)
5. Paste the following to **Key** textarea and set the **Title** to `Webhook Deploy`

        ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjTcrmyPmR59WLgi7vdYQaQxkOlBFEEiIa0BoXEDT8Fx1x54+Q+ardbpz7HdYHem5inWWFj1CMfJ/gzqBdUPJ06U75B9EwWzS/JEKrqsFOevRZ12bW68IfF7Dwua3Kc0dm1fqEk65yGUNAIx3wcNGrncYSaGJCVzUHKFmcucytr8ezKw9O/XO3tvb+EdsmIAujMt7OyMopR8ViADF5PgUkV9C5AUgRYnncoQCikXRopjfjFPcMgJfvfKtcxgkJv6fboJNF+Cse8GmfEJfeEEy8X7cf0+WK3l+L2dOCCSg9dawabNpMat94XbBiJfmn7Jc27z8Datui7O5FT1oSZ7Z/ root@06506641d1e9

6. Click on **Create Deploy Key**
7. Open [**Project Settings**/**Web Hooks**](http://localhost:8080/root/webapp/hooks)
8. Enter 
   `http://webhook-deploy-nginx:8000/3260D0A2-A453-4780-A32F-B32C61CD19AC` in 
    the URL textbox and click on **Add Web Hook** button
9. Clone the repository to your machine (For the sake of this demo, we'll be using http protocol here):

        cd $(mktemp -d)
        git clone http://localhost:8080/root/webapp.git .

10. Create a file named **index.html** with the following contents:

        <!doctype html>
        <h1>It Works</h1>
        <p>Hello Webhook-deploy</p>

11. Create a directory named **.webhook** and create a file named **setup**
    inside that directory:

        #!/bin/sh

        PID="/var/run/nginx.pid"

        if [ -f "$PID" ]; then
            kill $(cat "$PID")
        fi

        cp index.html /var/lib/nginx/html/index.html
        nohup nginx -g 'daemon off;' &>/dev/null &
        echo $! > "$PID"

12. Add all files, commit the changes and push them to the repository
13. Navigate to [http://localhost:3000](http://localhost:3000)

