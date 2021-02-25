Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B67C433E0
	for <phone-devel@archiver.kernel.org>; Thu, 25 Feb 2021 19:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C258B64F3C
	for <phone-devel@archiver.kernel.org>; Thu, 25 Feb 2021 19:30:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234633AbhBYTaZ (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 25 Feb 2021 14:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234664AbhBYT2W (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 25 Feb 2021 14:28:22 -0500
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA311C061574;
        Thu, 25 Feb 2021 11:27:24 -0800 (PST)
Received: from [192.168.1.101] (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 95A3B1F534;
        Thu, 25 Feb 2021 20:27:21 +0100 (CET)
Subject: Re: [PATCH 6/6] clk: qcom: gcc-sdm660: Add CLK_SET_RATE_PARENT where
 applicable
To:     Stephen Boyd <sboyd@kernel.org>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20210220155618.176559-1-konrad.dybcio@somainline.org>
 <20210220155618.176559-6-konrad.dybcio@somainline.org>
 <161404097084.1254594.16485341937086704738@swboyd.mtv.corp.google.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <2eb68f3c-d088-2b4d-2eec-347d7b11decc@somainline.org>
Date:   Thu, 25 Feb 2021 20:27:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161404097084.1254594.16485341937086704738@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


On 23.02.2021 01:42, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2021-02-20 07:56:17)
>> Some branch clocks should explicitly set this flag to make sure
>> they inherit their frequencies from the parent clock.
> This flag doesn't have anything to do with inheriting the rate from the
> parent.
>
Right. "Some branch clocks should explicitly set this flag to make sure the frequency changes are propagated to their respective parents if need be." should sound better.


Konrad

