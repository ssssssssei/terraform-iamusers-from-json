resource "aws_iam_user" "iam_users" {
  for_each = local.users_processed

  name = each.value.name
  tags = each.value.tags

  lifecycle {
    prevent_destroy = true  # ユーザーの誤削除を防止
  }
}