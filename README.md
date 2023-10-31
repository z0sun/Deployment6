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

[Default main.tf](https://github.com/z0sun/Deployment6/blob/main/defaultTerraform/main.tf)
[Banking Infrastructure main.tf](https://github.com/z0sun/Deployment6/blob/main/initTerraform/main.tf)

Terraform is like our magic wand for setting up our digital space in AWS. With it, we can script out and build our entire Banking app setup with just a few commands. The main.tf file? Think of it as our spellbook, where we jot down all the specific AWS pieces (like VPCs, instances, and databases) we want. By running this file, Terraform brings our design to life!


## Step #3 Github/Git to repo

(In this step some of my commits were made in the remote repository first.)

GitHub is like our digital locker, where we store and showcase all our project goodies. Git? That's the trusty toolkit we use to keep track of changes and make them if necessary. As for the repository, it's our project folder within that locker, neatly organizing all our Banking app's files and history. Together, they make teaming up on projects and tracking our work easier. Cloning our repository to our local machine allowed us to make updates to both our infrastructure files as well as all the files necessary to build our infrastructure and application [app.py, database.py, load_data.py)](https://github.com/z0sun/Deployment6/blob/main/Screen%20Shot%202023-10-30%20at%201.44.09%20AM.png) in one place.  

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

Jenkins is our automation maestro, making sure our Banking app's changes get the spotlight swiftly and smoothly. A [multi-pipeline build](https://github.com/z0sun/Deployment6/blob/main/Screen%20Shot%202023-10-30%20at%201.41.51%20AM.png) lets Jenkins handle multiple tasks or stages, like setting up, testing, and deploying or application, and with the help of terraform our [appsetup.sh](https://github.com/z0sun/Deployment6/blob/main/initTerraform/appsetup.sh) script automates the application deployment. The [agent](https://github.com/z0sun/Deployment6/blob/main/Screen%20Shot%202023-10-30%20at%201.42.33%20AM.png)on a second instance? That's Jenkins' sidekick, taking on heavy-lifting tasks without overburdening the main Jenkins system. By using Terraform to spin this up and linking with GitHub, we're ensuring our app updates are automatically tested and deployed. [Jenkins Manager/Agent Infrastrature](https://github.com/z0sun/Deployment6/blob/main/defaultTerraform/main.tf)

## Step #4 Configure RDS (Amazon Relational Database Service)

Amazon RDS is our go-to for managing databases within the AWS ecosystem. It offers us the convenience of not worrying about the nitty-gritty details of database setup, maintenance, or backups. With RDS, scaling to meet the Banking app's demands becomes straightforward. Additionally, its integration with other AWS services ensures seamless operations. In essence, RDS grants us reliability, scalability, and peace of mind in our database management. [Database](https://github.com/z0sun/Deployment6)

## Step #5 Load Balancers 

In our deployment, the [load balancers](https://github.com/z0sun/Deployment6/blob/main/Screen%20Shot%202023-10-30%20at%207.26.38%20PM.png) act as the efficient traffic director at a bustling intersection. It ensures that user requests to our Banking app are distributed evenly across multiple servers, preventing any single server from being overwhelmed. This not only optimizes response times but also increases fault tolerance. So, if one server faces issues, the load balancer redirects traffic to the others, ensuring a seamless user experience. In essence, it's our key to maintaining both performance and reliability.


# Issues 
---

- One of the main hurdles we faced during this deployment revolved around inconsistent [naming conventions](https://github.com/z0sun/Deployment6/blob/main/Screen%20Shot%202023-10-30%20at%208.54.12%20PM.png). It's crucial to emphasize that the alignment of our main.tf, variables.tf, and .tfvars files plays a pivotal role in our infrastructure's successful construction and the subsequent deployment of our Banking application. To ensure smooth operations, always double-check naming consistency within these files. Attention to these details now can save us from troubleshooting headaches later on.
  
- We encountered [space constraints](https://github.com/z0sun/Deployment6/blob/main/Screen%20Shot%202023-10-30%20at%201.39.45%20AM.png) during new infrastructure builds, as well as some missteps with routing configurations for subnets and routing tables. Effective resource management is paramount to avoid these pitfalls. Periodically reviewing your configurations and utilizing `terraform destroy` can help free up essential space and maintain the integrity of our routing mechanisms. Always proceed with caution and stay diligent.
  
# Optimization

To optimize our deployment, we should first address the foundational aspect: maintaining clear and consistent naming conventions throughout our Terraform files. Next, integrating a resource management strategy, which includes routine checks on space utilization and prudent use of terraform destroy, can alleviate potential bottlenecks. Implementing monitoring on our Jenkins multi-pipeline builds, especially when linking with GitHub, can provide real-time feedback and reduce troubleshooting time. Ensuring our RDS databases are correctly sized and indexed will further enhance application performance. Lastly, regularly reviewing our load balancer configurations will guarantee efficient traffic distribution, ensuring users get a seamless experience. Embracing these measures will set the stage for a robust, scalable, and efficient deployment.
