Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4585C6FA8E
	for <phone-devel@archiver.kernel.org>; Thu,  2 Mar 2023 18:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjCBSND (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 2 Mar 2023 13:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjCBSNC (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 2 Mar 2023 13:13:02 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB71231D1
        for <phone-devel@vger.kernel.org>; Thu,  2 Mar 2023 10:12:59 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id x12so4405880ybt.7
        for <phone-devel@vger.kernel.org>; Thu, 02 Mar 2023 10:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=my5Rp2ScgeNAadltfdN1BBBN3oTSxseZtW+z/F++nfw=;
        b=oyabO+gAFW3VSmK38stdm+0a/WuznOZ3QoMc07Ytap1Z8P3K4GsOtvxxNK53xjYzql
         AQh+82sTAKf62LArk+871wi0XFteu7SDfWBe1chBCPfGU5aCXR4WQ25FfOyYC+ZZymFX
         9fKbQilu2Y0TN2V9Td8jYa/+UKOYMpT2l/U96NRY2AIa7t7TtiD5v6YV4xGbypYE2m1z
         6LQhEoniFs7QLVpRoNoloJ+dnJ99IWpUd9NnXLclurIiP4kgRWbmzOv5NU6p3mran05C
         VhRHJlDYjkc+NNTNQD9JWO7Htts/q35K1byzbDkjaFdD9bKsuU1Jl5Fl4EoE01MRPAf4
         gEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=my5Rp2ScgeNAadltfdN1BBBN3oTSxseZtW+z/F++nfw=;
        b=vEpkTNSP+uaVFujOnlJ/t0GGztAcB5yj0h9rbybp7vmlGRAZ8855iNuS1xA/wAC1yi
         kFn3kBM8qnBRhSoJjs5bWTftazQ+xW7jXBI83pqpQUHtAYNA055n+MuMCSmgTkEGjGTu
         9GoJseKU81n+liN5uFG5SN6tZVDbsBFR/BTxEwAwGQODE0ewD323aSigjk1WZx9lW+fX
         +z+dBFxKK0fhSPF1kp3ChJ7JVYzcXHD5GboxwkE/++lQ89lmG8OOqE+uuw8Ynb+kWltk
         8GBEJFl/01jeFNOK/PxaFtZUSegldYfIfiVnfLt+7d5GdM94HZsWwEQP/pj2OY4G/L0v
         st1g==
X-Gm-Message-State: AO0yUKUHTKCp+R8vyB2pWupr4T9LapHT2VQk78fgyNdOwfQpydQs5U0S
        hQ5IrrE19aEy39d/TGNg0l9sF/P75zAPPVpRcqfCkQ==
X-Google-Smtp-Source: AK7set9nQV1O5yVi7gd4+EWG/co5nR98/s6dYA+kHt1Tx4bt5HqOC6zDFtpHkRsep+/3835WmvCnOzmf6EZ7+K/TEx0=
X-Received: by 2002:a05:6902:50b:b0:8e2:6b58:5fe8 with SMTP id
 x11-20020a056902050b00b008e26b585fe8mr6212716ybs.10.1677780778998; Thu, 02
 Mar 2023 10:12:58 -0800 (PST)
MIME-Version: 1.0
References: <20230302123051.12440-1-a39.skl@gmail.com> <20230302123051.12440-2-a39.skl@gmail.com>
 <CAA8EJpoxtKQfmdbX+CGmri6RUf3YauxNUc1z62Xn1TczcsWhDw@mail.gmail.com>
In-Reply-To: <CAA8EJpoxtKQfmdbX+CGmri6RUf3YauxNUc1z62Xn1TczcsWhDw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 2 Mar 2023 20:12:48 +0200
Message-ID: <CAA8EJpquXEq=ppd_RahhguPHH0yMf1QoCOjxFxNTcma8qt8tbg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8956-loire: Provide rate for
 xo_board clock
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 2 Mar 2023 at 18:38, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Thu, 2 Mar 2023 at 14:31, Adam Skladowski <a39.skl@gmail.com> wrote:
> >
> > As xo_board is part of board not soc we define rates per device tree,
> > assign common 19.2Mhz rate to make consumers happy.
> >
> > Fixes: ff7f6d34ca07 ("arm64: dts: qcom: Add support for SONY Xperia X/X Compact")
> > Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
> > index 67baced639c9..085d79542e1b 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8956-sony-xperia-loire.dtsi
> > @@ -280,3 +280,7 @@ &usb_hs_phy {
> >         vdda3p3-supply = <&pm8950_l13>;
> >         status = "okay";
> >  };
> > +
> > +&xo_board {
> > +       clock-frequency = <19200000>;
>
> This doesn't seem to be board-specific. Please move it to msm8976.dtsi.

Adam pointed out the clock frequency is now thought to be a
board-specific thing.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
