# Vue Sample Applications for Okta

> Note: You're currently looking at sample applications that support Vue 3. If you are looking for samples for Vue 2, please checkout the [vue-2 branch](https://github.com/okta/samples-js-vue/tree/vue-2).

This repository contains several sample applications that demonstrate various Okta use-cases in your Vue application.

Each sample makes use of the [Okta Vue Library][].

If you haven't done so already, register for a free account at [developer.okta.com](https://developer.okta.com/). Select **Create Free Account** and fill in the forms to complete the registration process. Once you are done and logged in, you will see your Okta Developer Console. 

> **Tip**: You can also create an account using the [Okta CLI](https://github.com/oktadeveloper/okta-cli) and `okta register`. To create an app, run `okta apps create` and use the settings below.

Register your application by selecting **Applications** > **Add Application**. On the next screen, choose **Single Page App** and click **Next**.

On the following screen, edit the application settings. For Vue applications running in developer mode, the port number should be 8080. Configure your app as follows:

* **Base URI**: `http://localhost:8080`
* **Login redirect URI**: `http://localhost:8080/login/callback` 
* **Logout redirect URI**: `http://localhost:8080` 

Once you have completed the form, you will be given a **client ID**. You will also need the **issuer** value for your Okta org. 

The **issuer** is the URL of the authorization server that will perform authentication.  All Developer Accounts have a "default" authorization server.  The issuer is a combination of your Org URL (found in the upper right of the console home page) and `/oauth2/default`. For example, `https://dev-133337.okta.com/oauth2/default`.

These values must exist as environment variables. They can be exported in the shell, or saved in a file named `testenv`, located in the same directory as this README. See [dotenv](https://www.npmjs.com/package/dotenv) for more details on this file format.

```ini
ISSUER=https://yourOktaDomain.com/oauth2/default
CLIENT_ID=123xxxxx123
```

Please find the sample that fits your use-case from the table below.

| Sample | Description |
|--------|-------------|
| [Okta-Hosted Login](/okta-hosted-login) | A Vue application that will redirect the user to the Okta-Hosted login page for authentication.  The user is redirected back to the Vue application after authenticating. |
| [Custom Login Page](/custom-login) | A Vue application that uses the Okta Sign-In Widget within the Vue application to authenticate the user. |

[Okta Vue Library]: https://github.com/okta/okta-oidc-js/tree/master/packages/okta-vue

## Running the resource server
The samples include a page which accesses a protected resource (messages). To start the sample resource server:

```
npm run resource-server
```

## Running the tests

In addition to the other environment vars, you will need credentials for a test user.
Set the values for `USERNAME` and `PASSWORD` and export as shell variables.
(At this time, the `testenv` file is not supported)

```ini
ISSUER=https://yourOktaDomain.com/oauth2/default
CLIENT_ID=123xxxxx123
USERNAME=testuser
PASSWORD=testpass
```

With variables set, run `npm test`
