# Ubuntu 24.04 for Railway

## Deploy

Create a new Railway project from this GitHub repository.

Railway detects the included Dockerfile and railway.json.

After deployment, create a public domain for the service.

## Pages

```text
/
```

Choose Desktop or Terminal.

```text
/desktop
```

Ubuntu desktop through noVNC.

```text
/terminal
```

Ubuntu terminal through ttyd.

## Terminal login

```text
Username: ubuntu
Password: ubuntu
```

## Environment

Railway provides the public port through the `PORT` environment variable. The startup script automatically configures Nginx to use it.
