Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A65CCA47F
	for <phone-devel@archiver.kernel.org>; Mon, 18 Jul 2022 23:15:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236404AbiGRXPH (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 18 Jul 2022 19:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235657AbiGRXPG (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Mon, 18 Jul 2022 19:15:06 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644CF33404
        for <phone-devel@vger.kernel.org>; Mon, 18 Jul 2022 16:15:03 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z22so8319347lfu.7
        for <phone-devel@vger.kernel.org>; Mon, 18 Jul 2022 16:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=HE1FwD+lN8EId4JRcmxRzN5D4z0DEF/FKKUfYD2j4LU=;
        b=LfYnTGomRy0mIuYpeTaogh+8jet4b64mTTilWC1/+nP98lLhQqbJ6n382kgReMEoDH
         WGDH48In8zPhwAKVCph+TvSagiEd7iIQ5IchM54aMRwuju+MCBZsyb+NsYh3nR8ycBZd
         jNVUiXrJGaViaEJktW6vs8s22PYMG28TenrVv486mYDHgsDeTxeK45VpBGTJQgdw2eKH
         QTMtbGIfxx7g+ibA/ocd9JRwxlw1KngjbM5jQid7xcBS4qpO5hPn/yf/wBejbcd2Yji2
         EP1ak2pOKL1E0/XImoo6eVOzlGbCFwbWhDP0bXJrF7s4mx/UkH8dZuDJh6S08Ov7H4O9
         2x4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HE1FwD+lN8EId4JRcmxRzN5D4z0DEF/FKKUfYD2j4LU=;
        b=1FFqXGwFQEi4wFMaRyqBdoBjWa6w1EE0vJhHRjt9nuk/PJvetCXIhO+100IITnTe/O
         owOwmk6rk7UkxECBfTHBS4mBtKJYzNtwwO/xLnAZlyXo4dUPZyhifwPCOsE5gmp9nBOi
         Gk+ZZvuBWS7YIqEqN9La+JMGhY8eO/LaFkLWogPwwVOclRBJUzWI/q42mhYaecxKEC9P
         4JyF/UeuEL5/d9xUG8ckd7fvrAyL3ry0QQqpSsiEx55B4dsHOdeXwNDPQhwqkMn8NoI3
         iC0LKRfoJ+1wQgiSmmc2BQz2yuK3xUuY4lqdCa3b6C2ZUu2rVz0rpISXgxUcSn3XCQJV
         NnVg==
X-Gm-Message-State: AJIora/h4ZH0dPculezyuizTcSISAjFd4u1SrDEHrZph9mdqyd/KKatO
        U4BJPaja4g7+SCP3TZp8IOD6ew==
X-Google-Smtp-Source: AGRyM1uK4J89ps1im4BvW/EUBiHpmWPvWyOGFjewbSGsnwyFX0y/EZKtfhz97cRYx4yctS6D/Ew9yw==
X-Received: by 2002:a19:dc4d:0:b0:489:63cb:20c7 with SMTP id f13-20020a19dc4d000000b0048963cb20c7mr14857343lfj.101.1658186101548;
        Mon, 18 Jul 2022 16:15:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x28-20020ac2489c000000b00488ab8914b5sm2827797lfc.213.2022.07.18.16.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 16:15:01 -0700 (PDT)
Message-ID: <af496488-6761-d1a3-18c4-85bc63e37b9e@linaro.org>
Date:   Tue, 19 Jul 2022 02:15:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/4] arm64: dts: qcom: add sdm845-google-blueline (Pixel
 3)
Content-Language: en-GB
To:     Caleb Connolly <caleb@connolly.tech>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Kalle Valo <kvalo@kernel.org>
Cc:     Amit Pundir <amit.pundir@linaro.org>, Vinod Koul <vkoul@kernel.org>
References: <20220718213051.1475108-1-caleb@connolly.tech>
 <20220718213051.1475108-3-caleb@connolly.tech>
 <d8f24aca-2cdf-413f-2b30-ad41b81be1a5@linaro.org>
 <41a8cd51-f808-4fa2-b9b1-5c04c2aec7c0@connolly.tech>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <41a8cd51-f808-4fa2-b9b1-5c04c2aec7c0@connolly.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 19/07/2022 01:54, Caleb Connolly wrote:
> 
> 
> On 18/07/2022 23:13, Dmitry Baryshkov wrote:
>> Any idea, what is the issue here? Do you have the datasheet for the panel?
> As Marijn just mentioned on IRC, the driver right now only calls
> drm_dsc_pps_payload_pack() but doesn't actually send it. I haven't
> investigated this myself but I'll look into it.
> 
> Unfortunately no datasheet afaik, they tend to be pretty elusive. The
> things I would do for a phone panel datasheet...

as a side note: I checked the dtbo.img. There are three different 
versions of the panel programming sequences in the included dtb files. 
So you might want to check for the difference with 
linux-mdss-dsi-panel-driver-generator.

-- 
With best wishes
Dmitry
