resource "yandex_vpc_network" "network" {
  name = "test-network"
}

resource "yandex_vpc_subnet" "cluster_subnet" {
  network_id     = yandex_vpc_network.network.id
  zone           = "ru-central1-a"
  v4_cidr_blocks = ["10.0.0.0/24"]
}
