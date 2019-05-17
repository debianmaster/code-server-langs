workflow "New workflow" {
  resolves = [
    "Build image",
    "Push docker image ",
  ]
  on = "push"
}

action "build docker image" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  runs = "docker build -t debianmaster/code-server:nodejs ."
}

action "Docker Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}

action "Push docker image " {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = [
    "Docker Login",
    "Build image",
  ]
  secrets = ["DOCKER_PASSWORD", "DOCKER_USERNAME"]
  args = "push debianmaster/code-server:nodejs"
}

action "Build image" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build -t debianmaster/code-server:nodejs ."
}
