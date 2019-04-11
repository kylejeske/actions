workflow "Build It, Run It, Submit a Ticket" {
    on = "push"
    resolves = "Issue"
}
action "Issue" {
    needs = ["Nit-The-CodeTogether", "Nit-from-Gist"]
    uses = "swinton/httpie.action@master"
    args = ["--auth-type=jwt", "--auth=$GITHUB_TOKEN", "POST", "api.github.com/repos/$GITHUB_REPOSITORY/issues", "title=Hello\\ world"]
    secrets = ["GITHUB_TOKEN"]
}
