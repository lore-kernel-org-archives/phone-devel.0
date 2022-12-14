Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6A0C4332F
	for <phone-devel@archiver.kernel.org>; Wed, 14 Dec 2022 20:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbiLNUjv (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Wed, 14 Dec 2022 15:39:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbiLNUjd (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Wed, 14 Dec 2022 15:39:33 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A472C109
        for <phone-devel@vger.kernel.org>; Wed, 14 Dec 2022 12:37:41 -0800 (PST)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 03B163F256;
        Wed, 14 Dec 2022 21:37:38 +0100 (CET)
Date:   Wed, 14 Dec 2022 21:37:37 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: dts: qcom: Use plural _gpios node label for
 PMIC gpios
Message-ID: <20221214203737.icoc6zan5edkhtcz@SoMainline.org>
Mail-Followup-To: Marijn Suijten <marijn.suijten@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221209220450.1793421-1-marijn.suijten@somainline.org>
 <714ac62a-7bab-e16e-e3b6-bdd86e422699@linaro.org>
 <20221210170531.pxoux2kje4vgor5y@SoMainline.org>
 <5795a42d-7920-713a-0d90-df32d657d365@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5795a42d-7920-713a-0d90-df32d657d365@linaro.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 2022-12-11 21:07:47, Krzysztof Kozlowski wrote:
> On 10/12/2022 18:05, Marijn Suijten wrote:
> > [..]
> > Just like -state and -pins suffix, sometimes even the unnecessary
> > -pins-pins suffix?  To me that is the same kind of churn, and *it is
> 
> You compare now to node names. The node names have visible impact (name
> of devices in sysfs and in system), is affected by DT schema (is parsed)
> and should follow DT spec rules.
> 
> There is nothing like that about labels, therefore they do not have the
> same rules or importance.
> 
> I understand that consistency in labels might be good thing... but also
> it does not matter. The labels really do not matter, except the code
> readability. pmgpio or pmgpios is basically the same readable.

For me the latter is more readable, and not only catering to
userspace/sysfs but also to the developer reading/writing these DTs is a
good thing (where it doesn't affect userspace nor sysfs, like this
patch).

- Marijn
