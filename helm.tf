resource "helm_release" "kubernetes_dashboard" {
  depends_on = [var.mod_dependency, kubernetes_namespace.kubernetes_dashboard]
  count      = var.enabled ? 1 : 0
  name       = var.helm_chart_name
  chart      = var.helm_chart_release_name
  repository = var.helm_chart_repo
  version    = var.helm_chart_version
  namespace  = var.namespace

  set {
    name  = "serviceAccount.name"
    value = var.service_account_name
  }

  values = [
    yamlencode(var.settings)
  ]
}

output "dashboard_url" {
  value = "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:https/proxy"
}