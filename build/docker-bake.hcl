group "default" {
  targets = ["1_0", "1_2_2"]
}

target "build-dockerfile" {
  dockerfile = "Dockerfile"
}

target "build-platforms" {
  platforms = ["linux/amd64", "linux/aarch64"]
}

target "build-common" {
  pull = true
}

target "1_0" {
  inherits = ["build-dockerfile", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/bbk-cli:1.0"]
  args = {
    BBKCLI_VERSION = "1.0"
  }
}

target "1_2_2" {
  inherits = ["build-dockerfile", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/bbk-cli:1", "docker.io/nlss/bbk-cli:1.2", "docker.io/nlss/bbk-cli:1.2.2", "docker.io/nlss/bbk-cli:latest"]
  args = {
    BBKCLI_VERSION = "1.2.2"
  }
}
