EDGELB="$(dcos task edgelb | wc -l)"
        if [ "$EDGELB" -lt "3" ]; then
        dcos package repo add --index=0 edgelb-aws https://edge-lb-infinity-artifacts.s3.amazonaws.com/autodelete7d/master/edgelb/stub-universe-edgelb.json
        dcos package repo add --index=0 edgelb-pool-aws https://edge-lb-infinity-artifacts.s3.amazonaws.com/autodelete7d/master/edgelb-pool/stub-universe-edgelb-pool.json
        dcos security org service-accounts keypair edgelb-private-key.pem edgelb-public-key.pem
        dcos security org service-accounts create -p edgelb-public-key.pem -d "edgelb service account" edgelb-principal
        dcos security org groups add_user superusers edgelb-principal
        dcos security secrets create-sa-secret --strict edgelb-private-key.pem edgelb-principal edgelb-secret
        rm -f edgelb-private-key.pem
        rm -f edgelb-public-key.pem
        dcos package install --options=edgelb-options.json edgelb --yes
        dcos package install edgelb-pool --cli --yes
        echo "Waiting for edge-lb to come up ..."
        until dcos edgelb ping; do sleep 1; done
        dcos edgelb config edge-lb-pool.yaml
        fi

echo

