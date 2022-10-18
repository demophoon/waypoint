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
      image = "nginx"
      tag = "latest"
    }
    registry {
      use "docker" {
        image = "localhost:5000/nginx"
        tag   = "latest"
      }
    }
  }

  deploy {
    use "docker" {
      service_port = 80
    }
  }
}
