Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7353AC38A23
	for <phone-devel@archiver.kernel.org>; Fri, 20 Jan 2023 14:20:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbjATOUZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 20 Jan 2023 09:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231359AbjATOUN (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 20 Jan 2023 09:20:13 -0500
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23C5B56EED
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 06:19:35 -0800 (PST)
Received: by mail-ej1-f46.google.com with SMTP id qx13so14193438ejb.13
        for <phone-devel@vger.kernel.org>; Fri, 20 Jan 2023 06:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilLx6O6YT20nFcUZQCZceyzwkMlq9jdKRHFVcmAsl2w=;
        b=ayEpP7xMy4TXl7+XiO8ro4Txa0MJS/99a9JhC3ahSwucSr+pp8+JT7uj14K3WxO9Nb
         RIc5SGeLH1XIKcd+7X4Qcl/YIMwm+VApTHcgrQdFJw8ZP24HqoAMJkxdYH2SeOdQ7XIk
         nkouY/TYeIKfYx7l6/RoZknFBPgPe+9Lub3HncGUaPxnM0IFo3L4BrrRmi5mm9z62LID
         ZatLCWTGQ2w0EiSGU4HJCXi0B++LXBaZCcsJrVSL0SqwNLmBepU+2VIp0+kpZI0P+qwU
         xay2fhZ6JGajmJVUIRxTvYn5cnBBa5kn6gIZ98wCC9K6UC8lhr2FCWuAoqD4ixPId8kd
         2uvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ilLx6O6YT20nFcUZQCZceyzwkMlq9jdKRHFVcmAsl2w=;
        b=eVfmvLdE/l3ElrTConrsXb7Rjg2XXwWaZjf2RhbjrvAWI3bpk39RasKbVBlQtWVFmB
         YyDcK0QVJGJ3JUYMtAxX/5zrwEVhVxy318MsDfdAPyK3co6nCaL4zpbwzRHxVoHqrMCQ
         T8grQqoHpb7RH2aK5C+bCDytzByiIHopMlF/6Rogr8o+sGG10TkvvoQ7yYalsfqWFtKm
         NIGzPKTJ/YQS5ij1XX8pBz0nrltpt/Kj0KbIChSGgJHRNJ70540Xc0f7MpcgQP5N+AO/
         71hwNc2II6X1lGuq3bp2fo/k18tuv1V3W7knCYDTtiZzS0n6jnBOYMLO97HvIDbGEXL1
         0HEA==
X-Gm-Message-State: AFqh2krb4jFoi4+ZiwCkJPoX7Uxk3vhqeJ8Wmd729Fw7e3R7XLmQh2u+
        eaA3Cg1fanxIe/ix5p8U5f4dKA==
X-Google-Smtp-Source: AMrXdXtSS2bkT3pSmtQPIneqvBLkh4z0QahUWsvsrzmDs10I/OhZz7loxD1lwHY6/y7aklLQNAsNlA==
X-Received: by 2002:a17:906:eb13:b0:869:236c:ac43 with SMTP id mb19-20020a170906eb1300b00869236cac43mr15283207ejb.32.1674224027081;
        Fri, 20 Jan 2023 06:13:47 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id y20-20020a170906559400b0084d44bff4a2sm15840508ejp.39.2023.01.20.06.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 06:13:46 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 20 Jan 2023 15:13:46 +0100
Message-Id: <CPX2VVT5EUDV.2LH6VI2586F02@otso>
Subject: Re: [PATCH v3 2/3] phy: qcom-qmp-combo: Add config for SM6350
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc:     "Vinod Koul" <vkoul@kernel.org>, "Johan Hovold" <johan@kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Kishon Vijay Abraham I" <kishon@kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20221130081430.67831-1-luca.weiss@fairphone.com>
 <20221130081430.67831-2-luca.weiss@fairphone.com>
 <Y6xP4YRAp68TfxFi@hovoldconsulting.com> <Y8BIX+js1ircJyb9@matsya>
 <cf968a25-02f7-d402-530b-eb379b707e54@linaro.org>
 <CPR2LS3SJQ3I.Z7UY505COG3@otso>
 <CAA8EJpoOMMALHz7ysft6KvQaYhGWPD+xZiUjOTrC8CA_y81n-w@mail.gmail.com>
In-Reply-To: <CAA8EJpoOMMALHz7ysft6KvQaYhGWPD+xZiUjOTrC8CA_y81n-w@mail.gmail.com>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri Jan 13, 2023 at 2:01 PM CET, Dmitry Baryshkov wrote:
> On Fri, 13 Jan 2023 at 14:44, Luca Weiss <luca.weiss@fairphone.com> wrote=
:
> >
> > Hi Dmitry,
> >
> > On Thu Jan 12, 2023 at 8:33 PM CET, Dmitry Baryshkov wrote:
> > > On 12/01/2023 19:50, Vinod Koul wrote:
> > > > On 28-12-22, 15:17, Johan Hovold wrote:
> > > >> Luca, Vinod,
> > > >>
> > > >> On Wed, Nov 30, 2022 at 09:14:28AM +0100, Luca Weiss wrote:
> > > >>> Add the tables and config for the combo phy found on SM6350.
> > > >>>
> > > >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > > >>> ---
> > > >>> Changes since v2:
> > > >>> * Drop dp_txa/dp_txb changes, not required
> > > >>> * Fix dp_dp_phy offset
> > > >>>
> > > >>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 126 +++++++++++++++=
+++++++
> > > >>>   1 file changed, 126 insertions(+)
> > > >>>
> > > >>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/=
phy/qualcomm/phy-qcom-qmp-combo.c
> > > >>> index 77052c66cf70..6ac0c68269dc 100644
> > > >>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > >>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > > >>
> > > >>> @@ -975,6 +1039,19 @@ static const char * const sc7180_usb3phy_re=
set_l[] =3D {
> > > >>>           "phy",
> > > >>>   };
> > > >>>
> > > >>> +static const struct qmp_combo_offsets qmp_combo_offsets_v3 =3D {
> > > >>> + .com            =3D 0x0000,
> > > >>> + .txa            =3D 0x1200,
> > > >>> + .rxa            =3D 0x1400,
> > > >>> + .txb            =3D 0x1600,
> > > >>> + .rxb            =3D 0x1800,
> > > >>> + .usb3_serdes    =3D 0x1000,
> > > >>> + .usb3_pcs_misc  =3D 0x1a00,
> > > >>> + .usb3_pcs       =3D 0x1c00,
> > > >>> + .dp_serdes      =3D 0x1000,
> > > >>
> > > >> I would have expected this to be 0x2000 as that's what the older
> > > >> platforms have been using for the dp serdes table so far. Without =
access
> > > >> to any documentation it's hard to tell whether everyone's just bee=
n
> > > >> cargo-culting all along or if there's actually something there at =
offset
> > > >> 0x2000.
> > >
> > > usb3_serdes is 0x1000, so dp_serdes equal to 0x1000 is definitely an =
typo.
> > >
> > > Judging from the downstream dtsi, the DP PHY starts at offset 0x2000.=
 So
> > > dp_serdes is equal to 0x2000, dp_phy =3D 0x2a00, ln_tx1 =3D 0x2200, l=
n_tx2 =3D
> > > 0x2600.
> >
> > Can you share how you got to the 0x2000 offset? You can see my
> > (potentially wrong) reasoning for 0x1000 a few messages ago[0].
> >
> > The only 0x2000-something I could find now while looking at it again is
> > "#define USB3_DP_PHY_DP_DP_PHY_PD_CTL 0x2a18" which becomes
> > USB3_DP_DP_PHY_PD_CTL in the driver but this is seemingly not used at
> > all in my msm-4.19 tree.
>
> Quite simple: see [1]. DP_PLL is at +0x2000
>
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/h=
eads/android-msm-bramble-4.19-android11-qpr1/qcom/lagoon-sde-pll.dtsi#27

I still disagree from what I see.

E.g. this part of the dp_serdes init table in mainline:

static const struct qmp_phy_init_tbl qmp_v3_dp_serdes_tbl_rbr[] =3D {
	QMP_PHY_INIT_CFG(QSERDES_V3_COM_HSCLK_SEL, 0x0c),

With this one:
#define QSERDES_V3_COM_HSCLK_SEL                     0x13c

To write this config qmp->dp_serdes gets used which is set at:
	qmp->dp_serdes =3D base + offs->dp_serdes;

So if offs->dp_serdes is 0x2000, this write will go to 0x213c.

If we go back to msm-4.19 downstream the equivalent define is
#define USB3_DP_QSERDES_COM_HSCLK_SEL				0x113c

So there we are at offset 0x1000. And this define is used in
qcom,qmp-phy-init-seq which I already went to in detail in a previous
email in this thread.

>
> Anyway, having DP serdes at the space as USB3 serdes would mean that
> one would be setting USB3 PLL when trying to enable DP. So I could
> have said even w/o looking at the dtsi that dp serdes can _not_ be at
> 0x1000.

I don't know enough about these PHY/DP/etc blocks to say anything there.

>
> >
> > Also if you have any idea on how to test it at runtime without actually
> > having to get all the type-C functionality up I'd be happy to try that.
> > Unfortunately I believe there's still quite some bits missing to
> > actually get DP out via the USB-C port - which I imagine would trigger
> > the PHY setup.
>
> Unfortunately, I don't have a recipe to test this.

No worries :)

Regards
Luca

>
> >
> > [0] https://lore.kernel.org/linux-arm-msm/CPDIYQ3SSY3E.I0Y0NMIED0WO@ots=
o/
> >
> > Regards
> > Luca
>
>
> --=20
> With best wishes
> Dmitry

