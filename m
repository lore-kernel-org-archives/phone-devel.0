Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A60C61DB3
	for <phone-devel@archiver.kernel.org>; Fri, 13 Jan 2023 13:14:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240865AbjAMNOY (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 13 Jan 2023 08:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241321AbjAMNNr (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 13 Jan 2023 08:13:47 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 044CE87F13
        for <phone-devel@vger.kernel.org>; Fri, 13 Jan 2023 05:01:54 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4a263c4ddbaso283662697b3.0
        for <phone-devel@vger.kernel.org>; Fri, 13 Jan 2023 05:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eGYWQmNHYzBdoQRygVglKx5yAwCnlfXDS08gHugHenM=;
        b=QMHQpYbG1zxr3p3UKJ+wgp+CpyAGbvXD5qnPCovIbUovAAHioJ31d7eksVwBcNhbDM
         Vy+AclT+9o3C6V3i9n/BCuW9Nf/KbvnR3/lnyzd3xueCE96WMzArNSKsxfW2myhj3sDj
         V4CPuIHuwgp2SGpf2TuT+pI1AwrUVzpuGlBnC2QPMfEkxtuJ3dBWEDryZkx6XIAjmKNq
         qPIri36oDxH+gqeoQZw8u3MzLVfLLQQg7LUa78WmNZ6D6my8+UgtGM4cjfb2qgLfXjKu
         7IYgaFC604WKwUE7jb+GGSQ0j/EGcekLMysgir6AElQ7zexJCvbqt/M8mbI4+APGTJva
         SobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eGYWQmNHYzBdoQRygVglKx5yAwCnlfXDS08gHugHenM=;
        b=W6pRMFuBFTZFe8QYuhqnTUVavEbNhS/7dNsx+NDb21xRukhb7tECqws2n3wlNZNqnk
         A2XvGfRFjGJaFjjPMuheUZcRQ1u72A/7KkIhtZ+j3Z/qa7RDgrIi2LRjHA44fv/8nXP5
         O6opWdT2yqyx+TXCPSUWycxQWd/3W9yae3Gxo31tiIfgfKiHUpNLxHlUzK6LPynkfy9R
         btlOBGho2/zqDQwj2Juuz+jX8yxrEIuxi5WaiCPsEdvctIv2REEhZE1wHZDFatXVC/Ww
         NW4Gg5DhaZypI0uNPJHYJJcqTD+BZM53S5fes8zboOJzkPdzbTRJ1pHJmL/br/mIVZZT
         dYPQ==
X-Gm-Message-State: AFqh2kq1OnbxJxHsM+HBOv22Awh6lqe0MwVp9/u3z3CHuhOKXppmCD37
        9fQ3oupiwJpRkQHPfwZ6QnwpoGKAAwb8+2MTAQT3Tw==
X-Google-Smtp-Source: AMrXdXsddOWoGnFZQINZnkBaGOB3nb1k2Yj3MDGckb0nfDcLAZ4K2UfHWcQKNw3CEaoMTFNvm5Ci0yiwpQSZqrZAhZ4=
X-Received: by 2002:a0d:e3c3:0:b0:432:2458:f6ca with SMTP id
 m186-20020a0de3c3000000b004322458f6camr3760074ywe.138.1673614912824; Fri, 13
 Jan 2023 05:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20221130081430.67831-1-luca.weiss@fairphone.com>
 <20221130081430.67831-2-luca.weiss@fairphone.com> <Y6xP4YRAp68TfxFi@hovoldconsulting.com>
 <Y8BIX+js1ircJyb9@matsya> <cf968a25-02f7-d402-530b-eb379b707e54@linaro.org> <CPR2LS3SJQ3I.Z7UY505COG3@otso>
In-Reply-To: <CPR2LS3SJQ3I.Z7UY505COG3@otso>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 13 Jan 2023 15:01:41 +0200
Message-ID: <CAA8EJpoOMMALHz7ysft6KvQaYhGWPD+xZiUjOTrC8CA_y81n-w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] phy: qcom-qmp-combo: Add config for SM6350
To:     Luca Weiss <luca.weiss@fairphone.com>
Cc:     Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, 13 Jan 2023 at 14:44, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Hi Dmitry,
>
> On Thu Jan 12, 2023 at 8:33 PM CET, Dmitry Baryshkov wrote:
> > On 12/01/2023 19:50, Vinod Koul wrote:
> > > On 28-12-22, 15:17, Johan Hovold wrote:
> > >> Luca, Vinod,
> > >>
> > >> On Wed, Nov 30, 2022 at 09:14:28AM +0100, Luca Weiss wrote:
> > >>> Add the tables and config for the combo phy found on SM6350.
> > >>>
> > >>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > >>> ---
> > >>> Changes since v2:
> > >>> * Drop dp_txa/dp_txb changes, not required
> > >>> * Fix dp_dp_phy offset
> > >>>
> > >>>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 126 ++++++++++++++++++++++
> > >>>   1 file changed, 126 insertions(+)
> > >>>
> > >>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > >>> index 77052c66cf70..6ac0c68269dc 100644
> > >>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > >>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > >>
> > >>> @@ -975,6 +1039,19 @@ static const char * const sc7180_usb3phy_reset_l[] = {
> > >>>           "phy",
> > >>>   };
> > >>>
> > >>> +static const struct qmp_combo_offsets qmp_combo_offsets_v3 = {
> > >>> + .com            = 0x0000,
> > >>> + .txa            = 0x1200,
> > >>> + .rxa            = 0x1400,
> > >>> + .txb            = 0x1600,
> > >>> + .rxb            = 0x1800,
> > >>> + .usb3_serdes    = 0x1000,
> > >>> + .usb3_pcs_misc  = 0x1a00,
> > >>> + .usb3_pcs       = 0x1c00,
> > >>> + .dp_serdes      = 0x1000,
> > >>
> > >> I would have expected this to be 0x2000 as that's what the older
> > >> platforms have been using for the dp serdes table so far. Without access
> > >> to any documentation it's hard to tell whether everyone's just been
> > >> cargo-culting all along or if there's actually something there at offset
> > >> 0x2000.
> >
> > usb3_serdes is 0x1000, so dp_serdes equal to 0x1000 is definitely an typo.
> >
> > Judging from the downstream dtsi, the DP PHY starts at offset 0x2000. So
> > dp_serdes is equal to 0x2000, dp_phy = 0x2a00, ln_tx1 = 0x2200, ln_tx2 =
> > 0x2600.
>
> Can you share how you got to the 0x2000 offset? You can see my
> (potentially wrong) reasoning for 0x1000 a few messages ago[0].
>
> The only 0x2000-something I could find now while looking at it again is
> "#define USB3_DP_PHY_DP_DP_PHY_PD_CTL 0x2a18" which becomes
> USB3_DP_DP_PHY_PD_CTL in the driver but this is seemingly not used at
> all in my msm-4.19 tree.

Quite simple: see [1]. DP_PLL is at +0x2000

[1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/lagoon-sde-pll.dtsi#27

Anyway, having DP serdes at the space as USB3 serdes would mean that
one would be setting USB3 PLL when trying to enable DP. So I could
have said even w/o looking at the dtsi that dp serdes can _not_ be at
0x1000.

>
> Also if you have any idea on how to test it at runtime without actually
> having to get all the type-C functionality up I'd be happy to try that.
> Unfortunately I believe there's still quite some bits missing to
> actually get DP out via the USB-C port - which I imagine would trigger
> the PHY setup.

Unfortunately, I don't have a recipe to test this.

>
> [0] https://lore.kernel.org/linux-arm-msm/CPDIYQ3SSY3E.I0Y0NMIED0WO@otso/
>
> Regards
> Luca


-- 
With best wishes
Dmitry
