function sync_fork
    set --local branch $argv[1]

    if ! set --query argv[1]
        echo "Branch not provided"
    end

    git checkout $branch
    git pull upstream $branch
    git push origin $branch
end
