Return-Path: <SRS0=bCAi=EL=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D9C7C00A89
	for <phone-devel@archiver.kernel.org>; Thu,  5 Nov 2020 11:25:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 430DD22210
	for <phone-devel@archiver.kernel.org>; Thu,  5 Nov 2020 11:25:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730182AbgKELZA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 5 Nov 2020 06:25:00 -0500
Received: from relay01.th.seeweb.it ([5.144.164.162]:44555 "EHLO
        relay01.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbgKELY7 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 5 Nov 2020 06:24:59 -0500
Received: from [192.168.1.110] (abag72.neoplus.adsl.tpnet.pl [83.6.170.72])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6DB4C20095;
        Thu,  5 Nov 2020 12:24:55 +0100 (CET)
Subject: Re: [PATCH 4/4] arm64: cpu_errata: Apply Erratum 845719 to KRYO2XX
 Silver
To:     Marc Zyngier <maz@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Steven Price <steven.price@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Andrew Scull <ascull@google.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Amit Daniel Kachhap <amit.kachhap@arm.com>,
        Ionela Voinescu <ionela.voinescu@arm.com>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201104232218.198800-1-konrad.dybcio@somainline.org>
 <20201104232218.198800-5-konrad.dybcio@somainline.org>
 <3faa81d537320dfb20bb3f882cfaea1b@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <23d2ed0c-ab7f-e65a-4590-d58a1e1a3771@somainline.org>
Date:   Thu, 5 Nov 2020 12:24:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3faa81d537320dfb20bb3f882cfaea1b@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

> Is this the only affected version? If this is actually an A53, how do the

> revisions map between Kryo and Cortex cores?


Hi,

sadly, I do not have access to such information. Only this specific revision has been marked as affected in the BSP kernel.


Konrad

