# fastapi-k8s-app

Aplicacao FastAPI minima para testar um cluster Kubernetes com um container web simples.

## Por que usar este projeto para testar Kubernetes

- Validar se o cluster consegue criar pods e manter replicas (Deployment).
- Confirmar exposicao de porta via Service e acesso HTTP.
- Verificar rollout, escalabilidade e reinicio automatico de pods.
- Exercitar build e push de imagem Docker antes de usar apps reais.

## Estrutura

- `src/fastapi_k8s_app/main.py`: aplicacao FastAPI
- `Dockerfile`: imagem de execucao
- `deployment.yaml` e `service.yaml`: manifestos Kubernetes

## Executar localmente

```powershell
python -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install fastapi uvicorn
uvicorn fastapi_k8s_app.main:app --reload --app-dir src
```

Acesse: http://127.0.0.1:8000/

## Executar com Docker

```powershell
docker build -t fastapi-k8s-app .
docker run -p 8000:8000 fastapi-k8s-app
```

Acesse: http://127.0.0.1:8000/

## Executar no Kubernetes

1) Construa e publique a imagem em um registry (ex.: Docker Hub) e atualize `deployment.yaml`:

- `image: seu_usuario/fastapi-k8s-app:latest`

2) Aplique os manifestos:

```powershell
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

3) Verifique:

```powershell
kubectl get pods
kubectl get svc
```

Se estiver usando `NodePort`, acesse pela porta informada no `kubectl get svc`.
Se estiver usando `LoadBalancer`, aguarde o IP externo aparecer.
