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
}

output "dashboard_url" {
  value = module.eks_dashboard.dashboard_url
}
```

[See more examples of usage.](https://github.com/DNXLabs/terraform-aws-eks-dashboard/tree/master/examples)

<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| aws | >= 4.0.0, < 5.46.0 |
| helm | >= 1.0, < 3.0 |
| kubernetes | >= 1.10.0, < 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| helm | >= 1.0, < 3.0 |
| kubernetes | >= 1.10.0, < 3.0.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| create\_namespace | Whether to create k8s namespace with name defined by `namespace`. | `bool` | `true` | no |
| enabled | n/a | `bool` | `true` | no |
| helm\_chart\_name | EKS Dashboard chart name. | `string` | `"kubernetes-dashboard"` | no |
| helm\_chart\_release\_name | EKS Dashboard release name. | `string` | `"kubernetes-dashboard"` | no |
| helm\_chart\_repo | EKS Dashboard repository name. | `string` | `"https://kubernetes.github.io/dashboard"` | no |
| helm\_chart\_version | EKS Dashboard chart version. | `string` | `"4.0.0"` | no |
| mod\_dependency | Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable. | `any` | `null` | no |
| namespace | Kubernetes namespace to deploy EKS Spot termination handler Helm chart. | `string` | `"kubernetes-dashboard"` | no |
| sample\_user\_enabled | Whether to create k8s sample admin user and generate Bearer Token to access dashboard. | `bool` | `false` | no |
| service\_account\_name | EKS dashboard service account name. | `string` | `"kubernetes-dashboard"` | no |
| settings | Additional settings which will be passed to the Helm chart values, see https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard. | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| dashboard\_url | n/a |

<!--- END_TF_DOCS --->

## Authors

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-eks-dashboard/blob/master/LICENSE) for full details.