

GIT Bash
cd /C/MLOps_V2/Prometheus_GITHUB/C1_PROM
git status && git add . && git commit -m "1.2 initial commit" && git push origin main

https://github.com/org-gceraj/e2e_a_ui

git remote remove origin
git remote add origin git@github.com:org-gceraj/e2e_a_prom.git
git branch -M main
gh repo create org-gceraj/e2e_a_ui --public --source=. --push


----------------------------------------------------------------

SET WORKING_DIR=C:\MLOps_V2\Prometheus_GITHUB\B1_Create_fastapi_streamlit
cd %WORKING_DIR%

docker network create sentiment-net

docker build -t gceraj/e2e_v1-api:1.1 -f docker\Dockerfile.api .
docker run --name fastapi --network sentiment-net -p 8000:8000 -it gceraj/e2e_v1-api:1.1 bash
uvicorn api.main:app --host 0.0.0.0 --port 8000

docker build -t gceraj/e2e_v1-ui:1.1 -f docker\Dockerfile.ui .
docker run --name streamlit --network sentiment-net -p 8501:8501 -it gceraj/e2e_v1-ui:1.1 bash
# export ENV_API_URL="http://localhost:8000"
# export ENV_API_URL="http://0.0.0.0:8000"
export ENV_API_URL="http://fastapi:8000"
streamlit run ui/app.py --server.port 8501 --server.address 0.0.0.0

docker build -t gceraj/e2e_v1-prom:1.1 -f prometheus\Prom.Dockerfile .
docker run --name prom --network sentiment-net -p 9090:9090 -it gceraj/e2e_v1-prom:1.1

----------------------------------------------------------------

http://localhost:8501/
http://localhost:9090

----------------------------------------------------------------

ssh -i id_ed25519 ubuntu@<EC2_IP>
ssh -i id_ed25519 devopsadmin@98.92.118.33
ssh devopsadmin@98.92.118.33 whoami
ssh ubuntu@35.170.81.241 whoami

cd C:\MLOps_V2\Prometheus_GITHUB
ssh -i ec2_prom.pub devopsadmin@98.92.118.33
ssh -i ec2_prom.pub devopsadmin@98.92.118.33

----------------------------------------------------------------
