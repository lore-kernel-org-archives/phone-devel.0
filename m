Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C915FC77B7C
	for <phone-devel@archiver.kernel.org>; Tue,  9 May 2023 16:45:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbjEIQpX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 9 May 2023 12:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbjEIQpW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 9 May 2023 12:45:22 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 814A81BD3;
        Tue,  9 May 2023 09:45:21 -0700 (PDT)
Received: from g550jk.localnet (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id D871ACED0E;
        Tue,  9 May 2023 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=z3ntu.xyz; s=z3ntu;
        t=1683650690; bh=6jShHaL5Bxrkqcx7amecTm8ijF8yqLIpR690Y68mxYA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=oY6birehiAO16hvkqDpR9EjJcuBAJMudXoAQD6T0CrXuusB10+hfH9dYFb0pOhtVY
         zql0oo+JWog3pmO8EJuYL+tCbQuggxUhgUM88KsEue4K3/UEGXjRuX2EgCHuE/EyjT
         kHchJcZ2u2vutda8g3egxFLyMNuVsTrl8sA6qnHw=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Brian Masney <masneyb@onstation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: sram: qcom,ocmem: Add msm8226 support
Date:   Tue, 09 May 2023 18:44:49 +0200
Message-ID: <2449951.tdWV9SEqCh@z3ntu.xyz>
In-Reply-To: <29d1d210-8752-56b4-34be-8b078c639d36@linaro.org>
References: <20230506-msm8226-ocmem-v1-0-3e24e2724f01@z3ntu.xyz>
 <20230506-msm8226-ocmem-v1-4-3e24e2724f01@z3ntu.xyz>
 <29d1d210-8752-56b4-34be-8b078c639d36@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Montag, 8. Mai 2023 09:39:22 CEST Konrad Dybcio wrote:
> On 7.05.2023 11:12, Luca Weiss wrote:
> > Add the compatible for the OCMEM found on msm8226 which compared to
> > msm8974 only has a core clock and no iface clock.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >  Documentation/devicetree/bindings/sram/qcom,ocmem.yaml | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> > b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml index
> > 4bbf6db0b6bd..515f0d8ec641 100644
> > --- a/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> > +++ b/Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
> > @@ -15,7 +15,9 @@ description: |
> > 
> >  properties:
> >    compatible:
> > -    const: qcom,msm8974-ocmem
> > +    enum:
> > +      - qcom,msm8226-ocmem
> > +      - qcom,msm8974-ocmem
> 
> Any chance you could read the revision field on both and add comments
> like:
> 
> - qcom,msm8974-ocmem # vX.Y

Do you mean the OCMEM_REG_HW_VERSION register? It's currently not read in the 
driver so no idea what the value is - without adding some code.

> 
> >    reg:
> >      items:
> > @@ -28,11 +30,13 @@ properties:
> >        - const: mem
> >    
> >    clocks:
> > +    minItems: 1
> > 
> >      items:
> >        - description: Core clock
> >        - description: Interface clock
> 
> allOf: if: properties: compatible: 8974 / then: clock(s|-names): minItems: 2

Sure, can update

> 
> Konrad
> 
> >    clock-names:
> > +    minItems: 1
> > 
> >      items:
> >        - const: core
> >        - const: iface




