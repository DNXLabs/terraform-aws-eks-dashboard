resource "kubernetes_service_account" "sample_user" {
  count = var.sample_user_enabled ? 1 : 0

  metadata {
    name      = "admin-user"
    namespace = var.namespace
  }
}

resource "kubernetes_cluster_role_binding" "sample_user" {
  count = var.sample_user_enabled ? 1 : 0

  metadata {
    name = "admin-user"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }

  subject {
    kind      = "ServiceAccount"
    name      = "admin-user"
    namespace = var.namespace
  }
}