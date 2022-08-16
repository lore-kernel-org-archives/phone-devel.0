Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE58C32792
	for <phone-devel@archiver.kernel.org>; Tue, 16 Aug 2022 09:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbiHPJaq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Tue, 16 Aug 2022 05:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbiHPJaE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Tue, 16 Aug 2022 05:30:04 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 200A211CF2E
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 00:49:58 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s9so9847522ljs.6
        for <phone-devel@vger.kernel.org>; Tue, 16 Aug 2022 00:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=SAejUFFCQNt+j+xwuoW3jHwPOH/rVvouLgiRHal72RA=;
        b=Nd2fhV/VaL72FFIo/is9YPIp+d0tc2VTysn21/EE9oHq/0P5hgLRZLPHm0D/XsgD7Z
         VlbcMgMpbi9+7DL8jKr/9Xz82BEpQhfGShqRHvux+OZ1GDa3EsdJdFIQk7lpP0TFhYo5
         SvvjG+YbDchXeCdt9Ch9HdM9O9py6p+ZAZfU7TulURI/uSAeG4BHkM+dlHlDpNydENvo
         Yfy5j1qpm24DloGUssQGnDXTnIMs8JhNn3OC9G/SPKf5hGlXAX2Cb3HMBrNpvMFQymRP
         WHRBVcOxZs/eLBBnnI6RfVPc9kl74chja5g9sfdMdJTZTiwT3OB7ZMpa72Pvfkl3e6w9
         yVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=SAejUFFCQNt+j+xwuoW3jHwPOH/rVvouLgiRHal72RA=;
        b=wZCksSS1sxbh4OmBvgoYfVdci8tv8x7ZK+HGZI6yEtxsi9pdEcdvnGWMYkPvVGrGBC
         anuY7ZTvGrzjYHNUu0DTzHkfdRsaRntI9rt0wDfv8ZD5C8pV2AFm3dTq16sRpCyyPeJI
         GONSf4cIphgXw/uAkZyimI+rGGqRIGHfRtoIN6W+8QgmYMXiegxWF8CWSaKGDJ5Hvacl
         OWf36Ic2itRmpAkozDjHtT/VBv2W6dHWbeQlSXgDp/i0sO8xI0sjHF5aLwK6Vbgox7gt
         n2AcC+vdbhohxPHpGW+rZ8oKLYJHkhpd3JjObZ6+NrT/pPc9NIZtu8fP3VJPolYXkOCa
         TgUQ==
X-Gm-Message-State: ACgBeo3cvqBDNPzG4ulmS9Gt2INHi/rLnz4V2HhD004VcY6qeLZkFjyM
        BEp+Dm4e7oAg91fLqJT+WGM5BA==
X-Google-Smtp-Source: AA6agR7YnhFNe5Ed7tGtyQ+mDj1iuRvb65JZjphfZX/S5+f6iom4DkcGLIDIQitAULHttjSS/F3bFg==
X-Received: by 2002:a2e:9950:0:b0:25e:5777:a17b with SMTP id r16-20020a2e9950000000b0025e5777a17bmr5992650ljj.32.1660636196351;
        Tue, 16 Aug 2022 00:49:56 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:1782:dd68:b0c1:c1a4? (d15l54g8c71znbtrbzt-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1782:dd68:b0c1:c1a4])
        by smtp.gmail.com with ESMTPSA id z13-20020a05651c11cd00b0025e4fcadc72sm1692421ljo.92.2022.08.16.00.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Aug 2022 00:49:55 -0700 (PDT)
Message-ID: <338f2929-aa67-bf63-2d66-5de48f6af1c4@linaro.org>
Date:   Tue, 16 Aug 2022 10:49:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 7/7] dt-bindings: firmware: document Qualcomm SM6115 SCM
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Emma Anholt <emma@anholt.net>,
        Rob Clark <robdclark@chromium.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-mmc@vger.kernel.org, linux-pm@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Adam Skladowski <a_skl39@protonmail.com>
References: <20220815100952.23795-1-a39.skl@gmail.com>
 <20220815100952.23795-8-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220815100952.23795-8-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/08/2022 13:09, Adam Skladowski wrote:
> Document the compatible for Qualcomm  SM6115 SCM.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.txt | 1 +


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
