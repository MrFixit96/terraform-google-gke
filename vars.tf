variable "project" {
  description = "The ID of the project in which the resource belongs."
}

variable "environment" {
}

variable "cluster_name" {
  description = "The name of the gke cluster for management purposes"
  default = "my-gke-cluster"
}

variable "node_name" {
  description = ""
  default = "gke-node"
}

variable "region" {
  description = "The region that the cluster master and nodes should be created in."
  default = "us-central1"
}


variable "network" {
  descriptionn = "The Google Cloud VPC(Network) to use"
  default = "default"
}

variable "subnetwork_name" {
  description = "Name of the subnetwork in VPC."
  default = "default"
}

variable "initial_node_count" {
  description = "The number of nodes to create in this cluster"
  default = 3
}

variable "daily_maintenance_window" {
  description = "Time window specified for daily maintenance operations. Format HH:MM"
  default = "00:01"
}

variable "prod_machine_type" {
  description = "The name of a Google Compute Engine machine type. Defaults to n1-standard-1. To create a custom machine type"
  default = "e2-standard-2"
}

variable "dev_machine_type" {
  description = "The name of a Google Compute Engine machine type. Defaults to n1-standard-1. To create a custom machine type"
  default = "g1-small"
}

variable "disk_type" {
  description = "Type of disk attached to each node, pd-ssd or pd-standard"
  default = "pd-ssd"
}

variable "disk_size_gb" {
  description = "Size of the disk attached to each node, specified in GB. The smallest allowed disk size is 10GB. Defaults to 100GB"
  default = "100GB"
}

variable "min_node_cout" {
  description = "Minimum number of nodes in the NodePool"
  default = 1
}

variable "max_node_count" {
  description = "Maximum number of nodes in the NodePool."
  default = 3
}

variable "master_version" {
  description = "The current version of the master in the cluster. "
  default = "1.16.13-gke.1"
}

variable "cluster_secondary_range_name" {
  description = "The name of the clusters ip alias range used for pods"
  default = "ip-cidr-range-k8-pod"
}

variable "services_secondary_range_name" {
  description = "ip-cidr-range-k8-service"
}

variable "master_ipv4_cidr_block" {
  description = "The IP range in CIDR notation to use for the hosted master network (default is block all)"
}

variable "default_node_pool" {
  description = "Whether or not to delete the default node pool upon cluster creation."
  default = false
}

variable "network_policy" {
  description = "Must be Enabled to use network policy add-on in the cluster."
  default = false
}

// Kubernetes Addons
variable "horizontal_pod_autoscaling" {
  description = "Enable horizontal pod autoscaling addon"
  default = false
}

variable "http_load_balancing" {
  description = "The status of the HTTP (L7) load balancing controller addon, which makes it easy to set up HTTP load balancers for services in a cluster."
  default = true
}

variable "network_policy_config" {
  description = "Enable network policy addon"
  default = false
}

variable "kubernetes_dashboard" {
  description = "Enable HTTP Load balancer addon"
  default = false
}

// Private Cluster Config
variable "enable_private_endpoint" {
  description = "Whether the master's internal IP address is used as the cluster endpoint"
  default     = false
}

variable "enable_private_nodes" {
  description = "Whether or not to use private nodes with no public internet access"
  default     = false
}

// IP Allocation Config
variable "use_ip_aliases" {
  description = "Whether or not to use IP Aliases. This is enabled by default"
  default     = true
}


variable "node_ipv4_cidr_block" {
  description = "IP address block to chose node addresses from"
  default = "10.0.1.0/24"
}

variable "cluster_ipv4_cidr_block" {
  description = " The IP address range for the cluster pod IPs. Set to blank to have a range chosen with the default size."
  default = ""
}

variable "services_ipv4_cidr_block" {
  description = "The IP address range of the services IPs in this cluster. Set to blank to have a range chosen with the default size. "
  default = ""
}

// Master Authorized Networks
variable "master_authorized_network_name" {
  description = "Field for users to identify CIDR blocks"
  default     = "default" 
}

variable "master_authorized_cidr_block" {
  description = "External network that can access Kubernetes master through HTTPS. Must be specified in CIDR notation"
  default     = "0.0.0.0/0" 
}

// NODE POOL //
// Management
variable "node_auto_repair" {
  description = "Whether the nodes will be automatically repaired."
  default = true
}

variable "node_auto_upgrade" {
  description = "Whether the nodes will be automatically upgraded"
  default = true
}

variable "preemptible" {
  description = "whether or not the underlying node VMs are preemptible"
  default = true
}

variable "node_tags" {
  description = "The list of instance tags applied to all nodes. "
  type        = list(string)
  default = [""]
}

variable "node_labels" {
  description = "The GCE resource labels (a map of key/value pairs) to be applied to the cluster"
  type        = map(string)
  default = {""=""}
}

variable "oauth_scopes" {
  type        = list(string)
  description = "oaauth scopes for node and cluster configs"
  default = [ "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring" ]
}

variable "image_type" {
  description = "The image to  build the node pool from"
  default     = "COS"
}

