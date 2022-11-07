Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A6CC433FE
	for <phone-devel@archiver.kernel.org>; Mon,  7 Nov 2022 12:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231589AbiKGMtW (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 7 Nov 2022 07:49:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbiKGMtW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 7 Nov 2022 07:49:22 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E35193EC;
        Mon,  7 Nov 2022 04:49:20 -0800 (PST)
Received: from g550jk.localnet (unknown [10.0.11.2])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id EF07AD00BC;
        Mon,  7 Nov 2022 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1667825358; bh=Cj+KlzDdd4JzWqsSFQcDBwUA1JbTMTttCWs4Q5GW65U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=xPrXFFoOzd65kDce5ZLTVpim0AT8yAANXqQP9fi9qxxnxOT54HVanXnEvdGDrAH68
         FxEM6kM3V8pdJ2R6xz2HvESqEJypfjE34t8j5Xi+kRPmGPyBJi/ekbpyES/oCaKGCO
         Q1oBSTNm9u/NpGpiA/O9mEMbbb4wqi3FEqEkQStM=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Lee Jones <lee@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mfd: qcom,spmi-pmic: rename extcon node name
Date:   Mon, 07 Nov 2022 13:49:17 +0100
Message-ID: <5873923.lOV4Wx5bFT@g550jk>
In-Reply-To: <Y2jLAIQcthVLWU9e@google.com>
References: <20221031175717.942237-1-luca@z3ntu.xyz> <Y2jLAIQcthVLWU9e@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Montag, 7. November 2022 10:08:16 CET Lee Jones wrote:
> On Mon, 31 Oct 2022, Luca Weiss wrote:
> > extcon is a Linux-specific name and shouldn't be a part of the dts. Make
> > it be called usb-detect@ instead.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > This patch builds on top of
> > https://lore.kernel.org/linux-arm-msm/20221031173933.936147-1-luca@z3ntu.x
> > yz/ But could also be applied without, if conflicts are resolved.
> > 
> >  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> Same here.  Only 1/3 received.
> 
> Can I take this on its own?

Hi,

yes, this can be taken on its own. Perhaps it'll introduce some temporary 
dtbs_check warnings until the other patches have also made it into the tree.

Patch 2 is pm8941-misc yaml change, and patch 3 is adjusting dtsi file for the 
new name.

Lore: https://lore.kernel.org/lkml/20221031175717.942237-1-luca@z3ntu.xyz/

Regards
Luca

> 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml index
> > cf10d62ace54..14aa42057d6f 100644
> > --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > 
> > @@ -123,10 +123,6 @@ patternProperties:
> >        - $ref: /schemas/power/supply/qcom,pm8941-charger.yaml#
> >        - $ref: /schemas/power/supply/qcom,pm8941-coincell.yaml#
> > 
> > -  "extcon@[0-9a-f]+$":
> > -    type: object
> > -    $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
> > -
> > 
> >    "gpio(s)?@[0-9a-f]+$":
> >      type: object
> >      $ref: /schemas/pinctrl/qcom,pmic-gpio.yaml#
> > 
> > @@ -143,6 +139,10 @@ patternProperties:
> >      type: object
> >      $ref: /schemas/thermal/qcom,spmi-temp-alarm.yaml#
> > 
> > +  "^usb-detect@[0-9a-f]+$":
> > +    type: object
> > +    $ref: /schemas/extcon/qcom,pm8941-misc.yaml#
> > +
> > 
> >    "^usb-vbus-regulator@[0-9a-f]+$":
> >      type: object
> >      $ref: /schemas/regulator/qcom,usb-vbus-regulator.yaml#




