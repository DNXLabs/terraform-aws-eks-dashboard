# terraform-aws-eks-dashboard

[![Lint Status](https://github.com/DNXLabs/terraform-aws-eks-dashboard/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-eks-dashboard/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-eks-dashboard)](https://github.com/DNXLabs/terraform-aws-eks-dashboard/blob/master/LICENSE)

Terraform module for deploying [kubernetes-dashboard](https://github.com/kubernetes/dashboard)  inside a pre-existing EKS cluster.

![Dashboard UI workloads page](images/dashboard-ui.png)

In case you have enabled the creation of the sample user, you can retrieve the token running:
`kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | awk '/^admin-user-token-/{print $1}') | awk '$1=="token:"{print $2}'`

When the deployment is complete, now access Dashboard at:
[http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:https/proxy](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:https/proxy)

## Usage
```
module "eks_dashboard" {
  source = "git::https://github.com/DNXLabs/terraform-aws-eks-dashboard.git"

  enabled             = true
  sample_user_enabled = true
  cluster_name        = module.eks_cluster.cluster_id
}

output "dashboard_url" {
  value = module.eks_dashboard.dashboard_url
}
```

<!--- BEGIN_TF_DOCS --->


<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-eks-dashboard/blob/master/LICENSE) for full details.