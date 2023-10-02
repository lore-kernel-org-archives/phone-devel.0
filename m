Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BE8DE784A5
	for <phone-devel@archiver.kernel.org>; Mon,  2 Oct 2023 06:40:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbjJBGkS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 2 Oct 2023 02:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235457AbjJBGkR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 2 Oct 2023 02:40:17 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C9CC9B
        for <phone-devel@vger.kernel.org>; Sun,  1 Oct 2023 23:40:13 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c3d3c3db9so2131734866b.3
        for <phone-devel@vger.kernel.org>; Sun, 01 Oct 2023 23:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1696228812; x=1696833612; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zc23Ml6s281iYcprl/tAvfX+YAKmlfawnLlUSvbGAsw=;
        b=a9aI1P6cq7Ijpu1/FDHEklBYUmNXr3T7UGImQIyyMhbvVWCeILBsLX9eY2XXb5fODg
         SWFxzRH3i+ycc50g9+QEai8wNguZm4zAcd/B9O/zvggFkSfphnAyF++6s0+CavagEX5g
         6knrqzB9C9ZpvZ3ReACWO7yhli9cpAC5cotlYOqprWqUzqfo5yrNH0giZ2VOlzAULXj9
         UFgksZzSmzZVXnu81TfwhF40BXOZqd12vn7xJOyNXnj15glQpsgVbTiOW51lePFRCXty
         elzJs4CadfuzxGUaUqk3Mu7TqdNrIfduy8PdqQeHgpNVrHl2+C/QNxhQZbjG+QRQtlqp
         mtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696228812; x=1696833612;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zc23Ml6s281iYcprl/tAvfX+YAKmlfawnLlUSvbGAsw=;
        b=eWyTPTm03RBAqqawhA/vY9fj6J8wVWJvjF/eLoqRTC87fBWdtTg7Rd9dNM6w4geCqc
         e4g4wuNFwA1HWe5pUB+ECQ7PceyDNYlQ8XcPj+OW0qktZD9IrDFM7vElprDCtHwYDZ6U
         EBICiLi+Ejdk2ghyJsRWB93DGfDDlniC5HMBnzsYnPkUv4+b4LHo7SJHsf+K/vUQq1Iv
         yKLX3BMSgRrIlk8mq2tSSq2mpzff1h2vthIsvYUeBEqerfaO+CZa0yH9tEYVK29gHgft
         bh2/iXbdBF5zmPCxmHMhozCEDuRWKlZDPDB4zQIKaVvWnltwDDzxBmviAqnCOvUS5xbH
         fz/w==
X-Gm-Message-State: AOJu0Yz/ADq5zL2ES8u5XjHEhSXifZToNKpZHlKtHqcDV7j3cBn2ABYb
        Wnj6KWRliM0+/ys2RY2jwalrHA==
X-Google-Smtp-Source: AGHT+IEbfMSd1KQGutXy0/VQkgg3rL0bTo/Rz41LYjg+kFwRNU61ZSgXer1jAT8aCtRG/RaEmdxrSw==
X-Received: by 2002:a17:906:311b:b0:9a2:28dc:4168 with SMTP id 27-20020a170906311b00b009a228dc4168mr8602028ejx.61.1696228811729;
        Sun, 01 Oct 2023 23:40:11 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id kg28-20020a17090776fc00b0099b921de301sm16491457ejc.159.2023.10.01.23.40.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Oct 2023 23:40:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 02 Oct 2023 08:40:10 +0200
Message-Id: <CVXQXI5E053J.386OVO28LNSYT@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,spmi-pmic: Update gpio
 example
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Conor Dooley" <conor+dt@kernel.org>,
        "Stephen Boyd" <sboyd@kernel.org>
X-Mailer: aerc 0.15.2
References: <20230929-pm7250b-gpio-fixup-v1-0-ef68543c1d3b@fairphone.com>
 <20230929-pm7250b-gpio-fixup-v1-1-ef68543c1d3b@fairphone.com>
 <510d6407-8033-4f2e-aabf-bd3fb84875a9@linaro.org>
In-Reply-To: <510d6407-8033-4f2e-aabf-bd3fb84875a9@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Sat Sep 30, 2023 at 5:06 PM CEST, Krzysztof Kozlowski wrote:
> On 29/09/2023 10:17, Luca Weiss wrote:
> > As per commit ea25d61b448a ("arm64: dts: qcom: Use plural _gpios node
> > label for PMIC gpios") all dts files now use the plural _gpios instead
> > of the singular _gpio as label. Update the schema example also to match=
.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml =
b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > index 55e931ba5b47..e4842e1fbd65 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > @@ -245,7 +245,7 @@ examples:
> >              #address-cells =3D <1>;
> >              #size-cells =3D <0>;
> > =20
> > -            pmi8998_gpio: gpio@c000 {
> > +            pmi8998_gpios: gpio@c000=20
>
> This does no=C2=A0make sense... you update label only here, but not in an=
y
> user of it which proves that label is not used. If it is not used, it
> should be dropped, not changed...

Okay, I will drop the label instead of updating it in v2.

Regards
Luca

>
> Best regards,
> Krzysztof

