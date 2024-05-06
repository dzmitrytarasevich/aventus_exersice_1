Project for COMPANY TF infrastructure

- Branches should be created with ticket id as the name. i.e. `git checkout -b BRANCH_NAME`
- minimum of 1 approver for merging to master

 The General structure of the project should look like this
 
```
tree -L 2
.
├── README.md
├── es_autoscaling_group.tf
├── iam_roles.tf
├── kibana_asg_alb_tg.tf
├── main.tf
├── modules
│   ├── Wazuh_Cluster
│   ├── es_autoscaling_group
│   ├── kibana_asg_alb_tg
│   └── wazuh_worker
├── wazuh_cluster.tf
└── wazuh_worker.tf
```

specific data sources and module invocations are in the root folder
all resources in modules are treated as w/o any hardcoding of values from customer
The modules and structure will be added to the existing vpc/sg/nw providers from COMPANY tf 
All resources should be tagged identically to existing VPC
Testing will be done against COMPANY sandbox, all variables should reflect this but never to 
be merged on customer side

Use TF 0.15+ in the project
