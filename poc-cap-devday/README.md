
cds init poc-cap-devday

cds add xsuaa
cds add sqlite

Create file "schema.cds"
Create file "service.cds"

"auth": {
    "kind": "mocked",
    "users": {
        "admin": {
        "password": "admin",
        "roles": [
            "admin"
        ]
        }
    }
}