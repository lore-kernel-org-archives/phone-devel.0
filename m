Return-Path: <phone-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B10C64EC5
	for <phone-devel@archiver.kernel.org>; Thu,  9 Feb 2023 04:32:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjBIEcj (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 8 Feb 2023 23:32:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjBIEb5 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 8 Feb 2023 23:31:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DDDA3FF11;
        Wed,  8 Feb 2023 20:31:29 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0F7EFB81FFD;
        Thu,  9 Feb 2023 04:21:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8527C4339B;
        Thu,  9 Feb 2023 04:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675916499;
        bh=EuZjpxV6PTOl2LuzcoJALKDf7qjC0V+RrkN+VB4Mnhk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UtZelLvffo/dooFezhy6fTnpOUPDAcjEiiGJXdI1iWjjqHITG9Sw05PMwHAiG97TJ
         RPNp3Fgxz14+Rb4GT12qQ6gKt9/GvSrng8opuGyF7n6LA1/3WZ6ikYyxS5+NrEoSWr
         I/LtKSxK4uHJS/Z9Vr+0QwhD9ME/OCCKtxkzjQAibqwqps6y4bTLSr65ulRiiYmaEf
         QaB8tgtlSVTU0Za+04y14I6j4pgyKVYBKgs3XiQiXE5uRiQTavdgi3ZxC7wLOVk7p2
         Aooqu7mRVze0zuZeQzIqHxkyBZ46Fu/U3F+7yBrQWCPwtq7Ff79Kd7Au3p3DQTfNTO
         41cV4RgD+N9bg==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Jamie Douglass <jamiemdouglass@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Petr Vorel <petr.vorel@gmail.com>, devicetree@vger.kernel.org,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Petr Vorel <pvorel@suse.cz>
Subject: Re: [PATCH v2] arm64: dts: qcom: msm8992-lg-bullhead: Correct memory overlaps with the SMEM and MPSS memory regions
Date:   Wed,  8 Feb 2023 20:22:55 -0800
Message-Id: <167591660371.1230100.18259207897974955566.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230202054819.16079-1-jamiemdouglass@gmail.com>
References: <20230202054819.16079-1-jamiemdouglass@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Thu, 2 Feb 2023 16:48:19 +1100, Jamie Douglass wrote:
> The memory region reserved by a previous commit (see fixes tag below)
> overlaps with the SMEM and MPSS memory regions, causing error messages in
> dmesg:
> 	OF: reserved mem: OVERLAP DETECTED!
> 	reserved@5000000 (0x0000000005000000--0x0000000007200000)
> 	overlaps with smem_region@6a00000
> 	(0x0000000006a00000--0x0000000006c00000)
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: msm8992-lg-bullhead: Correct memory overlaps with the SMEM and MPSS memory regions
      commit: d44106883d74992343710f18c4aaae937c7cefab

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
