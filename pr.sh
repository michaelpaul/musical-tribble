base=main
branch=models
pr_title='Update models'
pr_body='OpenAPI spec or templates produced new models.'

git checkout -b ${branch} 2> /dev/null || true 
git add now.txt

if ! git diff --staged --exit-code; then
    echo 'Changes detected!'

    git commit -m 'Update models'
    git push origin "$branch"
    gh pr create --title "$pr_title" --body "$pr_body" --base "$base" --head "$branch" || true

    echo Changes published! 
else
    echo Nothing new, models are up-to-date! 
fi