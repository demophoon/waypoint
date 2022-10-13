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
    use "docker-pull" {
      image = "alpine"
      tag = "latest"
      disable_entrypoint = true
    }
  }

  deploy {
    use "docker" {
      command = ["sleep", "infinite"]
    }
  }
}
