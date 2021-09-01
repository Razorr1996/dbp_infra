resource "aws_iam_user" "ecs_exec" {
  name = "ecs-exec"
}

resource "aws_iam_access_key" "ecs_exec" {
  user = aws_iam_user.ecs_exec.name
}

resource "aws_iam_user_policy" "ecs_exec" {
  name = "ecs_exec"
  user = aws_iam_user.ecs_exec.name


  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Sid    = "AccessECSEXEC"
        Action = [
          "ecs:ListClusters",
          "ecs:ListTasks",
          "ecs:DescribeTasks",
          "ecs:DescribeClusters",
          "iam:SimulatePrincipalPolicy",
          "ecs:DescribeTaskDefinition",
          "ecs:ExecuteCommand",
        ]
        Resource = "*"
      },
    ]
  })
}
