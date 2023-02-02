Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61205C636D7
	for <phone-devel@archiver.kernel.org>; Thu,  2 Feb 2023 13:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbjBBNkm (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 2 Feb 2023 08:40:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232504AbjBBNkU (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 2 Feb 2023 08:40:20 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230138BDF7
        for <phone-devel@vger.kernel.org>; Thu,  2 Feb 2023 05:39:53 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qw12so6078349ejc.2
        for <phone-devel@vger.kernel.org>; Thu, 02 Feb 2023 05:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOv+O6zRmUrFD0uKzmPzZGG2FDBXrF4XdsrfBoPTGUc=;
        b=vUMM47jh0Hn9jMq8XlmIzznROp5tNj9M3E20EBCXzDNdfg9tpxaCSxZyaoYuXBhwNd
         mUawpVXDLMf2rtZ6Nr3J34EhpCLC3K0I9qqmpz7gkVwEAOB0baBD9jyPCy+hDJUuVYsl
         BEQGLxmZjhJs/v725olxhp1yKzQI552zwBnwwDxeYoRb4OxcFBR+VuMyBfL7mW9CRflE
         grbBMYas0CAfDkpNJVd8DEjsRXBhgTSuBsnlWHGMhIa+nzJv0VFiHm3e+aHaUruapgGe
         pcobfm23HQtYahng4IIdF/kSh+YPSvCbacEf7gS1jys91UhfHT22/iC2m0BEZJ699hWw
         mTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nOv+O6zRmUrFD0uKzmPzZGG2FDBXrF4XdsrfBoPTGUc=;
        b=Gw7gR1DI/IXdIfnZEgDNlOyxdNfvl4abGGBPBl0kPQeXXSqnQVur/cyud4Q1XFil6u
         vcL03l+gk+DV2M1uJO23xoBHFqpk48jgQSjMXUVhntHpVPQ2/k0ifqr81in8OEWT7AKG
         UXJ0gcSVs+1l6q/JmDI9nPeW9qcfpXGclzEh5VxjVpgaLG5kSvH/LtitHQQhATakXGas
         xglw9irTtFb8ip4CM3EYs2l59GQf+0u0nAN39Ort5ZCYxd8Kv8lRVLW+VVOIT19SVssD
         saFaCsq6HYSl+RiNqNCeujM5W1WNpIlxF7iWMLEwAhNosNd4lYkijjyRiXgsmrdgCuqh
         5KPQ==
X-Gm-Message-State: AO0yUKXmSAs5S7JfKF1q29uiBUD8Bit7tmfTZt6yvi3mpc8r6kYuDE0w
        zUDrAkhvZIoDJIxDCwf6pG735A==
X-Google-Smtp-Source: AK7set/ZxyMyyz9Bp5PIVV1qOJD6NYAU1bwFe+AQzAg2Sq4F7skPhJ6Yj0Rjrcdg9Z/iWxC6+aI05A==
X-Received: by 2002:a17:907:3f9b:b0:7b2:757a:1411 with SMTP id hr27-20020a1709073f9b00b007b2757a1411mr2338440ejc.9.1675345189464;
        Thu, 02 Feb 2023 05:39:49 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709061c8a00b0088c224bf5b5sm4302204ejh.148.2023.02.02.05.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 05:39:49 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 02 Feb 2023 14:39:48 +0100
Message-Id: <CQ84AYQ4TTU1.JLLJCL8OFCFQ@otso>
Cc:     "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        "Johan Hovold" <johan+linaro@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/3] Add USB/DP combo PHY config for SM6350
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Vinod Koul" <vkoul@kernel.org>
X-Mailer: aerc 0.14.0
References: <20230120-sm6350-usbphy-v4-0-4d700a90ba16@fairphone.com>
 <Y9u4cAK+uKXuu+uL@matsya>
In-Reply-To: <Y9u4cAK+uKXuu+uL@matsya>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu Feb 2, 2023 at 2:19 PM CET, Vinod Koul wrote:
> On 23-01-23, 14:29, Luca Weiss wrote:
> > While this patchset started out as just adding a dedicated init sequenc=
e
> > for SM6350 since USB PHY init didn't work in some cases, now it's also
> > migrating the phy config and dts over to a new format.
> >=20
> > Also note, that the DP portions are pratically untested since TCPM
> > (type-C port manager) and possibly other components aren't brought up
> > yet.
>
> Applied 1-2, thanks

Thanks!

>
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>
> cover doesnt need sob :)

That comes from b4 ;)
https://b4.docs.kernel.org/

>
> > ---
> > Changes in v4:
> > - Fix dp_serdes offsets in driver, add dp_txa & dp_txb fields (as in v2=
)
> > - Fix order of resets in dtsi
> > - Link to v3: https://lore.kernel.org/r/20221130081430.67831-1-luca.wei=
ss@fairphone.com
> >=20
> > ---
> > Luca Weiss (3):
> >       dt-bindings: phy: qcom,qmp-usb3-dp: Add sm6350 compatible
> >       phy: qcom-qmp-combo: Add config for SM6350
> >       arm64: dts: qcom: sm6350: Use specific qmpphy compatible
> >=20
> >  .../phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml         |   1 +
> >  arch/arm64/boot/dts/qcom/sm6350.dtsi               |  54 +++-----
> >  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 139 +++++++++++++=
+++++++-
> >  3 files changed, 154 insertions(+), 40 deletions(-)
> > ---
> > base-commit: d514392f17fd4d386cfadde7f849d97db4ca1fb0
> > change-id: 20230120-sm6350-usbphy-87c5e3f0218e
> >=20
> > Best regards,
> > --=20
> > Luca Weiss <luca.weiss@fairphone.com>
>
> --=20
> ~Vinod

