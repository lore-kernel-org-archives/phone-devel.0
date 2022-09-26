Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE7DC07E9D
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 16:14:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236531AbiIZQOr (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 12:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235601AbiIZQOZ (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 12:14:25 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE619DD9A;
        Mon, 26 Sep 2022 08:03:11 -0700 (PDT)
Received: from g550jk.localnet (2a02-8388-6582-fe80-0000-0000-0000-0006.cable.dynamic.v6.surfer.at [IPv6:2a02:8388:6582:fe80::6])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id BD3B8C78D3;
        Mon, 26 Sep 2022 15:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1664204560; bh=wkbN5vNDaAVsTudzKY17LVwL1TS+OEPbh2MTMpQy+WQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=moKPycwe66MhuIZxgFI5r80qndhWjE4ey8kfOEdOqhlOra/Kh95IZGRjP2Ww4Uvq9
         Yzod6abybHAxp69zVdQo4VVfuEkepIm7j3hvZpA+N9JFmhfCYBEt5G+jAFJBBfxY0M
         4g3ar7+hlZySbuLDkEnjLXF/uPrsDw51nbrZ+VgU=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916: Align dsi phy-names with schema
Date:   Mon, 26 Sep 2022 17:02:39 +0200
Message-ID: <2253302.ElGaqSPkdT@g550jk>
In-Reply-To: <205a80be-de12-b610-eef2-e9e42179cf02@linaro.org>
References: <20220925172443.92900-1-luca@z3ntu.xyz> <20220925172443.92900-2-luca@z3ntu.xyz> <205a80be-de12-b610-eef2-e9e42179cf02@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Hi Krzysztof,

On Montag, 26. September 2022 10:53:03 CEST Krzysztof Kozlowski wrote:
> On 25/09/2022 19:24, Luca Weiss wrote:
> > Use dsi instead of dsi-phy as required by the binding.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> 
> Already sent:
> 
> https://lore.kernel.org/all/20220924090108.166934-4-dmitry.baryshkov@linaro.
> org/

This patch is phy-names property while the other patch is for node name, 
unless I'm missing something.

But as Dmitry pointed out, there's a patchset to completely remove the 
property which is also totally fine by me.

Regards
Luca

> 
> Best regards,
> Krzysztof




