# Repo to reproduce Cypress crashing in servercore container

## To build and run
    docker build . -t cypress-crash
    docker run cypress-crash

## How to test in another browser
Chrome is default. Change the last line in `run.ps1`, rebuild image and run it.

## What will this repo do?
Run a sample Cypress test in either Electron, Edge, Chrome or Firefox. 

It will get this problem:

    cypress:server:browsers:browser-cri-client error finding browser target, maybe retrying { delay: 100, err: Error: connect ECONNREFUSED 127.0.0.1:49191 at TCPConnectWrap.afterConnect [as oncomplete] (node:net:1187:16) { errno: -4078, code: 'ECONNREFUSED', syscall: 'connect', address: '127.0.0.1', port: 49191 } }

And then crash with this message:

```
2022-11-02T10:02:16.549Z cypress:server:cypress exiting with err Error: connect ECONNREFUSED 127.0.0.1:49191
    at TCPConnectWrap.afterConnect [as oncomplete] (node:net:1187:16)
 {
  isCypressErr: true,
  type: 'CDP_COULD_NOT_CONNECT',
  details: 'Error: connect ECONNREFUSED 127.0.0.1:49191\n' +
    '    at TCPConnectWrap.afterConnect [as oncomplete] (node:net:1187:16)\n',
  messageMarkdown: 'Cypress failed to make a connection to the Chrome DevTools Protocol after retrying for 50 seconds.\n' +
    '\n' +
    'This usually indicates there was a problem opening the Edge browser.\n' +
    '\n' +
    'The CDP port requested was `49191`.',
  originalError: Error: connect ECONNREFUSED 127.0.0.1:49191
      at TCPConnectWrap.afterConnect [as oncomplete] (node:net:1187:16)
   {
    errno: -4078,
    code: 'ECONNREFUSED',
    syscall: 'connect',
    address: '127.0.0.1',
    port: 49191
  },
  stackWithoutMessage: '    at TCPConnectWrap.afterConnect [as oncomplete] (node:net:1187:16)\n'
}
2022-11-02T10:02:16.549Z cypress:server:cypress calling exit 1
2022-11-02T10:02:16.549Z cypress:server:cypress about to exit with code 1
Cypress failed to make a connection to the Chrome DevTools Protocol after retrying for 50 seconds.

This usually indicates there was a problem opening the Edge browser.

The CDP port requested was 49191.

Error: connect ECONNREFUSED 127.0.0.1:49191
    at TCPConnectWrap.afterConnect [as oncomplete] (node:net:1187:16)
```


