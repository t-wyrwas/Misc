# kubectl
function kp {kubectl get pods}
Export-ModuleMember -Function kp

function kpn {kubectl get pods -n $args[0]}
Export-ModuleMember -Function kpn 

function kgc {kubectl config get-contexts}
Export-ModuleMember -Function kgc

function kuc {kubectl config use-context $args[0]}
Export-ModuleMember -Function kuc

function kgp {kubectl get pod $args[0]}
Export-ModuleMember -Function kgp  

function kg {kubectl get $args[0] $args[1]}
Export-ModuleMember -Function kg 

function kgn {kubectl get $args[0] $args[1] -n $args[2]}
Export-ModuleMember -Function kgn  

function ke {kubectl exec -it $args[0] -- $args[1]}
Export-ModuleMember -Function ke  

function keb {kubectl exec -it $args[0] -- /bin/bash}
Export-ModuleMember -Function ke  

function kes {kubectl exec -it $args[0] -- /bin/sh}
Export-ModuleMember -Function ke  

function klp {kubectl logs $args[0]}
Export-ModuleMember -Function klp  

function kdp {kubectl delete pod $args[0]}
Export-ModuleMember -Function kdp  

function kpa {kubectl get pod --selector=app=$args -o yaml}

function kpda {kubectl describe pod --selector=app=$args}

function remove-failed-pods {
    $listOfPods = (kubectl get pods --field-selector=status.phase=Failed | select {$_.Split(' ')[0]})
    $listOfPods = $listOfPods[1..$listOfPods.count]
    foreach ($p in $listOfPods)
    {
        $podName = "${p}".Split('=')[1].Split('}')[0]
        kubectl delete pod $podName
    }
    }


