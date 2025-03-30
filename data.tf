data "local_file" "db_users_data" {
  filename = var.users_file
}

locals {
  # JSONファイルをユーザーリストとしてパース
  users_raw = jsondecode(data.local_file.db_users_data.content)

  # ユーザーデータとタグの前処理
  users_processed = {
    for user in local.users_raw : user["user_name"] => {
      name = user["user_name"]
      tags = {
        policy = user["policy"]
      }
    }
  }
}
