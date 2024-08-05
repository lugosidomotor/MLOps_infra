resource "helm_release" "argocd" {
  name       = "argocd"
  namespace  = "argocd"
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  version    = "5.3.4"

  create_namespace = true

  values = [
    <<EOF
server:
  service:
    type: LoadBalancer
EOF
  ]
}

resource "local_file" "kubeconfig" {
  content  = azurerm_kubernetes_cluster.aks.kube_config_raw
  filename = "${path.module}/kubeconfig"
}

resource "null_resource" "argocd_applications" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = <<EOT
      kubectl apply -f role.yaml --kubeconfig=${local_file.kubeconfig.filename} --validate=false
      kubectl apply -f rolebinding.yaml --kubeconfig=${local_file.kubeconfig.filename} --validate=false
      kubectl apply -f ./argo/${var.environment}/argocd-app-1.yml --kubeconfig=${local_file.kubeconfig.filename} --validate=false --namespace=argocd
    EOT
  }

  depends_on = [
    helm_release.argocd,
    azurerm_storage_account.storage
  ]
}