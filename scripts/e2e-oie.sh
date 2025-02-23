#!/bin/bash -x

source ${OKTA_HOME}/${REPO}/scripts/setup-e2e.sh

export TRAVIS=true
export DBUS_SESSION_BUS_ADDRESS=/dev/null

export TEST_SUITE_TYPE="junit"
export TEST_RESULT_FILE_DIR="${REPO}/build2/reports/junit"

export ORG_OIE_ENABLED=true # This flag ensures the TCK tests run OIE tests
export USE_INTERACTION_CODE=true # This flag ensures that the self hosted widget uses interact code flow
export ISSUER=https://oie-signin-widget.okta.com/oauth2/default
export CLIENT_ID=0oa8lrg7ojTsbJgRQ696
export USERNAME=george@acme.com
export EMAIL_MFA_USERNAME=email-login@email.ghostinspector.com
get_secret prod/okta-sdk-vars/password PASSWORD
export SMS_MFA_USERNAME=sms-login@okta.com
export FB_USERNAME=ycfjikukbl_1613767309@tfbnw.net
get_secret prod/okta-sdk-vars/fb_password FB_PASSWORD
get_secret prod/okta-sdk-vars/twilio_account TWILIO_ACCOUNT
get_secret prod/okta-sdk-vars/twilio_api_token TWILIO_API_TOKEN
export FB_USERNAME=ycfjikukbl_1613767309@tfbnw.net
get_secret prod/okta-sdk-vars/fb_password FB_PASSWORD
export DEFAULT_TIMEOUT_INTERVAL=45000

cd ${OKTA_HOME}/${REPO}

if ! run_tests; then
  echo "e2e tests failed! Exiting..."
  exit ${TEST_FAILURE}
fi

echo ${TEST_SUITE_TYPE} > ${TEST_SUITE_TYPE_FILE}
echo ${TEST_RESULT_FILE_DIR} > ${TEST_RESULT_FILE_DIR_FILE}
exit ${PUBLISH_TYPE_AND_RESULT_DIR}
