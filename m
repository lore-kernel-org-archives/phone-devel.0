Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B1AC07E96
	for <phone-devel@archiver.kernel.org>; Thu,  8 Jul 2021 08:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 073B761CD9
	for <phone-devel@archiver.kernel.org>; Thu,  8 Jul 2021 08:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhGHIkS (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 8 Jul 2021 04:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231132AbhGHIkR (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 8 Jul 2021 04:40:17 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48DFAC061760
        for <phone-devel@vger.kernel.org>; Thu,  8 Jul 2021 01:37:35 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id h1so2569742plf.6
        for <phone-devel@vger.kernel.org>; Thu, 08 Jul 2021 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ow6TssIgweT/GoAzxSRukYv145LzMR/18ewmHa903tU=;
        b=fttXZFzoq1PFbtzT6GLchigJke//EcyHyL6cuG0NFxsW+gKl90hEVLn+Z6A8QGhs7Y
         UEIIIiugt6qH9dZWB0JhMKIOFrdORsR4qtubn1qCXg4Rn7dv07ktzjKTAh0La7t4n12t
         ZCpmtQBhp77h5hpZJaj/I/su2NJwX+nWQjNXHaTFlxPUwTDVl0Dwa+g3Ma0NlfoOQiXj
         NKDGfAFtspcRP2MvlflXl67RtXOJAaLktk4YEBZaptevxHCoCVtf+ii3q1UR5I24mAg0
         PNqfRuZ19MGwNrcCTKX4hyhcJtbBBtIec9cZBDabnJ1TyocsSRWsiaNy2+MskLFM6X7C
         5G1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ow6TssIgweT/GoAzxSRukYv145LzMR/18ewmHa903tU=;
        b=r5yTX4VxCzQFpt7GhDOkoQJOgXo96IAkzGoGproOLcHpwgZXQhJFgsi/08gu1fFbKR
         3boX3QWcVT8atsy/iUJlkR4G34fjKsM38DnxvdPMwtKmFabvWI/0CLHurJ1i9DB7Ugrg
         Hd1bRWmZFx+7XY66FzJk9mYbul49Uo0G/nGK6SX2EEx0eJUWeXlI5DynRT1SJgqqV+Nu
         6QsWmbfaXB77jS2W20h2HzNEct9oeiE/CVTQQ4VrnuMlKXvWh8hd/rQC5kkmO9oZr6x/
         DqiUvaKTMQjgMiix79LFzS8FBplYLw5ZulojT+VmZ0l7jke7lHulxoPOkNM6eForaBYN
         txog==
X-Gm-Message-State: AOAM533KvFlNBKeM8zni07R1VwGZKq60bY0BqGL0yx5pJLijecdfn54H
        11pipdq74dfHqB0sg3OSqqmrQg==
X-Google-Smtp-Source: ABdhPJwy6EnErPIofL/vD7EAud7+o6gts5+joGCEo+xXtxdeyOlzlPOH9f2OIAv6neGs35KZkbJ9zg==
X-Received: by 2002:a17:90a:eb0c:: with SMTP id j12mr7087591pjz.79.1625733448683;
        Thu, 08 Jul 2021 01:37:28 -0700 (PDT)
Received: from localhost ([106.201.108.2])
        by smtp.gmail.com with ESMTPSA id g9sm1782323pfj.49.2021.07.08.01.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 01:37:27 -0700 (PDT)
Date:   Thu, 8 Jul 2021 14:07:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        amit.kucheria@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, jami.kettunen@somainline.org,
        paul.bouchara@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, jeffrey.l.hugo@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v6 3/9] dt-bindings: arm: cpus: Document
 'qcom,freq-domain' property
Message-ID: <20210708083725.ggq66mv5g3w4e6nk@vireshk-i7>
References: <20210701105730.322718-1-angelogioacchino.delregno@somainline.org>
 <20210701105730.322718-4-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210701105730.322718-4-angelogioacchino.delregno@somainline.org>
User-Agent: NeoMutt/20180716-391-311a52
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 01-07-21, 12:57, AngeloGioacchino Del Regno wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Add devicetree documentation for 'qcom,freq-domain' property specific
> to Qualcomm CPUs. This property is used to reference the CPUFREQ node
> along with Domain ID (0/1).
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> index f3c7249c73d6..8512fa0147fa 100644
> --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> @@ -290,6 +290,12 @@ properties:
>  
>        * arm/msm/qcom,kpss-acc.txt
>  
> +  qcom,freq-domain:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    description: |
> +      CPUs supporting freq-domain must set their "qcom,freq-domain" property
> +      with phandle to a cpufreq_hw node followed by the Domain ID(0/1).

We should be moving this driver to the new generic bindings instead.

commit 88bf5a85fe98 ("dt-bindings: dvfs: Add support for generic performance domains")

-- 
viresh
