Hi, there!
This is manual for UI and function which fetch data for it.

1.After deploying, check name of deployment("kubectl get pods").
2.Then check token of jupyter by entering in cli "kubectl log -n default name-of-your-deployment | grep token"
3.Go to jupyterx.ddns.net and enter your token.

Hint:In folder "work" you can save your notebooks. Work dir is mounted to persistent volume.

4.Upload notebook sample via Jupyter UI and check that URI path of function should be the same as URI in GCP web console.

