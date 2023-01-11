Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C66C63797
	for <phone-devel@archiver.kernel.org>; Wed, 11 Jan 2023 19:50:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbjAKTuE (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:50:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230055AbjAKTtd (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 11 Jan 2023 14:49:33 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3ACC63A2;
        Wed, 11 Jan 2023 11:49:18 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DEFB761E0F;
        Wed, 11 Jan 2023 19:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C78DC433F0;
        Wed, 11 Jan 2023 19:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673466557;
        bh=DA4Nc+bKapvx5hk5wsKKyfg/ezLTSl7ncq060rVomaY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KtHYhmORSRoH3pSVgMEceSmN5JLCoWytUQMCwZLKg9EMyWv2/zKhPiBt0NpyQOcK0
         sER/3HuzzgmH01xdj/aWfawNNQHcgXWMePn2lIQk3y2zQZzT1wS3eFVPJgPTBfdcoZ
         ok8QEqEp+t1SYbK2+5gu/F0ExHIO6QQVA539itZ6/ejArCVi+iZdFyC2oE4xV8CR+w
         /QCKLatvjdNhslLM9q16cGOXRmMUzfCC8g6J+VTcXK3T/dlUdj/cmF6byWkKQ1UsIL
         huCHU8eY5rWO3GMErBLNrlwcVmBlvo8jS3C/tSfqJC4MrGegb7G1lydJiAFAkKf3l7
         hW25cRy9It3PQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     matti.lehtimaki@gmail.com, linux-arm-msm@vger.kernel.org
Cc:     krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, agross@kernel.org,
        devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        ~postmarketos/upstreaming@lists.sr.ht, robh+dt@kernel.org
Subject: Re: [PATCH v2] ARM: dts: qcom: apq8026-samsung-matisse-wifi: Add display backlight
Date:   Wed, 11 Jan 2023 13:49:06 -0600
Message-Id: <167346654438.2315924.6109897473857998687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20230111183502.706151-1-matti.lehtimaki@gmail.com>
References: <20230111183502.706151-1-matti.lehtimaki@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Wed, 11 Jan 2023 20:35:01 +0200, Matti Lehtimäki wrote:
> Uses ti,lp8556 backlight with clk-pwm.
> 
> 

Applied, thanks!

[1/1] ARM: dts: qcom: apq8026-samsung-matisse-wifi: Add display backlight
      commit: 5fec7cb2e3e1d469312b2870e5545a5468a10f6b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
