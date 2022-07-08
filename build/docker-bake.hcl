group "default" {
  targets = ["1_0"]
}

target "build-dockerfile" {
  dockerfile = "Dockerfile"
}

target "build-platforms" {
  platforms = ["linux/i386", "linux/amd64", "linux/armhf", "linux/aarch64"]
}

target "build-common" {
  pull = true
}

target "1_0" {
  inherits = ["build-dockerfile", "build-platforms", "build-common"]
  tags     = ["docker.io/nlss/bbk-cli:1", "docker.io/nlss/bbk-cli:1.0", "docker.io/nlss/bbk-cli:latest"]
  args = {
    BBKCLI_VERSION = "1.0"
  }
}