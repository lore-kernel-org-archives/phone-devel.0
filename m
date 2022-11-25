Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FD3C4332F
	for <phone-devel@archiver.kernel.org>; Fri, 25 Nov 2022 10:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbiKYKPG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 25 Nov 2022 05:15:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbiKYKPF (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 25 Nov 2022 05:15:05 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F7B33D919
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 02:14:56 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id i10so9260752ejg.6
        for <phone-devel@vger.kernel.org>; Fri, 25 Nov 2022 02:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ze5X8K96YfolEUWWp2wCAL1o2UJfqLaO6LuOkhe2Dy4=;
        b=3kqsMN0E75aV/kEY5vMRA5bg9o31oG86MoG8NvHZ9c4/nwFwofyI94Gu+HzALfI4EJ
         IEulqc8dsKqapsQcx2ZhwLjtFH3uaNonEI0w0S3QobW3JWovjD0sDn8RcLDqjLTy3XMQ
         GzMQP6XDaERvYJtxwFnUVnzUPXZgTe4iIpNY/07lxFwSJDP0YMo8N8wJ/OSF017SfeTp
         FAiyNKGUMtYNc4taNYr/7ZesoudRa/U7QOtcZJUAtYQt3YGYN2Ll3BMoBuatU8P3RDx5
         3Id2EUM6Ll7QSKKSF75g5r9DLgqvWTKMTuykKe+TJVBT9H7R6bCXMPewmEgnly/20owq
         p9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ze5X8K96YfolEUWWp2wCAL1o2UJfqLaO6LuOkhe2Dy4=;
        b=pxhQHd2tA7hcnUvBrunJ7xZH2ULOk+/qUhc/foDkX9dW0vQCO0RlJIo45v3o+iobkC
         tErd3hI/dqu+98PgYs/76Gnq/8MFWF/XaDtBADh12ckAsMayBuB9UFZnP4vwn5VZpzIV
         mWZyL7vz1a4BThBdV5kwo2ke+uvQQr64ZJZkq6z2vMbd8wDFSsW9Y48hv3WxVIT5bWW/
         L6pImqL2nInPl297JS+tSm0ae+FwfIJRdo5I9rLTVpuvwekNa0vuDd/MpsYwlabP8Cib
         5GSzt2Y2tAvpjjznentiZJM+R4q9wEI2JmiWOGGr4mrztApVhJxjPg23JUECPGzp5228
         2HNw==
X-Gm-Message-State: ANoB5pl4pJdKbgYKRpd2WQJFfohVWZnFBMkifEVx1J59y2z9eeIAC0x8
        9i8jmovJABkk5plSUGq4igdoKA==
X-Google-Smtp-Source: AA0mqf4675WzDMOUMScJ0UA/aMo//uxK5ar9n6RaKb/OqUwLT5aZ4pEdBMFilFPhv2GkUj2o+wxtIg==
X-Received: by 2002:a17:907:1a53:b0:7b2:b15e:86e6 with SMTP id mf19-20020a1709071a5300b007b2b15e86e6mr18620960ejc.410.1669371294644;
        Fri, 25 Nov 2022 02:14:54 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id be14-20020a0564021a2e00b00463597d2c25sm1598979edb.74.2022.11.25.02.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 02:14:54 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 25 Nov 2022 11:14:53 +0100
Message-Id: <COLAQH772WXW.P442ICY46TDR@otso>
Cc:     <linux-arm-msm@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Vinod Koul" <vkoul@kernel.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 2/3] phy: qcom-qmp-combo: Add config for SM6350
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Johan Hovold" <johan@kernel.org>
X-Mailer: aerc 0.13.0
References: <20221125092749.46073-1-luca.weiss@fairphone.com>
 <20221125092749.46073-2-luca.weiss@fairphone.com>
 <Y4CSYZE+3fZCV4Z3@hovoldconsulting.com>
In-Reply-To: <Y4CSYZE+3fZCV4Z3@hovoldconsulting.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Johan,

On Fri Nov 25, 2022 at 11:01 AM CET, Johan Hovold wrote:
> On Fri, Nov 25, 2022 at 10:27:48AM +0100, Luca Weiss wrote:
> > Add the tables and config for the combo phy found on SM6350.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> > @Johan Hovold, here I've added dp_txa & dp_txb, I believe otherwise
> > qmp->dp_tx would be wrong. Is this different on sc8280xp or was this a
> > mistake on your side? I think this should probably be split out to
> > another patch to not mix things up too much.
>
> Yeah, that's a difference in sc8280xp which does not have dedicated TX
> registers for DP.

Good to know.

>
> This is probably best handled explicitly when parsing the DT by using
> dp_txa/b if they are set and otherwise fallback to txa/txb (e.g.
> instead of hiding it in the v5 table by using the same offset in two
> places).

Are you thinking about something like this?

if (offs->dp_txa)
    qmp->dp_tx =3D base + offs->dp_txa
else
    qmp->dp_tx =3D base + offs->txa;

if (offs->dp_txb)
    qmp->dp_tx2 =3D base + offs->dp_txb;
else
    qmp->dp_tx2 =3D base + offs->txb;

This wouldn't handle ".dp_txa =3D 0x0000" but I don't think this should be
a problem, right?

>
> It can be done as part of this patch as long as you mention it in the
> commit message.

Ack.

Regards
Luca

>
> > I think other than that this patch is good.
>
> Indeed, looks good! Nice to see this working out as intended also for
> the older platforms.
>
> >  static const struct qmp_phy_init_tbl sm8150_usb3_serdes_tbl[] =3D {
> >  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_EN_CENTER, 0x01),
> >  	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SSC_PER1, 0x31),
> > @@ -809,6 +873,8 @@ struct qmp_combo_offsets {
> >  	u16 usb3_pcs;
> >  	u16 usb3_pcs_usb;
> >  	u16 dp_serdes;
> > +	u16 dp_txa;
> > +	u16 dp_txb;
> >  	u16 dp_dp_phy;
> >  };
> > =20
> > @@ -975,6 +1041,21 @@ static const char * const sc7180_usb3phy_reset_l[=
] =3D {
> >  	"phy",
> >  };
> > =20
> > +static const struct qmp_combo_offsets qmp_combo_offsets_v3 =3D {
> > +	.com		=3D 0x0000,
> > +	.txa		=3D 0x1200,
> > +	.rxa		=3D 0x1400,
> > +	.txb		=3D 0x1600,
> > +	.rxb		=3D 0x1800,
> > +	.usb3_serdes	=3D 0x1000,
> > +	.usb3_pcs_misc	=3D 0x1a00,
> > +	.usb3_pcs	=3D 0x1c00,
> > +	.dp_serdes	=3D 0x2000,
> > +	.dp_txa		=3D 0x2200,
> > +	.dp_txb		=3D 0x2600,
> > +	.dp_dp_phy	=3D 0x2c00,
> > +};
> > +
> >  static const struct qmp_combo_offsets qmp_combo_offsets_v5 =3D {
> >  	.com		=3D 0x0000,
> >  	.txa		=3D 0x0400,
>
> > @@ -2641,8 +2767,8 @@ static int qmp_combo_parse_dt(struct qmp_combo *q=
mp)
> >  	qmp->pcs_usb =3D base + offs->usb3_pcs_usb;
> > =20
> >  	qmp->dp_serdes =3D base + offs->dp_serdes;
> > -	qmp->dp_tx =3D base + offs->txa;
> > -	qmp->dp_tx2 =3D base + offs->txb;
> > +	qmp->dp_tx =3D base + offs->dp_txa;
> > +	qmp->dp_tx2 =3D base + offs->dp_txb;
> >  	qmp->dp_dp_phy =3D base + offs->dp_dp_phy;
> > =20
> >  	qmp->pipe_clk =3D devm_clk_get(dev, "usb3_pipe");
>
> Johan

