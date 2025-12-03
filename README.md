**#AWS Microservices App — Déploiement avec Docker, Nginx, Terraform & GitHub Actions**

                                    **Présentation**

Ce projet met en place une architecture microservices complète déployée sur AWS EC2, incluant :

- Terraform pour créer l’infrastructure AWS

- Docker & Docker Compose pour la conteneurisation

- Nginx comme reverse proxy

- GitHub Actions pour un déploiement automatique (CI/CD)

- Une instance EC2 Ubuntu pour faire tourner l'application

                            **Les microservices incluent :**

- User Service

- Notifications Service

- Analytics Service

- Nginx Reverse Proxy (qui intercepte les requêtes et les redirige, afin d'éviter d'exposer les ports de mes services)

                            **Structure du projet**

```
aws-microservices-app/
│
├── root/
│   ├── docker-compose.yml
│   ├── nginx/
│   │   └── nginx.conf
│
├── user-service/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── notifications-service/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── analytics-service/
│   ├── app.py
│   ├── requirements.txt
│   └── Dockerfile
│
├── .github/
│   └── workflows/
│       └── deploy.yml
│
├── README.md
└── terraform_deployment/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    └── data.tf
```


                            **Microservices :**

**User Service**
Port : 5001
Description : Gestion des utilisateurs.

**Notifications Service**
Port : 5002
Description : Envoi de notifications.

**Analytics Service**
Port : 5003
Description : Endpoints analytiques (statistiques, métriques).

**Nginx**
Port : 80
Description : Reverse proxy pour router les requêtes vers les microservices.


                        **Nginx expose les routes :**

    /api/users

    /api/notifications

    /api/analytics/stats

                    **Déploiement AWS avec Terraform**

Terraform déploie l'infrastructure :

- Instance EC2
- Groupe de sécurité
- Paire de clés
- Rôles IAM

                            **Pour déployer :**

- cd terraform_deployment/
- terraform init
- terraform apply

                            **Pipeline CI/CD**

Workflow : .github/workflows/deploy.yml

Il effectue :

- Connexion SSH à EC2

- Suppression des anciens conteneurs

- Rebuild des images Docker

- Redémarrage automatique via : docker-compose up -d --build
