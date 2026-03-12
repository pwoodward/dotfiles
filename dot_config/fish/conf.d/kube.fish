if type -q kubectl
    kubectl completion fish | source

    abbr kube 'kubectl --kubeconfig ~/tmp/servers/cur.yaml -n aiops'
    abbr kubee 'kubectl --kubeconfig ~/tmp/servers/engolo.yaml -n aiops'
    abbr kubel 'kubectl --kubeconfig ~/tmp/servers/laamb.yaml -n aiops'
end
