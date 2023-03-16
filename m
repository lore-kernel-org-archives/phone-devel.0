Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FAFC6FD1D
	for <phone-devel@archiver.kernel.org>; Thu, 16 Mar 2023 03:17:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjCPDRw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 15 Mar 2023 23:17:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjCPDRv (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 15 Mar 2023 23:17:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5219696634;
        Wed, 15 Mar 2023 20:17:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A05A61EF3;
        Thu, 16 Mar 2023 03:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAECC433D2;
        Thu, 16 Mar 2023 03:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678936666;
        bh=7jLm+4L+PqAZiJaRToZ1J/xuF6GRvKMAzWASmYXWPbo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NtBaXQYQGZtPOfQY2Q+LO1ZF7WCwPj3bAIqnwRQIObDunDRZTIloAqctpJJv9jYdo
         MmLHioDzkimByb9+Urhixw7D0EIG5KFyS7vKAh/KrIjnc+fKjDnf/3pqiqUHb24fgt
         HHxBM59y45xC3WBrhkSFMv6Xn4NFwWv/AwNkkYtb5R5DKJ4MAhd35MZo9tDl4l4Eiq
         UHJrjrJug/lBc50U37XyHJa3ohqCewFd97O3Bs7nMdwuOhRKV1940tyIX9mdagOn2f
         t1300zq4cKH38WzspHtVHyuC4VhDIL2PwlMrmF64hYoKJxz4sN7l2R4sKqY7Y3UrNl
         gePaX9QjVPWHg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: (subset) [PATCH 1/2] arm64: dts: qcom: msm8976: Add and provide xo clk to rpmcc
Date:   Wed, 15 Mar 2023 20:20:50 -0700
Message-Id: <167893686410.303819.4842310251256800007.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302123051.12440-1-a39.skl@gmail.com>
References: <20230302123051.12440-1-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 2 Mar 2023 13:30:49 +0100, Adam Skladowski wrote:
> In order for consumers of RPMCC XO clock to probe successfully
> their parent needs to be feed with reference clock to obtain proper rate,
> add fixed xo-board clock and supply it to rpmcc to make consumers happy.
> Frequency setting is left per board basis just like on other recent trees.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: msm8976: Add and provide xo clk to rpmcc
      commit: 4a2c9b9e1215c557c17a48e3fabe9b1674c1d608
[2/2] arm64: dts: qcom: msm8956-loire: Provide rate for xo_board clock
      commit: 4a2c9b9e1215c557c17a48e3fabe9b1674c1d608

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
