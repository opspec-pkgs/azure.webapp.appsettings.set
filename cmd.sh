#!/usr/bin/env sh

### begin login
loginCmd='az login -u "$loginId" -p "$loginSecret"'

# handle opts
if [ "$loginTenantId" != " " ]; then
    loginCmd=$(printf "%s --tenant %s" "$loginCmd" "$loginTenantId")
fi

case "$loginType" in
    "user")
        echo "logging in as user"
        ;;
    "sp")
        echo "logging in as service principal"
        loginCmd=$(printf "%s --service-principal" "$loginCmd")
        ;;
esac
eval "$loginCmd" >/dev/null

echo "setting default subscription"
az account set --subscription "$subscriptionId"
### end login

createCmd='az webapp config appsettings set'
createCmd=$(printf "%s --name %s" "$createCmd" "$name")
createCmd=$(printf "%s --resource-group %s" "$createCmd" "$resourceGroup")

# handle opts
if [ "$settings" != " " ]; then
createCmd=$(printf "%s --settings %s" "$createCmd" "$settings")
fi

if [ "$slot" != " " ]; then
createCmd=$(printf "%s --slot %s" "$createCmd" "$slot")
fi

if [ "$slotSettings" != " " ]; then
createCmd=$(printf "%s --slot-settings %s" "$createCmd" "$slotSettings")
fi

echo "setting appsettings"
eval "$createCmd"