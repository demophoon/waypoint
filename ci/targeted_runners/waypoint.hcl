project = "targeted_runners"

runner {
  enabled = true
  data_source "git" {
    url  = "https://github.com/demophoon/waypoint"
    path = "ci/targeted_runners"
  }
  profile = "targeted_runner_int"
}

app "targeted_runners" {
  build {
    use "null" {}
  }

  deploy {
    use "exec" {
      command = ["echo", "$PET_NAME"]
    }
  }
}
