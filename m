Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 530E5C43217
	for <phone-devel@archiver.kernel.org>; Sat, 18 Sep 2021 23:06:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C0116113A
	for <phone-devel@archiver.kernel.org>; Sat, 18 Sep 2021 23:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240631AbhIRXHh (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sat, 18 Sep 2021 19:07:37 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:39423 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232711AbhIRXHh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sat, 18 Sep 2021 19:07:37 -0400
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DD5163E815;
        Sun, 19 Sep 2021 01:06:10 +0200 (CEST)
Date:   Sun, 19 Sep 2021 01:06:09 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] arm64: DT: qcom: msm8998: Provide missing "xo"
 and "sleep_clk" to GCC
Message-ID: <20210918230609.qbdcneew7ukwdxst@SoMainline.org>
References: <20210918143503.634920-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210918143503.634920-1-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2021-09-18 16:35:02, Marijn Suijten wrote:
> In a future patch the GCC driver will stop requesting this xo clock by
> its global "xo" name, in favour of of having an explicit phandle here in
> the DT.  Aside from that this clock in addition to the mandatory
> "sleep_clk" were never passed despite being required by the relevant
> dt-bindings.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
> Resending to directly address Rob Herring in the To: field and add
> Stephen Boyd to cc whom already queued the clk driver part in clk-next.

Apologies for the re-send noise; this patch is already going in through
the qcom tree:
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=2c2f64ae36d97c1ec756ed781640f7951f7bac42
