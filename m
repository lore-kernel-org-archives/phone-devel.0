Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4431AC433E0
	for <phone-devel@archiver.kernel.org>; Fri, 26 Feb 2021 21:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC21464F13
	for <phone-devel@archiver.kernel.org>; Fri, 26 Feb 2021 21:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhBZVEk (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 26 Feb 2021 16:04:40 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:62253 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbhBZVEb (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 26 Feb 2021 16:04:31 -0500
Date:   Fri, 26 Feb 2021 21:03:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=connolly.tech;
        s=protonmail; t=1614373419;
        bh=mgI15i8Gqoao+PhkVDc90QeW7Hur0oMNEEFJzJqqPQI=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=kporxv1OhRLR2fWYgLjHZsd7U96MkrLdMoSpbDH7tcwZjOYYTCXWPKJ6kTRkqIsRo
         ynzaphaFrDuhhZ6ORGluiK1VFZK+k3I7EM3GvhfPH1gBRbrrK3Tlh5bzPQM+YsY3R3
         pfW07b0hbnSpw6id6Tx3pfwExlL9wPYG+Zw2VxDE=
To:     Rob Herring <robh@kernel.org>
From:   Caleb Connolly <caleb@connolly.tech>
Cc:     linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Rob Herring <robh+dt@kernel.org>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Reply-To: Caleb Connolly <caleb@connolly.tech>
Subject: Re: [PATCH v4 2/2] dt-bindings: Document bindings for new SDM845 devices
Message-ID: <3ffff921-8f83-ccf9-b304-667ae0611e2e@connolly.tech>
In-Reply-To: <20210125221812.GA1120729@robh.at.kernel.org>
References: <20210114203057.64541-1-caleb@connolly.tech> <20210114203057.64541-3-caleb@connolly.tech> <20210125221812.GA1120729@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi,

Is this patch ready to be merged?

Regards,

Caleb

On 25/01/2021 10:18 pm, Rob Herring wrote:
> On Thu, 14 Jan 2021 20:32:06 +0000, Caleb Connolly wrote:
>> Document compatible bindings for the new OnePlus 6/6T devices.
>>
>> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml        | 5 +++++
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   2 files changed, 7 insertions(+)
>>
> Acked-by: Rob Herring <robh@kernel.org>

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsFmBAEBCAAQBQJgOWIgCRAFgzErGV9ktgAKCRAFgzErGV9ktk+xD/0fKnmh
g6DDJRgcIdxgOqGCoZZDjYnuIsl1H89A2lJtoGB8x5Z6sQM6RgffkxWY+D9o
P7rhEsSTnRKGaLR+fuSHuhrorafQ2LYAB0LB8R8ngvRGJoFhEEMzGAb3+j/j
oBXveVU+bb8S+nQnDOdGZ4sJZ780gEpdm4yVWwwjmbBc2E2fJPgLRAeADcb8
3eG58dizoxtiEWkISIorX9aCVfHLgnGcl3UXumGN8SjKQR0b3tIoJy1heHXZ
o0RZj407kYWgj2zl9bO93ki735x7kb5T4cwE1HBO6nxs2BsKJMcDS9Vdo+FQ
EDsIfChWxHmSKDzeZCoG45qKBeFLxmqx7TpoJb7mMuHlTtaQxihhMoAefWDi
8AVb0N+IMwV0H1Ma7lnlW2Y71FrY/dVLYbE6wurCR7LYmz1yHZ0Fz5yiT6IO
r7dW2BPFcX2Ex0+8OK3OXzgxtncNVxVbfRV/vV6daBe3clfb+73ZZTjHwHna
BaGc3ShXLtoTZndb5f+kKW7q3nScOlQmLnlM+Hd05pKp41uzG5qwpE+dVF7R
Kz+ekQka7tY8jFQoDE7ChR1+LBcCcwQ8/T+4pie86NeKDGO0NGseRSav1G/0
LJSk+hn/jm7iBDW9de/UKLhCoZAz8JrO95YiNell2G6tB5PdSdYphasS3vzT
uy9b/O2m1rv1DeWoUg=3D=3D
=3DrBzA
-----END PGP SIGNATURE-----

