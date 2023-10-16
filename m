Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89113C46CA1
	for <phone-devel@archiver.kernel.org>; Mon, 16 Oct 2023 06:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbjJPG4i (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 16 Oct 2023 02:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjJPG4h (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 16 Oct 2023 02:56:37 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB89BC5
        for <phone-devel@vger.kernel.org>; Sun, 15 Oct 2023 23:56:34 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53db1fbee70so6912327a12.2
        for <phone-devel@vger.kernel.org>; Sun, 15 Oct 2023 23:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697439393; x=1698044193; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mIKLA6FpZ/tBtyGW8aEqqSCm4XNwQ5xgOuHWuH9vZ2k=;
        b=dgRfnslNP51vNXEBXGgtzViY1hDiPbXcKH64h7XpGd2FwvdfiieKiXj2Un7gGdAqaS
         vkf+PE4FVGGosfPy5hch0EvkIlg3kyiDxEJGXGcELmoVjLGT1hQECaV3S7l7EqPs7zOm
         WcDN2Sp5JxEOVuNkGPGs6EKj36ZvUwwzl7Bsh1qMMPrNhmakFTa882lmPmFSiRYK340y
         45GsM8AeebGFyl9Jduy876Nsox2zOZvTRAomequZ49LdZxyErIrbbxlndnUlN5h/gAfU
         rZoyD3vRjFlJNJtFFxDyeLMF2BamnuReJ7LskSGhVLkIRx52MuxyUC6EIA6QTUy0NAzh
         5csA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697439393; x=1698044193;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mIKLA6FpZ/tBtyGW8aEqqSCm4XNwQ5xgOuHWuH9vZ2k=;
        b=EosOPhkoblyS+UkSVoTG9V48eY0cg9Pnp/I+ZFAweNExMU+EeRxu6wLjONKnd6bA/k
         zFIfbBWeRHOZdmxjWDasoDf/2iY3iGaUDssR45Cmt4KWrKXK+pQH1iZXwtSPwqcLp5uH
         vGSk4vp0uKj8qjyiPZrRh0GBQNnalPBuqV24X2R9+qwMONGb/32Hbq75N7h6KKUnbQgk
         wZRyyAkOLIphhoic+uzzN0uyq6Q979OJMUBNyciJfMDaECDqMs2YnlQVsC+jB+DcBoHz
         6klLoRsJwJbWJUBwRCtICBYtdN00DhqlY2N1nhnHmJCaIg2pgjR8xuzm/bgoyxa+zE2G
         jYNA==
X-Gm-Message-State: AOJu0YwXVNJ1CTO6WSj5zxeN3uUEKfrTJJ2VdmY2vDmmPSWetEKo+oae
        7SyIxdyMxGB2W8VQwBfkoG/17RA3r5a8r3UXQ/rxxQ==
X-Google-Smtp-Source: AGHT+IEso5kuLZbg9p8FT8lVYXeK62hYjaBJ2yzw2VF1TjF8zIDcesabpryDe3mRe4T/YBqRFzY95Q==
X-Received: by 2002:a17:907:3da5:b0:9bd:d961:ddea with SMTP id he37-20020a1709073da500b009bdd961ddeamr6901803ejc.45.1697439393118;
        Sun, 15 Oct 2023 23:56:33 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id e3-20020a1709062c0300b0099bcf1c07c6sm3389234ejh.138.2023.10.15.23.56.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Oct 2023 23:56:32 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Mon, 16 Oct 2023 08:56:31 +0200
Message-Id: <CW9O1NB1NZHP.34BW2ZGP1WV8C@fairphone.com>
Subject: Re: [PATCH] soc: qcom: pmic_glink_altmode: Print error when retimer
 setup fails
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Bjorn Andersson" <andersson@kernel.org>
Cc:     "Andy Gross" <agross@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231013-glink-altmode-ret-v1-1-77941537a35b@fairphone.com>
 <6fw7eho6rapvlghujche4k3pm5mx7a7ojx6yyyreq6dhzjfwlt@ggqoxgirpcnr>
In-Reply-To: <6fw7eho6rapvlghujche4k3pm5mx7a7ojx6yyyreq6dhzjfwlt@ggqoxgirpcnr>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon Oct 16, 2023 at 5:18 AM CEST, Bjorn Andersson wrote:
> On Fri, Oct 13, 2023 at 03:56:40PM +0200, Luca Weiss wrote:
> > It can be useful to know with which return value the retimer_set call
> > failed, so include this info in the dev_err print.
> >=20
>
> Is this useful during development, or during normal execution etc. How
> about using kretprobe or similar tools?

Hi Bjorn,

IIRC I encountered this during development of my retimer driver, where
the op in that driver failed for some reason and it was very useful to
get the return value to debug that.

And sure, I guess kretprobe might be also useful here but I think it's
very common to include the return value in the error message when
something fails, no?

> If you insist, could you please make sure that the style matches across
> the various typec_*_set() calls in the driver?

Do you mean adding the return value to the other dev_err prints after
typec_*_set() calls also?

Regards
Luca

>
> Regards,
> Bjorn
>
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/p=
mic_glink_altmode.c
> > index 9569d999391d..136713e1155e 100644
> > --- a/drivers/soc/qcom/pmic_glink_altmode.c
> > +++ b/drivers/soc/qcom/pmic_glink_altmode.c
> > @@ -168,7 +168,7 @@ static void pmic_glink_altmode_enable_dp(struct pmi=
c_glink_altmode *altmode,
> > =20
> >  	ret =3D typec_retimer_set(port->typec_retimer, &port->retimer_state);
> >  	if (ret)
> > -		dev_err(altmode->dev, "failed to setup retimer to DP\n");
> > +		dev_err(altmode->dev, "failed to setup retimer to DP: %d\n", ret);
> >  }
> > =20
> >  static void pmic_glink_altmode_enable_usb(struct pmic_glink_altmode *a=
ltmode,
> >=20
> > ---
> > base-commit: e3b18f7200f45d66f7141136c25554ac1e82009b
> > change-id: 20231013-glink-altmode-ret-3911e6c1eab5
> >=20
> > Best regards,
> > --=20
> > Luca Weiss <luca.weiss@fairphone.com>
> >=20

