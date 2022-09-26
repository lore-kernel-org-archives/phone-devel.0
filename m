Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3404CC32771
	for <phone-devel@archiver.kernel.org>; Mon, 26 Sep 2022 16:12:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236192AbiIZQMh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 26 Sep 2022 12:12:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235790AbiIZQME (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 26 Sep 2022 12:12:04 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6564F13CD5;
        Mon, 26 Sep 2022 07:59:45 -0700 (PDT)
Received: from g550jk.localnet (2a02-8388-6582-fe80-0000-0000-0000-0006.cable.dynamic.v6.surfer.at [IPv6:2a02:8388:6582:fe80::6])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 9C05EC78D3;
        Mon, 26 Sep 2022 14:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1664204384; bh=iKasmECWNjdS3d9t4h+Q6/KVLrA34QuCX3jb9jKydYs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZOdnpR0hyI+/zGfN+6cXq2ls5cbZOtPuGbfwRaV1Zj9VWiO2jlDo2MuMZfq9tfBSf
         yO5gUaP0V4HSDWhsYQ84DTtI+7RbU7NLq4gVdQ/AlParHTi+3+8oFC7dgRbN3uHaLB
         AvYIGYSb3mm7eeeT9yrjuk8W9u3UpqhWdGPe/e98=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: mfd: qcom,spmi-pmic: adjust pwm node validation
Date:   Mon, 26 Sep 2022 16:59:43 +0200
Message-ID: <5604715.DvuYhMxLoT@g550jk>
In-Reply-To: <6454e34b-f9b7-257d-4717-4a880998d08f@linaro.org>
References: <20220925211744.133947-1-luca@z3ntu.xyz> <6454e34b-f9b7-257d-4717-4a880998d08f@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Montag, 26. September 2022 10:49:11 CEST Krzysztof Kozlowski wrote:
> On 25/09/2022 23:17, Luca Weiss wrote:
> > The LPG node doesn't use reg, so adjust the documentation to match that.
> > 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 8 ++++----
> 
> Already sent:
> 
> https://lore.kernel.org/all/20220828132648.3624126-2-bryan.odonoghue@linaro.
> org/

Thanks for spotting! I retract my patch then :)

Any idea who will merge the other patch then? It's been a month since sending 
and it hasn't been applied yet / not in linux-next yet.

Regards
Luca

> 
> Best regards,
> Krzysztof




