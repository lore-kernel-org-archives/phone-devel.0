Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDA4CE79AC
	for <phone-devel@archiver.kernel.org>; Wed, 20 Sep 2023 03:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232623AbjITDzO (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 19 Sep 2023 23:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232632AbjITDzK (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 19 Sep 2023 23:55:10 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D007D9;
        Tue, 19 Sep 2023 20:55:04 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BFEFC433CC;
        Wed, 20 Sep 2023 03:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695182104;
        bh=+K00D89dCb2osmUZsUYArg336srEIfgfomzJ3IfzDto=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ev0lYbQUBBrvLiTLkTkKGc3FuY0qDN+vutFdFhjUmaZjaKInTBtZ5DMO5I1qoiEpV
         QToIsJgWKj9XWBAyK2WhjPBod9ja5yQ8jul+66Xmjcfqsg9vHzi6NezPqg59UXwxUi
         1ps0fnbmUoehcBn0fNYtc7cp2J7YdXUkI2MZVF2+8YiNMkEuLa666Kstwtg+nHzxH3
         YWptUMSB4mMwGyZO/mRdpPAfrh3hTfufNUGzcpNhjQE2GbDFc/zVMz4gx9Wvb0Prt4
         zku76ycS0qpIWzKAvtiSOluKV7LGP/A8kyEC+T6EINc1pCWxfBpiQg3ZKxank4FnsC
         Yxr9uNz+5ZG+Q==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Luca Weiss <luca.weiss@fairphone.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: Use QCOM_SCM_VMID defines for qcom,vmid
Date:   Tue, 19 Sep 2023 20:58:55 -0700
Message-ID: <169518233711.1055386.9535886399962025315.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230818-qcom-vmid-defines-v1-1-45b610c96b13@fairphone.com>
References: <20230818-qcom-vmid-defines-v1-1-45b610c96b13@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


On Fri, 18 Aug 2023 10:06:09 +0200, Luca Weiss wrote:
> Since we have those defines available in a header, let's use them
> everywhere where qcom,vmid property is used.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: Use QCOM_SCM_VMID defines for qcom,vmid
      commit: 018c949b32df9f17f52bf0e70f976719811db233

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
