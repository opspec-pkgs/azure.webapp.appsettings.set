# problem statement
sets azure webapp appsettings


> note: in usage & examples, VERSION represents a version of the azure.webapp.appsettings.set pkg
# usage

## install

```shell
opctl pkg install github.com/opspec-pkgs/azure.webapp.appsettings.set#VERSION
```

## run

```
opctl run github.com/opspec-pkgs/azure.webapp.appsettings.set#VERSION
```

## compose

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.webapp.appsettings.set#VERSION }
    inputs: 
      subscriptionId:
      loginId:
      loginSecret:
      name:
      resourceGroup:
      # begin optional args
      settings:
      slot:
      slotSettings:
      loginTenantId:
      loginType:
      # end optional args
```

# examples

## set multiple "app settings"

```yaml
run:
  op:
    pkg: { ref: github.com/opspec-pkgs/azure.webapp.appsettings.set#VERSION }
    inputs: 
      subscriptionId:
      loginId:
      loginSecret:
      name:
      resourceGroup:
      settings: >-
        someConstantKey=$(someVarValue)
        $(someVarKey)=someConstantValue
```

