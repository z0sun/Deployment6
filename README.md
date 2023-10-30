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

## Step #2 Github/Git to repo
(In this step some of my commits were made in the remote repository first.)

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
*GIT Update DATABAASE_URL*
```
git switch second
#Update database endpoint app.py, database.py, load_data.py 
git commit -a
git switch main
git merge second
git push --all
```
## Step #3 Jenkins

## Step #4 Configure RDS (Amazon Relational Database Service)

# Issues 

# System Diagram 

# Optimization
