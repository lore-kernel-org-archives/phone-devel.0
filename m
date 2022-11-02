Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FEDC43217
	for <phone-devel@archiver.kernel.org>; Wed,  2 Nov 2022 15:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbiKBPnq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 2 Nov 2022 11:43:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230362AbiKBPnS (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 2 Nov 2022 11:43:18 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBB8128E37;
        Wed,  2 Nov 2022 08:43:17 -0700 (PDT)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 1E4A1D040B;
        Wed,  2 Nov 2022 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1667403796; bh=Sa2yu283C843xl42uAUnQlOf6ITnpV7J7s5FQx4YUkc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=eCff1frAp3+BeQwABbYel+x2rxO1LUeMt3rqr0Wy0Ze4plmfx4GPCBgMVWCE2Sjbc
         3gDT1J7DGg057LD1cPOykmHhsQbS0GvlVAGusT4pMTiXm2odcclP8nHaA/XDXlhija
         +7vvdjoOhNFsUNgWB1/my02arVLQjwNEY0JOqSG8=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org, neil.armstrong@linaro.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        afd@ti.com, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Das Srinagesh <gurus@codeaurora.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] bindings: pm8941-misc: rename misc node name
Date:   Wed, 02 Nov 2022 16:43:14 +0100
Message-ID: <8135515.T7Z3S40VBb@g550jk>
In-Reply-To: <028adb9d-e8e7-33db-2aae-028a809a061a@linaro.org>
References: <20221031175717.942237-1-luca@z3ntu.xyz> <20221031175717.942237-2-luca@z3ntu.xyz> <028adb9d-e8e7-33db-2aae-028a809a061a@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Neil,

On Mittwoch, 2. November 2022 11:35:55 CET Neil Armstrong wrote:
> Hi,
> 
> On 31/10/2022 18:57, Luca Weiss wrote:
> > The spmi-pmic bindings is now using usb-detect@ for this node, so adjust
> > the example to match.
> 
> Subject should be:
> dt-bindings: pm8941-misc: rename misc node name
> instead of:
> bindings: pm8941-misc: rename misc node name

Also here I've followed the style of the previous commits to this file

4fcdd677c4ea bindings: pm8941-misc: Add support for VBUS detection
dd6f5afb1c2d bindings: pm8941-misc: Convert bindings to YAML

Though it seems other commits in this directory recently have used
"dt-bindings: extcon: " prefix. Do you still want me to change it?

Regards
Luca

> 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >   Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> > b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml index
> > 6a9c96f0352a..fbda899fd260 100644
> > --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> > +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> > 
> > @@ -49,7 +49,7 @@ examples:
> >               interrupt-controller;
> >               #interrupt-cells = <4>;
> > 
> > -            usb_id: misc@900 {
> > +            usb_id: usb-detect@900 {
> > 
> >                       compatible = "qcom,pm8941-misc";
> >                       reg = <0x900>;
> >                       interrupts = <0x0 0x9 0 IRQ_TYPE_EDGE_BOTH>;
> 
> With subject fixed:
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>




