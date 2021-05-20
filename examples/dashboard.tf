module "eks_dashboard" {
  count  = local.workspace.dashboard.enabled ? 1 : 0
  source = "git::https://github.com/DNXLabs/terraform-aws-eks-dashboard.git?ref=0.1.1"

  enabled             = true
  sample_user_enabled = false

  settings = {
    "service" = {
      "type" = "NodePort"
    }
    "ingress" = {
      "enabled" = true
      "paths" = ["/*"]
      "annotations" = {
        "ingress.kubernetes.io/group.name" = "dev-apps-private"
        "kubernetes.io/ingress.class" = "alb"
        "alb.ingress.kubernetes.io/certificate-arn" = "arn:aws:acm:us-east-1:000:certificate/000"
        "alb.ingress.kubernetes.io/scheme" = "internal"
        "alb.ingress.kubernetes.io/listen-ports" = "[{\"HTTP\": 80}, {\"HTTPS\":443}]"
        "alb.ingress.kubernetes.io/actions.ssl-redirect" = "{\"Type\": \"redirect\", \"RedirectConfig\": { \"Protocol\": \"HTTPS\", \"Port\": \"443\", \"StatusCode\": \"HTTP_301\"}}"
        "alb.ingress.kubernetes.io/target-type" = "instance"
        "alb.ingress.kubernetes.io/success-codes" = "200"
        "alb.ingress.kubernetes.io/group.order" = "95"
        "alb.ingress.kubernetes.io/healthcheck-protocol" = "HTTPS"
        "alb.ingress.kubernetes.io/backend-protocol" = "HTTPS"
      }
      "hosts" = ["k8s.dev.private.mydomain.com"]
    }
  }
}

output "dashboard_url" {
  value = try(module.eks_dashboard[0].dashboard_url, "")
}