
set -e  # Exit immediately if a command exits with a non-zero status

# Constants
DEPLOYMENT_FILE="./kubernetes/deployment.yaml"

# Determine the environment based on the branch
if [[ "$GITHUB_REF" == "refs/heads/main" ]]; then
    ECR_IMAGE="827845661247.dkr.ecr.us-east-1.amazonaws.com/devsu:latest"
    echo "Deploying to production environment..."
else
    ECR_IMAGE="827845661247.dkr.ecr.us-east-1.amazonaws.com/devsu:latest"
    echo "Deploying to development environment..."
fi

# Check if the deployment file exists
if [[ ! -f "$DEPLOYMENT_FILE" ]]; then
    echo "Error: Deployment file $DEPLOYMENT_FILE does not exist."
    exit 1
fi

# Update the image in the deployment YAML file
sed -i.bak "s|image: \".*\"|image: \"$ECR_IMAGE\"|" "$DEPLOYMENT_FILE"

# Inform the user of the update
echo "Updated $DEPLOYMENT_FILE with image: $ECR_IMAGE"