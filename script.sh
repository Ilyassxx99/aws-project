aws cloudformation create-stack --stack-name VpcStack --template-body file://vpc.yaml
aws cloudformation create-stack --stack-name EksSg --template-body file://security-groups.yaml
aws cloudformation create-stack --stack-name EksCluster --template-body file://eks-cluster.yaml --capabilities CAPABILITY_NAMED_IAM
aws cloudformation create-stack --stack-name EksNodeGroup --template-body file://managed-nodes.yaml --capabilities CAPABILITY_NAMED_IAM
aws cloudformation create-stack --stack-name Rds --template-body file://Rds.yaml
aws eks update-kubeconfig --name prod
aws cloudformation describe-stacks --stack-name EksNodeGroup --query "Stacks[0].Outputs[0].OutputValue"
kubectl apply -f aws-auth-cm.yaml
