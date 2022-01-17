package main

deny[msg] {
  input.kind == "Deployment"
  not input.spec.template.spec.securityContext.runAsNonRoot

  msg := "Containers must not run as root"
  #msg = sprintf("Containers must not run as root in Deployment %s", [name])

}

deny[msg] {
  input.kind == "Deployment"
  not input.spec.selector.matchLabels.app

  msg := "Containers must provide app label for pod selectors"
}

deny[msg] {
	input.kind = "Secret"
	msg = "Secrets are not allowed.  Use ExternalSecret kind."
}
