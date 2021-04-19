Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BB7C433ED
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 19:17:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE8EC61107
	for <phone-devel@archiver.kernel.org>; Mon, 19 Apr 2021 19:17:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240311AbhDSTSX (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 19 Apr 2021 15:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237147AbhDSTSW (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 19 Apr 2021 15:18:22 -0400
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EEFC06138A
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 12:17:51 -0700 (PDT)
Received: by mail-oo1-xc2b.google.com with SMTP id i9-20020a4ad0890000b02901efee2118aaso418219oor.7
        for <phone-devel@vger.kernel.org>; Mon, 19 Apr 2021 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=m5D38FPKaVXPaWXHSFPjwGl10L5uuS1G4hWLi/5rSB0=;
        b=x8en4fC2bgy4uHZ0IMu38lYJhWK5Bbb2VGbO9ieiCefUCXHF0m5MJB8BPR9MhYsyUO
         Ndz0vzM3qHHnJRY661VVZtSmYlc4bONSPXqw5mR38ppyo0T8hc4a23GmfxEyJdevtK6Y
         vpEa1PQ4T4YY6Cj5Sizpn7Tyv+tRiAUYP4BDr4bIUYRQdzpBDToOwhazC05QXkroWJoU
         uGQGKfDDBeA45vDC+TEoHTtUbKv6RlH7riNFKvPJcozKHR9BUZ5lX7Kk2ZpNYL70e6kp
         y84l4RRhcdfeNAt/L1ywRpTqTx6TrKVMRpbNkJJp5Yu8y3K5ui0Fz43nxNZMT30hRUi1
         vBKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m5D38FPKaVXPaWXHSFPjwGl10L5uuS1G4hWLi/5rSB0=;
        b=Pe+rw46O2KJTd2gISh9N0dMAbNe6y/sk+7zL8o2IfOmBVQnKFX50DZBSLEiXVVqmGd
         qf2zvlve7gXNffY20QhB4LV1mdY55U2j2FO8QMv0X6JWY4e6gqoz1grRHQ5l1itDBB2c
         4hFZCh3RNpK1J40eUzY2rEQg0LHje9WzYeD1TrYz9P0W+r/b35+Pzc+gwvgF11eKZauT
         EU/XWzlI+HBWryiQraFMO4n6BjucFx0Bepu4VLANwitisXbRmDAZGDk5Z5MYpn5hN4LC
         5ddpAoNg02gOV6atP/45tiDYzJM7vbJ3E4qHJxKvDtYJuFYmBHVSBJFn/7nD8rE7xzfz
         83pg==
X-Gm-Message-State: AOAM533TBwXIAtUb7oJTXKAU0M71IQ9tqZbIgb4drKOd98FmgBv9PMEv
        vTkD0V0exPoxRYtzFaM0kQSCWg==
X-Google-Smtp-Source: ABdhPJz01Umh6zLfuwwGUusXjOlrZ3VrH1wOZO/VqjtjXCKZvrmxg/RnbVEb76RMNUsymXy7cdAvng==
X-Received: by 2002:a4a:94c3:: with SMTP id l3mr9789581ooi.12.1618859871144;
        Mon, 19 Apr 2021 12:17:51 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id q9sm282031oig.7.2021.04.19.12.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 12:17:50 -0700 (PDT)
Date:   Mon, 19 Apr 2021 14:17:48 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     viresh.kumar@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        amit.kucheria@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jeffrey.l.hugo@gmail.com
Subject: Re: [PATCH v4 4/7] dt-bindings: cpufreq: cpufreq-qcom-hw: Convert to
 YAML bindings
Message-ID: <20210419191748.GS1538589@yoga>
References: <20210119174557.227318-1-angelogioacchino.delregno@somainline.org>
 <20210119174557.227318-5-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119174557.227318-5-angelogioacchino.delregno@somainline.org>
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On Tue 19 Jan 11:45 CST 2021, AngeloGioacchino Del Regno wrote:
[..]
> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> new file mode 100644
> index 000000000000..bc81b6203e27
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
> @@ -0,0 +1,204 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/cpufreq-qcom-hw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. CPUFREQ
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +

Mani, I presume you're still up for the maintainership of this binding?

> +description: |
> +
> +  CPUFREQ HW is a hardware engine used by some Qualcomm Technologies, Inc. (QTI)
> +  SoCs to manage frequency in hardware. It is capable of controlling frequency
> +  for multiple clusters.
[..]
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names

This is optional in the .txt version and as such I would like you to
make this required in a separate patch following the yaml conversion.

Apart from that I think this looks good.

> +  - clocks
> +  - clock-names
> +  - '#freq-domain-cells'
> +

Regards,
Bjorn
