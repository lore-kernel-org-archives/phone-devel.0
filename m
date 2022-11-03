Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E9BC433FE
	for <phone-devel@archiver.kernel.org>; Thu,  3 Nov 2022 16:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbiKCQJw (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 3 Nov 2022 12:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbiKCQJe (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 3 Nov 2022 12:09:34 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B967B1CFC4
        for <phone-devel@vger.kernel.org>; Thu,  3 Nov 2022 09:09:08 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id j6so1415775qvn.12
        for <phone-devel@vger.kernel.org>; Thu, 03 Nov 2022 09:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rdupXZP9IFvwGILZVl/bXkxyiQBrd2eY1VoR9aqF3f8=;
        b=kU9c5IXpOAFVRhtLb9VD0DkbGRRrvofFv5ZaV90ha/Z5Pjkds75ssplzse/sexzY2G
         t4ryGbivPIq5eSqm2hV/0dAwUzPEMCCIJ7IJRnzOREaD1PNNjDgXONaIUuG5SH/QjqQR
         3dv/jK1oPs2gFsxHCbY/35BjVKfQcu1hH2SrX4u02/Pgev80Go7zikIubUdilCydjnb4
         uS+ZTwvF+YU7OOrP+9J53OwRZvWgphfr/OKoqL8LwDCAjuNGqCtpBaTKOeVQdumMuMzl
         DuT9fb/j515nbCluQBt4Ica6G2qsI6tmDSlLeDAcXAD2dMbVsBU2/uToc6o34YF6j2Zl
         38WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rdupXZP9IFvwGILZVl/bXkxyiQBrd2eY1VoR9aqF3f8=;
        b=0rMxds1nH3iPolZv9bilpDOyoEWTVeC037MLbY/r62HzEz8CyJg7yd/W54CvY80SN9
         iEnJaFgAnW2TSTEf54BKxPPZUgGVppX8OUtgtld3WjgwonrMmdQhmasDKTivhkXWkWev
         X8vG75Gu/+Yv0f26Z7ZvB8vOq0NewtN3ZIXRKVOvaI+ZAsdOJxZk80g4RD3SaJfmjhbK
         7KA4JM/DheEJgfrZUwjMxmA+Bsiwb6IgmBb88eCkiTvxKiNc2emRoPDmRKyEc2KnrnsZ
         g6nKtT5tRHA7a1NBGd/0RgzdepZNeXjvw55lmwGpLOyN6Z1t/7IaxAc+56RueuX7vOzz
         NwFA==
X-Gm-Message-State: ACrzQf3G1gbJuxv5fqzOpL3OJPKRsUx06nGKA/yjJk3DCQGWjZWCMekC
        WtW8pV+eF2J0bDVDtrNZLDUH2w==
X-Google-Smtp-Source: AMsMyM4Na22MQCEkYmNGL/H4cHE5jOAZx/Jxn3T2uL4LmjrXMvv/w3qjaGdleg7s97ZnEYStiL1OmA==
X-Received: by 2002:a05:6214:194c:b0:4bb:6d2f:3e7c with SMTP id q12-20020a056214194c00b004bb6d2f3e7cmr27602892qvk.4.1667491747673;
        Thu, 03 Nov 2022 09:09:07 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:a35d:9f85:e3f7:d9fb? ([2601:586:5000:570:a35d:9f85:e3f7:d9fb])
        by smtp.gmail.com with ESMTPSA id h18-20020a05620a401200b006ee8874f5fasm1018291qko.53.2022.11.03.09.09.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 09:09:07 -0700 (PDT)
Message-ID: <287a41ec-b004-54a7-1ac3-07cc4db5fbbf@linaro.org>
Date:   Thu, 3 Nov 2022 12:09:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 1/3] dt-bindings: qcom-iommu: Add Qualcomm MSM8953
 compatible
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221016161554.673006-1-luca@z3ntu.xyz>
 <20221016161554.673006-2-luca@z3ntu.xyz> <5615419.DvuYhMxLoT@g550jk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5615419.DvuYhMxLoT@g550jk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 31/10/2022 12:26, Luca Weiss wrote:
> Hi all,
> 
> On Sonntag, 16. Oktober 2022 18:15:51 CET Luca Weiss wrote:
>> Document the compatible used for IOMMU on the msm8953 SoC.
>>
>> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Could someone please pick up this patch?
> 
> Looking at the file history, there's not much but maybe @Rob could you take 
> this? Or maybe Bjorn?
> 

Use "iommu:" in the subject (dt-bindings: iommu: qcom:) so IOMMU
maintainers notice it...

Best regards,
Krzysztof

