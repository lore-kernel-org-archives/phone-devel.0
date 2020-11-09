Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B510C2D0A3
	for <phone-devel@archiver.kernel.org>; Mon,  9 Nov 2020 19:28:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B56C82074F
	for <phone-devel@archiver.kernel.org>; Mon,  9 Nov 2020 19:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729906AbgKIT2v (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 9 Nov 2020 14:28:51 -0500
Received: from m-r2.th.seeweb.it ([5.144.164.171]:37741 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgKIT2v (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 9 Nov 2020 14:28:51 -0500
Received: from [192.168.1.110] (abag72.neoplus.adsl.tpnet.pl [83.6.170.72])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id E0AA93F5E0;
        Mon,  9 Nov 2020 20:28:46 +0100 (CET)
Subject: Re: [PATCH 4/4] arm64: cpu_errata: Apply Erratum 845719 to KRYO2XX
 Silver
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
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
 <8771f66911522ab87fe1b9b16e4e9921@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <0b09111d-f5cc-226b-bbc5-0277d6b597cd@somainline.org>
Date:   Mon, 9 Nov 2020 20:28:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8771f66911522ab87fe1b9b16e4e9921@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

> From what I see from the docs, this is the only version used
> in MSM8998(silver cores are based on Cortex A53) and it maps
> to r0p4. @Konrad, can you include (rap4 => r0p4) in comment.


Hi,

Thanks for looking into it. Could you perhaps check if it's also the case on sdm630/636/660?

Konrad

