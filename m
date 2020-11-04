Return-Path: <SRS0=s4wV=EK=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96049C2D0A3
	for <phone-devel@archiver.kernel.org>; Wed,  4 Nov 2020 23:29:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5BDD52074B
	for <phone-devel@archiver.kernel.org>; Wed,  4 Nov 2020 23:29:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732807AbgKDX16 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 4 Nov 2020 18:27:58 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:56449 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732826AbgKDX1k (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 4 Nov 2020 18:27:40 -0500
Received: from localhost.localdomain (abag227.neoplus.adsl.tpnet.pl [83.6.170.227])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 31FD840229;
        Thu,  5 Nov 2020 00:22:24 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Steven Price <steven.price@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Andrew Scull <ascull@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Amit Daniel Kachhap <amit.kachhap@arm.com>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Add KRYO2XX Errata / mitigations data
Date:   Thu,  5 Nov 2020 00:22:09 +0100
Message-Id: <20201104232218.198800-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

This series adds Spectre mitigations and errata data for
Qualcomm KRYO2XX Gold (big) and Silver (LITTLE) series of
CPU cores, used for example in MSM8998 and SDM660-series SoCs.

Konrad Dybcio (4):
  arm64: Add MIDR value for KRYO2XX gold/silver CPU cores
  arm64: kpti: Add KRYO2XX gold/silver CPU cores to kpti safelist
  arm64: proton-pack: Add KRYO2XX silver CPUs to spectre-v2 safe-list
  arm64: cpu_errata: Apply Erratum 845719 to KRYO2XX Silver

 arch/arm64/include/asm/cputype.h | 4 ++++
 arch/arm64/kernel/cpu_errata.c   | 2 ++
 arch/arm64/kernel/cpufeature.c   | 2 ++
 arch/arm64/kernel/proton-pack.c  | 1 +
 4 files changed, 9 insertions(+)

-- 
2.29.2

