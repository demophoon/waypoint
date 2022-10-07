project = "pipelines"

runner {
  enabled = true
  data_source "git" {
    url  = "https://github.com/demophoon/waypoint"
    path = "ci/pipelines"
  }
}

app "pipelines" {
  build {
    use "null" {}
  }

  deploy {
    use "null" {}
  }

  release {
    use "null" {}
  }
}

pipeline "nested-pipeline" {
  step "build" {
    use "build" {}
  }

  step "deploy" {
    pipeline "nested" {
      step "deploy" {
        use "deploy" {}
      }
      step "release" {
        use "release" {}
      }
    }
  }
}
