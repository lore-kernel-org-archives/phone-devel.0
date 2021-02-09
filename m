Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B027C433E0
	for <phone-devel@archiver.kernel.org>; Tue,  9 Feb 2021 22:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5662764E2E
	for <phone-devel@archiver.kernel.org>; Tue,  9 Feb 2021 22:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbhBIWgx (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 9 Feb 2021 17:36:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234494AbhBIW2g (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Tue, 9 Feb 2021 17:28:36 -0500
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3497BC06174A
        for <phone-devel@vger.kernel.org>; Tue,  9 Feb 2021 14:15:00 -0800 (PST)
Received: from [192.168.1.101] (abac187.neoplus.adsl.tpnet.pl [83.6.166.187])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0D1101F968;
        Tue,  9 Feb 2021 23:14:57 +0100 (CET)
Subject: Re: [PATCH] firmware: qcom_scm: Add MDM9607 compatible
To:     Rob Herring <robh@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210131013058.54299-1-konrad.dybcio@somainline.org>
 <20210209203803.GA129939@robh.at.kernel.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <36b0fcf5-a72e-763a-a300-30bc199ee45d@somainline.org>
Date:   Tue, 9 Feb 2021 23:14:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210209203803.GA129939@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


On 09.02.2021 21:38, Rob Herring wrote:
> In the future, please split binding changes to separate patch.


I will keep that in mind for the upcoming patches!


Konrad

