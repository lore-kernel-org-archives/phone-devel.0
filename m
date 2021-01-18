Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131B0C43381
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jan 2021 18:09:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B85AA22CB1
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jan 2021 18:09:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407497AbhARSBS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 18 Jan 2021 13:01:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407484AbhARSBD (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 18 Jan 2021 13:01:03 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED703C061757
        for <phone-devel@vger.kernel.org>; Mon, 18 Jan 2021 10:00:21 -0800 (PST)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6AC5B3EEC8;
        Mon, 18 Jan 2021 19:00:20 +0100 (CET)
Subject: Re: [PATCH v3 1/7] regulator: qcom-labibb: Implement voltage selector
 ops
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        robh+dt@kernel.org, sumit.semwal@linaro.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        phone-devel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org
References: <20210117220830.150948-1-angelogioacchino.delregno@somainline.org>
 <20210117220830.150948-2-angelogioacchino.delregno@somainline.org>
 <20210118120453.GC4455@sirena.org.uk>
 <032d29df-9892-4774-2a61-7b634deafe06@somainline.org>
 <20210118175710.GR4455@sirena.org.uk>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <35dc7fe1-aff4-4518-b523-d5888636b8cf@somainline.org>
Date:   Mon, 18 Jan 2021 19:00:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210118175710.GR4455@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

Il 18/01/21 18:57, Mark Brown ha scritto:
> On Mon, Jan 18, 2021 at 06:54:26PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 18/01/21 13:04, Mark Brown ha scritto:
> 
>>> Please do not submit new versions of already applied patches, please
>>> submit incremental updates to the existing code.  Modifying existing
>>> commits creates problems for other users building on top of those
>>> commits so it's best practice to only change pubished git commits if
>>> absolutely essential.
> 
>> Sorry for that. Should I send a v4 to fix that?
> 
> If there are any changes in this version then yes, if it's identical no.
> 

Yes as I wrote in the cover letter, I have changed it to use
regulator_{list,map}_voltage_linear instead of linear_range, as you
asked in v1.

I will send a v4 with the aforemenetioned fix as a separated commit!

- Angelo
