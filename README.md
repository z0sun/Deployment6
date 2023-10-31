# Deployment 6
### By Joseph White 

----------

# Purpose
----
This deployment aims to establish a robust AWS infrastructure and continuous integration/continuous deployment (CI/CD) environment for a Banking application. By adhering to a specific naming convention for AWS resources, we ensure a consistent and organized setup. The deployment utilizes Terraform, an infrastructure-as-code tool, to provision two distinct Virtual Private Clouds (VPCs) in separate AWS regions. Each VPC is equipped with its required components, ensuring redundancy and fault tolerance.

# Steps
----

## Step #1 Diagram

![Deployment6](https://github.com/z0sun/Deployment6/assets/135557197/c00cb983-a534-471e-a091-fd648440f251)

Planning and diagramming our AWS infrastructure for the Banking app is essential for clarity and efficiency. These blueprints minimize errors, facilitate clear communication, and help manage costs. Moreover, they offer flexibility for future changes and expedite troubleshooting. In short, such preparatory steps are not just preliminary but ensure the deployment is systematic and adaptable.

## Step #2 Terraform main.tf
[Default main.tf] (https://github.com/z0sun/Deployment6/blob/main/defaultTerraform/main.tf)
[Banking Infrastructure main.tf] (https://github.com/z0sun/Deployment6/blob/main/initTerraform/main.tf)

Terraform is like our magic wand for setting up our digital space in AWS. With it, we can script out and build our entire Banking app setup with just a few commands. The main.tf file? Think of it as our spellbook, where we jot down all the specific AWS pieces (like VPCs, instances, and databases) we want. By running this file, Terraform brings our design to life!


## Step #3 Github/Git to repo
(In this step some of my commits were made in the remote repository first.)

GitHub is like our digital locker, where we store and showcase all our project goodies. Git? That's the trusty toolkit we use to keep track of changes and make them if necessary. As for the repository, it's our project folder within that locker, neatly organizing all our Banking app's files and history. Together, they make teaming up on projects and tracking our work easier. Cloning our repository to our local machine allowed us to make updates to both our infrastructure files as well as all the files necessary to build our infrastructure and application (app.py, database.py, load_data.py) in one place.  

*GIT Jenkins Infrastructure*
```
git clone https://github.com/z0sun/Deployment6.git
cd Deployment6
git init
git pull
git branch second 
git switch second
#Create default terraform folder and add main.tf and installs
git commit -a 
git push --set-upstream origin second
git switch main
git merge second
git push --all
```

## Step #3 Jenkins

Jenkins is our automation maestro, making sure our Banking app's changes get the spotlight swiftly and smoothly. A multi-pipeline build lets Jenkins handle multiple tasks or stages, like setting up, testing, and deploying. The [agent](https://github.com/z0sun/Deployment6/blob/main/Screen%20Shot%202023-10-30%20at%201.42.33%20AM.png)on a second instance? That's Jenkins' sidekick, taking on heavy-lifting tasks without overburdening the main Jenkins system. By using Terraform to spin this up and linking with GitHub, we're ensuring our app updates are automatically tested and deployed. [Jenkins Manager/Agent Infrastrature](https://github.com/z0sun/Deployment6/blob/main/defaultTerraform/main.tf)

## Step #4 Configure RDS (Amazon Relational Database Service)

# Issues 

# System Diagram 

# Optimization
