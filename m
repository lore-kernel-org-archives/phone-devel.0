Return-Path: <SRS0=vNnj=DM=vger.kernel.org=phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C149C4363A
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 16:04:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 555D8206CB
	for <phone-devel@archiver.kernel.org>; Mon,  5 Oct 2020 16:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lODvluOe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728798AbgJEQEA (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 5 Oct 2020 12:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728769AbgJEQD4 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 5 Oct 2020 12:03:56 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23110C0613A8
        for <phone-devel@vger.kernel.org>; Mon,  5 Oct 2020 09:03:56 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l11so56934wmh.2
        for <phone-devel@vger.kernel.org>; Mon, 05 Oct 2020 09:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uo220a6rdlw3GxUuDIlr3sYYY1g7LV9qmd8uQhsVPEo=;
        b=lODvluOe5dzSF58N0UVpCpmhQlXLxHfuNm5BS1+EKic7A6XyT1oJPsMhXrt1qqTrWo
         Diixboxg6cBWwo8ja+D+F8Jx22w/6R9HZQ21BHmRuPiUNDILPeobf+WCj33QPLiUuuX0
         4Cl/PN/elZodhinZlIt4e+w4XerCOyJBDOE2gskXQXEzLtvdWOLF7TBNPFVvtwzWy6kL
         QYKKZsOchYFjQxM0jk/rp4AFMC2wfNOiD+IDxVeA9Q9drPI0QjaVe8rhPiQIMa8nvO2L
         RB339s7SY4jNKxrE8wqG4vhnYQv2zelgLErJxX/CgXkuJQhtpBK+TKV36fMeZJieC34t
         dSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uo220a6rdlw3GxUuDIlr3sYYY1g7LV9qmd8uQhsVPEo=;
        b=pO10Lid+A+5YxaXCNuq576J6jXj6dPCWl+OU51lovscn8Y2FMyuzeqtHgsDCiaGyrn
         IEKduUVTZ7ERQs2XqFLjtuJukhkNUdejDgANIkMoV+gorPn4Nd1KBBkZBiFamqaLIKJl
         cl33/5wqmV2rF/kyV0N/TLCiAKwHYHBVnc2IgFlJUwsWr3tiUNQUvA+OOia8LVWkRUxg
         woX6GirqQYWSlzlWFdz1umCL04V19wDZwcbUv88X4RDufUVL0zR00OqFk3BNJjL9n2WR
         pBfFiViaOuzKZwKJU8Iogqj5NSdMHuYewPvX+sPKaRzKV//gOcpu+rDcusknQFd6R2kC
         FEbA==
X-Gm-Message-State: AOAM530Y5Oe5Cg8bJx5hkDbT+HqM7R/eyqdapDWbSxsMFxWg6XJbxOCl
        v+p3LibGUzYnjVOyZZ660UtWag==
X-Google-Smtp-Source: ABdhPJx7oiNZNU8rPFOSk/6JrMpDhyGXaAHiJ+eFN04aZ5VckTnqfxasRJGGYPFyzij5GBhIHIklBg==
X-Received: by 2002:a7b:cb07:: with SMTP id u7mr62850wmj.57.1601913834561;
        Mon, 05 Oct 2020 09:03:54 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:4892:2327:f1c5:e39c? ([2a01:e34:ed2f:f020:4892:2327:f1c5:e39c])
        by smtp.googlemail.com with ESMTPSA id m3sm433878wrs.83.2020.10.05.09.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 09:03:53 -0700 (PDT)
Subject: Re: [PATCH 03/11] arm64: dts: qcom: pm8994: Add thermal-zones for
 temp alarm
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20201005150313.149754-1-konradybcio@gmail.com>
 <20201005150313.149754-4-konradybcio@gmail.com>
 <c03ace9d-d983-c1f8-ab74-ed585aeb2364@linaro.org>
 <CAMS8qEXBrF-j5ObahFVcJFMuC7=ucz+y7XBzTyuJAqejsE0F+g@mail.gmail.com>
 <0eb34c71-3e1c-9950-de30-6b163d7cca3a@linaro.org>
 <CAMS8qEW2rxYCc-7dQKPMBKQzbw0w1CtxNPVJYbeBPb2-1WvfDg@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <12ee5c1b-66a7-22d5-29f1-31e25cfbe32e@linaro.org>
Date:   Mon, 5 Oct 2020 18:03:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMS8qEW2rxYCc-7dQKPMBKQzbw0w1CtxNPVJYbeBPb2-1WvfDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 05/10/2020 17:49, Konrad Dybcio wrote:
>> What do you mean by they are not "online at once" ?
> 
> msm8992/4 are infamous for their thermal issues. Manufacturers have
> been known for straight up disabling some cores or tuning the kernel
> in such a way that some cores get disabled due to the thermal
> constraints.

Thanks for the clarification.
I was imagining some kind of hardware feature :)


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
