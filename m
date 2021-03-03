Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B45CC41620
	for <phone-devel@archiver.kernel.org>; Thu,  4 Mar 2021 00:27:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4C33264EBD
	for <phone-devel@archiver.kernel.org>; Thu,  4 Mar 2021 00:27:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233586AbhCDA0x (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:26:53 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:46619 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388052AbhCCUlc (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Wed, 3 Mar 2021 15:41:32 -0500
Received: from [192.168.1.101] (abac94.neoplus.adsl.tpnet.pl [83.6.166.94])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id A48B91FAD9;
        Wed,  3 Mar 2021 21:40:33 +0100 (CET)
Subject: Re: [PATCH] arm64: dts: qcom: msm8996: Add usb3 interrupts
To:     Yassine Oudjana <y.oudjana@protonmail.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
Cc:     "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <dvfyYKA9vnJdunbQ1CL-dgjXtv_1wYpRnezdc3PHoCyrgmfi5KP0Dn4MtaumQEpHIQAHL9tTdqcaCK7YJWyrdWXCrPeGd4uMh-nFeu7xQYw=@protonmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <8401b0c6-3386-9041-6f12-e56a24ec3e6e@somainline.org>
Date:   Wed, 3 Mar 2021 21:40:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <dvfyYKA9vnJdunbQ1CL-dgjXtv_1wYpRnezdc3PHoCyrgmfi5KP0Dn4MtaumQEpHIQAHL9tTdqcaCK7YJWyrdWXCrPeGd4uMh-nFeu7xQYw=@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Patchwork didn't pick this up for some reason, but I guess it's only important that it hit the maintainers.


Tested-by: Konrad Dybcio <konrad.dybcio@somainline.org>

