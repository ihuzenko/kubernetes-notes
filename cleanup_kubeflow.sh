for resource in "deployments.apps" "replicasets.apps" "services" "persistentvolumeclaims" "jobs.batch" "statefulsets.apps" \
                "poddisruptionbudgets.policy" "horizontalpodautoscalers.autoscaling" "controllerrevisions.apps" \
                "mutatingwebhookconfigurations.admissionregistration.k8s.io" \
                "validatingwebhookconfigurations.admissionregistration.k8s.io" \
                "clusterrolebindings.rbac.authorization.k8s.io" \
                "rolebindings.rbac.authorization.k8s.io" "roles.rbac.authorization.k8s.io" \
                "secrets" \
                "customresourcedefinitions.apiextensions.k8s.io" \
                "apiservices.apiregistration.k8s.io" \
                "endpoints" "configmaps" "namespaces"; do
printf "\n=======================Cleaning up diff/$resource ==============\n"
while read in; do echo "kubectl delete $resource $in";kubectl delete $resource --timeout=60s $in; done < ./diff/$resource
done;