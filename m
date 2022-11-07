Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E062C3A589
	for <phone-devel@archiver.kernel.org>; Mon,  7 Nov 2022 03:15:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbiKGDPG (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 6 Nov 2022 22:15:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbiKGDOa (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Sun, 6 Nov 2022 22:14:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47145120B3;
        Sun,  6 Nov 2022 19:13:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F1676B80D99;
        Mon,  7 Nov 2022 03:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92324C43146;
        Mon,  7 Nov 2022 03:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667790790;
        bh=cGAJjbZeuhUhO/pFsR5dnPtnKFHkFJOaQQC+3rpOCPE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aHfhy2McPNyp3V/6keDTcw6fRr9NUvfC5X/A3h7h4IzkFX6UaW8MAPPlpwEyujoY6
         d0ha+OquMBl+EOPsqpxeGH5whOqIcPaa5ySRX1zHSg5/sSPORzAPgencZir5b3aojZ
         /vnMy7Fo/twoxKDsz+TEVnb/4R8BKlfax9jpNLNRQJdVRFUmbbg0fEBrJAlBX3I9Z6
         fwHwSUrlTT3iJ7xCBLcvG62YZVvt/z1dWt8xAwLwSvYdomrzCEujQ3FvPuPsAQEBO6
         a83Mb2qjrX4MrTstc/V839dV8Yq1bbNAAtwMSS/1v6rhb8dbInlAtIyt4XWgnwIdyD
         iLmv7x4VvF0Xg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     phone-devel@vger.kernel.org, marijn.suijten@somainline.org,
        Andy Gross <agross@kernel.org>, konrad.dybcio@somainline.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-kernel@vger.kernel.org, sboyd@kernel.org,
        martin.botka@somainline.org, lee@kernel.org,
        jami.kettunen@somainline.org
Subject: Re: [PATCH v4 0/5] Add Qcom PM6125 PMIC and use in Sony Xperia Seine PDX201
Date:   Sun,  6 Nov 2022 21:12:28 -0600
Message-Id: <166779074253.500303.17337687098112948998.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220926190148.283805-1-marijn.suijten@somainline.org>
References: <20220926190148.283805-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Mon, 26 Sep 2022 21:01:43 +0200, Marijn Suijten wrote:
> This series adds initial support for the PM6125 PMIC, and its power key
> handling and thermal monitoring capabilities are configured for Sony's
> PDX201 (Xperia 10II).
> 
> One patch for pm660 is included to fix a node address mismatch with its
> reg field.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: mfd: qcom-spmi-pmic: Add pm6125 compatible
      commit: 3da503c26ec572628802b4ffbe738a5d373cd3f6
[2/5] arm64: dts: qcom: pm660: Use unique ADC5_VCOIN address in node name
      commit: 02549ba5de0a09a27616496c3512db5af4ad7862
[3/5] arm64: dts: qcom: Add PM6125 PMIC
      commit: 7c969c6e216654cab8b124383dd99a276049994d
[4/5] arm64: dts: qcom: sm6125-seine: Include PM6125 and configure PON
      commit: 7401035f2ef8841d0db9724507b45841d16894b6
[5/5] arm64: dts: qcom: sm6125-seine: Configure additional trinket thermistors
      commit: 4ba146dd8897353e4e18a12c7866127f85c251e7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
