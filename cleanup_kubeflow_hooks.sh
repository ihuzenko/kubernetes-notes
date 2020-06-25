for resource in "mutatingwebhookconfigurations.admissionregistration.k8s.io" \
                "validatingwebhookconfigurations.admissionregistration.k8s.io"; do
printf "\n=======================Cleaning up diff/$resource ==============\n"
while read in; do echo "kubectl delete $resource $in";kubectl delete $resource --timeout=60s $in; done < ./diff/$resource
done;
