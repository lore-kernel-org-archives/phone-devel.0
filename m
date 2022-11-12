Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C89C4167D
	for <phone-devel@archiver.kernel.org>; Sat, 12 Nov 2022 03:51:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbiKLDv5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 11 Nov 2022 22:51:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234646AbiKLDv4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 11 Nov 2022 22:51:56 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D9C2D747;
        Fri, 11 Nov 2022 19:51:55 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7AB4A62154;
        Sat, 12 Nov 2022 03:51:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269BDC4347C;
        Sat, 12 Nov 2022 03:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668225114;
        bh=mcU+pY8vTW2ys9RdXmXcJSaCF8nKqubGEp/anon6emA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ws3Rb2asvxRQeEj6YwOVuMwD2QfbzBGudl5K2mDfjc52Uv9xGN9He3illObM/itIK
         DSE4+FtGWBrNtzYHcrNzLkkPnG8efXLkl6EhhJ1oUrMTGgiiBqNU0CwjT8o1htTs6r
         6eqUyLtwJbdExmCXpmsR3XWCia9ky5Dei3SAnfUhG6sgBH7fqAXB+JuXoxhnOW0nr4
         ZMjqMc3AW1OUrZ6T/1L7B/yHUHibN3EqHdpMBMb6ESOfkHLy0gMf60KzZX6kFOoeTD
         y/dixEKHSrNklMBhNhx+GzP3UUYY3HtvCLZ41w2eXd2hdCFEOMj7uii6pCO9M1O48E
         FmH5ISQ8C0BKw==
From:   Bjorn Andersson <andersson@kernel.org>
To:     luca.weiss@fairphone.com, linux-arm-msm@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org,
        konrad.dybcio@somainline.org, agross@kernel.org,
        phone-devel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Enable SD card
Date:   Fri, 11 Nov 2022 21:51:48 -0600
Message-Id: <166822510241.978218.471352169889276371.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221110151507.53650-1-luca.weiss@fairphone.com>
References: <20221110151507.53650-1-luca.weiss@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 10 Nov 2022 16:15:06 +0100, Luca Weiss wrote:
> Fairphone 4 uses sdhc_2 for the SD card, configure the pins for it and
> enable it.
> 
> The regulators which are exclusively used for SDHCI have their maximum
> voltage decreased to what downstream sets on the consumer side, like on
> many other platforms and allowed to set the load.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sm7225-fairphone-fp4: Enable SD card
      commit: 94262a18d74b85704a025855819582b5e256c8f0

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
