Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3CCFA3741
	for <phone-devel@archiver.kernel.org>; Mon, 31 Oct 2022 16:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbiJaQ0j (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 31 Oct 2022 12:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231745AbiJaQ0Y (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 31 Oct 2022 12:26:24 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14FC12761;
        Mon, 31 Oct 2022 09:26:21 -0700 (PDT)
Received: from g550jk.localnet (31-151-115-246.dynamic.upc.nl [31.151.115.246])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id ACCEBC6FDC;
        Mon, 31 Oct 2022 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1667233579; bh=95JUHQn52ri+8xaZUvWAgUDOFF//oBrHuFn5YIY7670=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hZ+WrpmewXHoZVv7ZA3io4ZknEzsnKJt5owEYimIbnw8fLGHFjN6nsSHTMe/GU7gs
         rXTNyjm9ZFvgof6+WbfT+q9SdJt4SwYLPRIl2BxjIvjWb+q8F0pyrMsVwIL0Cgt8ns
         ig5oTGSbdKIEbXU2qtpR9OjWFAV8ZvUG7A6vKf1U=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: qcom-iommu: Add Qualcomm MSM8953 compatible
Date:   Mon, 31 Oct 2022 17:26:19 +0100
Message-ID: <5615419.DvuYhMxLoT@g550jk>
In-Reply-To: <20221016161554.673006-2-luca@z3ntu.xyz>
References: <20221016161554.673006-1-luca@z3ntu.xyz> <20221016161554.673006-2-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi all,

On Sonntag, 16. Oktober 2022 18:15:51 CET Luca Weiss wrote:
> Document the compatible used for IOMMU on the msm8953 SoC.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> Acked-by: Rob Herring <robh@kernel.org>

Could someone please pick up this patch?

Looking at the file history, there's not much but maybe @Rob could you take 
this? Or maybe Bjorn?

Regards
Luca

> ---
> Changes since v3:
> - no changes
> 
>  Documentation/devicetree/bindings/iommu/qcom,iommu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt index
> 059139abce35..e6cecfd360eb 100644
> --- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> +++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
> @@ -10,6 +10,7 @@ to non-secure vs secure interrupt line.
>  - compatible       : Should be one of:
> 
>                          "qcom,msm8916-iommu"
> +                        "qcom,msm8953-iommu"
> 
>                       Followed by "qcom,msm-iommu-v1".




