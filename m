Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A791C433DB
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 20:34:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1560023A5E
	for <phone-devel@archiver.kernel.org>; Thu, 14 Jan 2021 20:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbhANUea (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 14 Jan 2021 15:34:30 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:43171 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726262AbhANUea (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Thu, 14 Jan 2021 15:34:30 -0500
Received: from [192.168.1.101] (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 038D13F1E5;
        Thu, 14 Jan 2021 21:33:31 +0100 (CET)
Subject: Re: [PATCH v3 1/2] arm64: dts: sdm845: add oneplus6/6t devices
To:     Caleb Connolly <caleb@connolly.tech>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210114185227.25265-1-caleb@connolly.tech>
 <20210114185227.25265-2-caleb@connolly.tech>
 <17d49d19-7672-520c-12d3-c6ed8c12ae47@somainline.org>
 <4db0807e-c33e-5913-1818-1fc055e35acb@connolly.tech>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <1b023774-d091-e7fd-8eaf-dedeff5feac2@somainline.org>
Date:   Thu, 14 Jan 2021 21:33:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4db0807e-c33e-5913-1818-1fc055e35acb@connolly.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org


> The device definitely doesn't support USB3, although downstream does 
> leave the USB3 phy enabled the hardware doesn't support it. So it made 
> sense to disable it here.


Sure.


> OnePlus' bootloader doesn't seem to care about these values so I left 
> them out for simplicity.

Sounds strange, but it's not the first time vendors surprise us.


Konrad

