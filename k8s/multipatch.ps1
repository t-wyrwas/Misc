# args[0]: '{\"spec\": {\"suspend\": false}}'
$namesDump = $(kubectl get cronjob --no-headers -o custom-columns=NAME:.metadata.name)
$namesArray = $namesDump.split()
$filter = $args[1]
$predNames = $namesArray | where-object {$_ -like "$filter"}

foreach($name in $predNames) {
    kubectl patch cronjob $name -p $args[0]
}