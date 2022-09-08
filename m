Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72141C38145
	for <phone-devel@archiver.kernel.org>; Thu,  8 Sep 2022 16:05:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbiIHQFF (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Thu, 8 Sep 2022 12:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231267AbiIHQFE (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Thu, 8 Sep 2022 12:05:04 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1732820BF1
        for <phone-devel@vger.kernel.org>; Thu,  8 Sep 2022 09:05:01 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id t14so19628746wrx.8
        for <phone-devel@vger.kernel.org>; Thu, 08 Sep 2022 09:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=W8Bb70RnM7+M3BfzJDsvaPNXFgt0KDaRDT2dCnghNLY=;
        b=u9VZnK2sLRA3fAzJLvEGoYCyXEJz0ktGn67gxCsidBxbRnlDvl0tAqlUr9V2Lc9oUL
         sH49RJg3ivKn8Sya4z6kS78qW+TrI4GGBYmeuEOGPwBVoGemt7276gRkWyPZz71xN3S2
         egkdq7tGhPKiNhjgKFbFBKDqbJBfL4F8FTTUMLzleyEK0nZ6u3yGkCiBeUrzzMs6fus2
         /+lYsY+anOy2DwvV96q1vEUEKmF2TAmgab6KyUk5lrjnjHh+l1tD8Bn9QIEXDCtE+VYo
         9IVFhJZlSKwhVKnfG0YLJAGnJC8NXNi5nj81KXy7wwyLTgkVavcJyfWK0USat3d3l2N/
         nT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=W8Bb70RnM7+M3BfzJDsvaPNXFgt0KDaRDT2dCnghNLY=;
        b=O4Z4oAqjFzF/wYc7xulxnUWZKMTK5Sy1cm54lJg6wVexc5aDiCtB+F3nI5YzttO3Bg
         e/JMTy3/MzPwCdBMMI6iJ/FjbX1OtG3Dww4YDTKUmISWiY2l6hX8KDGi7uRXhQvdjsNj
         15NW6rSdyXkT1mojqkLfex+mynWetaPZM7Of2VbJkBZulmRFunu3KfKIN0O/6NNKZU2b
         MjDMj6LOh+pL7any4peZXvU+k8i/PWSaGPL91MlukCVfsfNd1e+Z4d7eHFojAP2NfGRL
         H5JXg1yJRc3NxpZYL4iG5fYrMJK62GzwW6kfXEs/W0G4dclRD03PahrMjtr+mm7Bl7mB
         EW4Q==
X-Gm-Message-State: ACgBeo05Jk06uGMLaRc29rCRFeIp4R8VrxVgFl5J5l3Qi5ZWXxnp1N6s
        HZ64Xt5VALvSfa6IhDLlogAwMg==
X-Google-Smtp-Source: AA6agR5Rq/TrOYVS5sCsQ0Pk0Owlkd3Mi7wHEnFOUO1Xv0O4Z2VskjC8W4FofL7jR0QXRXovg/ryDA==
X-Received: by 2002:a5d:65ce:0:b0:228:d8b6:d1 with SMTP id e14-20020a5d65ce000000b00228d8b600d1mr5509935wrw.486.1662653099589;
        Thu, 08 Sep 2022 09:04:59 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m2-20020a05600c3b0200b003a5ee64cc98sm3346012wms.33.2022.09.08.09.04.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 09:04:57 -0700 (PDT)
Message-ID: <0334cda1-61c8-84af-eba4-6f2f68a7cb3f@nexus-software.ie>
Date:   Thu, 8 Sep 2022 17:04:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: msm8953: add MDSS
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220906183334.203787-1-luca@z3ntu.xyz>
 <20220906183334.203787-4-luca@z3ntu.xyz>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20220906183334.203787-4-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 06/09/2022 19:33, Luca Weiss wrote:
> +				phy-names = "dsi";

Hi Luca.

It looks like the phy-names property drop will go through.
Suggest dropping the above for your V2.

https://lore.kernel.org/all/20220907000105.786265-6-bryan.odonoghue@linaro.org/T/

---
bod
