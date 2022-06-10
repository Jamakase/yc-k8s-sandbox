resource "yandex_iam_service_account" "cluster" {
  name = "k8s-cluster-service-account"
}

resource "yandex_resourcemanager_folder_iam_binding" "cluster_role" {
  folder_id = var.folder_id
  members   = [
    "serviceAccount:${yandex_iam_service_account.cluster.id}"
  ]
  role = "editor"
}

resource "yandex_iam_service_account" "cluster_node" {
  name = "k8s-cluster-node-service-account"
}

resource "yandex_resourcemanager_folder_iam_binding" "cluster_node_role" {
  folder_id = var.folder_id
  members   = [
    "serviceAccount:${yandex_iam_service_account.cluster_node.id}"
  ]
  role = "container-registry.images.puller"
}
