# Whatsapp Phish

I've written this as a proof of concent without checking to see if there are already available PoC projects written.

After writing this, I found out that there are indeed PoCs like [this](https://github.com/Mawalu/whatsapp-phishing) and [this](https://github.com/OWASP/QRLJacking).

Anyhow, I've only found out about it after writting this.

I've created it using the elixir language together with the Phoenix framework.

The difference between this project and others is that this project will spin up a [genserver](elixir-lang.org/getting-started/mix-otp/genserver.html) process, to continually scrape the whatsapp web's QR code and pushes it via a socket to the client to continually get the most updated QR code.

They say pictures means a thousand words, so here's a picture(diagram):

![Overview](https://user-images.githubusercontent.com/682923/29524496-8f1310de-86c2-11e7-9cf2-b0d03a49f5d4.png)


To start your own whatsapp phishing server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start a webdriver server, instructions can be found [here](https://github.com/HashNuke/hound/wiki/Starting-a-webdriver-server)
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
