locals {
  kubernetes_resources_labels = merge({
    "terraform-aws-eks/terraform-module" = "kube-dashboard",
  }, var.kubernetes_resources_labels)

  kubernetes_deployment_labels_selector = {
    "terraform-aws-eks/application" = "kubernetes-dashboard",
    "terraform-aws-eks/process" = "bootstrap",
    "terraform-aws-eks/unit" = "dashboard",
  }

  kubernetes_deployment_labels_selector_metrics = {
    "terraform-aws-eks/application" = "kubernetes-dashboard",
    "terraform-aws-eks/process" = "bootstrap",
    "terraform-aws-eks/unit" = "metrics-scraper",
  }

  kubernetes_deployment_labels = merge(local.kubernetes_deployment_labels_selector, local.kubernetes_resources_labels)
  kubernetes_deployment_labels_metrics = merge(local.kubernetes_deployment_labels_selector_metrics, local.kubernetes_resources_labels)

  kubernetes_deployment_image = "${var.kubernetes_deployment_image_registry}:${var.kubernetes_deployment_image_tag}"
  kubernetes_deployment_metrics_scraper_image = "${var.kubernetes_deployment_metrics_scraper_image_registry}:${var.kubernetes_deployment_metrics_scraper_image_tag}"
}