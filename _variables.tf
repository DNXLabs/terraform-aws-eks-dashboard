variable "enabled" {
  type    = bool
  default = true
}

variable "cluster_name" {
  type        = string
  description = "The name of the cluster."
}

variable "helm_chart_name" {
  type        = string
  default     = "kubernetes-dashboard"
  description = "EKS Dashboard chart name."
}

variable "helm_chart_release_name" {
  type        = string
  default     = "kubernetes-dashboard"
  description = "EKS Dashboard release name."
}

variable "helm_chart_repo" {
  type        = string
  default     = "https://kubernetes.github.io/dashboard"
  description = "EKS Dashboard repository name."
}

variable "helm_chart_version" {
  type        = string
  default     = "4.0.0"
  description = "EKS Dashboard chart version."
}

variable "sample_user_enabled" {
  type        = bool
  default     = false
  description = "Whether to create k8s sample admin user and generate Bearer Token to access dashboard."
}

variable "create_namespace" {
  type        = bool
  default     = true
  description = "Whether to create k8s namespace with name defined by `namespace`."
}

variable "namespace" {
  type        = string
  default     = "kubernetes-dashboard"
  description = "Kubernetes namespace to deploy EKS Spot termination handler Helm chart."
}

variable "service_account_name" {
  type        = string
  default     = "kubernetes-dashboard"
  description = "EKS dashboard service account name."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

variable "settings" {
  type        = map(any)
  default     = {}
  description = "Additional settings which will be passed to the Helm chart values, see https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard."
}