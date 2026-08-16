// CloudFront Function (viewer-request): 301 www.amanuensimus.com -> apex.
// One distribution serves both aliases; this sends the canonical host to the apex.
function handler(event) {
  var request = event.request;
  var host = request.headers.host ? request.headers.host.value : '';
  if (host === 'www.amanuensimus.com') {
    return {
      statusCode: 301,
      statusDescription: 'Moved Permanently',
      headers: {
        'location': { value: 'https://amanuensimus.com' + request.uri }
      }
    };
  }
  return request;
}
