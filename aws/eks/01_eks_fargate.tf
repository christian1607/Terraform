
resource "aws_iam_role" "role-eks" {

  name = "role-eks-${var.env}-${var.project}-01"


  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = ["eks.amazonaws.com"]
        }
      },
    ]
  })
}



resource "aws_iam_role_policy_attachment" "eks-cluster-policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.role-eks.name
}

resource "aws_iam_role_policy_attachment" "eks-resource-controller" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.role-eks.name
}



resource "aws_iam_role" "role-fp-eks" {

  name = "role-fp-eks-${var.env}-${var.project}-01"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = ["eks-fargate-pods.amazonaws.com"]
        }
      },
    ]
  })
}


resource "aws_iam_role_policy_attachment" "fargate-pod-exec" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = aws_iam_role.role-fp-eks.name
}

resource "aws_iam_role_policy_attachment" "fargate-cni" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.role-fp-eks.name
}

resource "aws_iam_role_policy_attachment" "fargate-ecr" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.role-fp-eks.name
}


resource "aws_eks_cluster" "eks" {
  name     = "eks-${var.env}-${var.project}-01"
  role_arn = aws_iam_role.role-eks.arn
  version  = var.k8s_version

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = false
    security_group_ids      = var.eks_security_groups_ids
    subnet_ids              = var.subnet_ids

  }

  encryption_config {
    resources = ["secrets"]
    provider {
      key_arn = var.aws_kms_key_arn
    }
  }

  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]

  tags = {
    Name          = "eks-${var.env}-${var.project}-${var.build_id}"
    RESOURCE-NAME = "eks-${var.env}-${var.project}-${var.build_id}"
    FUNCTION      = "CONTAINER-MGMT"
  }

  timeouts {
    create = "30m"
    delete = "30m"
    update = "30m"
  }
}

resource "aws_eks_fargate_profile" "fp-eks" {
  count                  = length(var.fargate_profile_definitions)
  cluster_name           = aws_eks_cluster.eks.name
  fargate_profile_name   = "fp-eks-${var.env}-${var.project}-${var.fargate_profile_definitions[count.index]["name"]}-${var.build_id}"
  pod_execution_role_arn = aws_iam_role.role-fp-eks.arn
  subnet_ids             = var.subnet_ids

  dynamic "selector" {
    for_each = var.fargate_profile_definitions[count.index]["namespaces"]
    content {
      namespace = selector.value
    }
  }


  tags = {
    Name          = "fp-eks-${var.env}-${var.project}-${var.build_id}"
    RESOURCE-NAME = "fp-eks-${var.env}-${var.project}-${var.build_id}"
    FUNCTION      = "CONTAINER-MGMT"
  }
}
