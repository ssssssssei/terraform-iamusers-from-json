output "created_users" {
  description = "作成されたIAMユーザーのリスト"
  value = {
    for user_key, user in aws_iam_user.iam_users : user_key => {
      name = user.name  # ユーザー名
      arn  = user.arn   # ユーザーのARN
    }
  }
}