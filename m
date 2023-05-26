Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64C09C77B7A
	for <phone-devel@archiver.kernel.org>; Fri, 26 May 2023 19:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243796AbjEZTe5 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 26 May 2023 15:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243937AbjEZTeu (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Fri, 26 May 2023 15:34:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B82D9;
        Fri, 26 May 2023 12:34:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 00F2A652F5;
        Fri, 26 May 2023 19:34:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E95FC433EF;
        Fri, 26 May 2023 19:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685129688;
        bh=9CnqtJ+xZPCklFKySxlmg3pL3aVQfh/FISGl/AWWx7Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R4j69AIkVy1BaUaCF291wHM3aOvJ1ggnVwJR/zeayqJLvGxBluTsRz0jLP5HDb/wM
         9hp6CGUblOZnSARpfK4lbSGap2gzv6QIOwkgLiyjh4/5CWdGEf6N/84Vn0XlVz2zuW
         BcS9mnKa7JUL1Anq0bLQh5FHtGMW4cljQYpf0C0AOvilahDH7DRywREZNJuHJOCToe
         38IcOqRnkfTBEh9uKcyOIp35YlwDu2fbJzoih0Ftx7yK64O+Gr8ANiY9+Jl53hHK8u
         o1Q9qoVTrNoVD/ROI3n87y7VpouPaMLiRWcPZuOS5CkIURpFuntrri9DLFQ5Kk/5NT
         PdPFBrnP/M1lA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 0/2] Make SID for PM7250B configurable (and a small fixup)
Date:   Fri, 26 May 2023 12:38:29 -0700
Message-Id: <168512991477.248818.5074877208402046287.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
References: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Fri, 07 Apr 2023 09:45:43 +0200, Luca Weiss wrote:
> Like other Qualcomm PMICs the PM7250B can be used on different addresses
> on the SPMI bus. Use similar defines like the PMK8350 to make this
> possible.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: pm7250b: add missing spmi-vadc include
      commit: 83022f6484b11a60dbf9a95a88c7ef8e59c4b19c
[2/2] arm64: dts: qcom: pm7250b: make SID configurable
      (no commit info)

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
