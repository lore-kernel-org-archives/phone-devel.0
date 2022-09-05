Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675B2C6FA83
	for <phone-devel@archiver.kernel.org>; Mon,  5 Sep 2022 10:08:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbiIEKIq (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Mon, 5 Sep 2022 06:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236736AbiIEKIn (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Mon, 5 Sep 2022 06:08:43 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E935193D3
        for <phone-devel@vger.kernel.org>; Mon,  5 Sep 2022 03:08:41 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id b19so8701372ljf.8
        for <phone-devel@vger.kernel.org>; Mon, 05 Sep 2022 03:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=d1gGchAveHzt86CvqEfieWHGXIsGqTrznknP67kJy30=;
        b=TAMRlnEHDcqBwK30yFwx0lTrk/OO6aRfuvGt//UFzJrFVUjgmO88y58cwBnsnfyx9v
         qYepZnxihho6F0SQXPJTdtCuXykn0j8WuS9xh56cHq0eYnbwezAphx/QakEvTkS4j9I6
         kdeRSziU6OUlYvlfQHgGH6sQApDTfvrMkpmKf2GpxWzt0R6KowqVXKe6cdyxfvVlDKtm
         +lXav0JGJmk1tnuLe04kHhtkF3MekmBIb7wcTF6GXU4jCF/7qx6E2c+pCJivDcaOunwI
         y/YDFH4jSFR72PHcZ+fN8BfcsqwbDDQbVdwv/5gnftR0wJh5dyBlJfurbPy6j+74mh3A
         UH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=d1gGchAveHzt86CvqEfieWHGXIsGqTrznknP67kJy30=;
        b=sVaQftCpOASLDBBTNibxmu2m/BTGryrbCM5jrDsj5YVcnJQSAznYFVxbfTAjyfMKYI
         2Gw/gvo3VLQC9BRHGpB0zMKVdLO3HXSoVQa4GMcd/8q6d0aFQLBgypyBOeV6SNDAGjdE
         y9jZYOTGsfRdZFgP4QDESf+sLkOAI/WzoLMIVOg88LvAFwCDlKEv0WJv0B2UPxwrRe82
         rbITPPQ2xdHe5Hyaea2OWj3UKBAFlOqaT5MAqTGzsWPGDTLOTsZWBoyrAetRjy4O8v7I
         A109gz0NvWun1f23Fryf5FzkrJhd4nZBGI0CjJdxtQfMT89iJb3A8fz4Ha3joKSrZoyE
         YQ5A==
X-Gm-Message-State: ACgBeo0eUAQJ75CiGoHLckSXLBgqb00wQ58KD3vVON5bSMbUeauXIwHg
        fJqlz1LpisMUKb09Yp51JgVDFA==
X-Google-Smtp-Source: AA6agR7MhZ1+wSDLkfeIWuVF5HSfdbylV+gyRRbfXVc6DYgaS9hOJx7hDoxEcuLv9xg7i6lGc7aBIg==
X-Received: by 2002:a2e:934f:0:b0:24f:ea1:6232 with SMTP id m15-20020a2e934f000000b0024f0ea16232mr14853380ljh.135.1662372519831;
        Mon, 05 Sep 2022 03:08:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id s6-20020a056512214600b00492e5d31201sm1148641lfr.7.2022.09.05.03.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 03:08:39 -0700 (PDT)
Message-ID: <64bb3a7b-9c34-50f9-0243-36de805e62ad@linaro.org>
Date:   Mon, 5 Sep 2022 12:08:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: qcom: update beryllium
 compatible property
Content-Language: en-US
To:     Joel Selvaraj <joelselvaraj.oss@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20220828205723.20834-1-joelselvaraj.oss@gmail.com>
 <20220828205723.20834-2-joelselvaraj.oss@gmail.com>
 <d9b5e312-4999-4410-03be-299e95bbe8b2@linaro.org>
 <CAF+P-ZoAooPFEK8dueEnQg5d5+K4QRmj-W0WsjyUV-btgBfYnw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAF+P-ZoAooPFEK8dueEnQg5d5+K4QRmj-W0WsjyUV-btgBfYnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 02/09/2022 07:20, Joel Selvaraj wrote:
> Hi Krzysztof Kozlowski,
> 
>> The board compatibles are not that important for ABI yet this creates
>> precedence, so I am against it. Simple renaming should not be a reason
>> to change compatibles.
> 
> So what should I do now?
> 1. Retain "xiaomi,beryllium" for tianma and "xiaomi,beryllium-ebbg" for ebbg?
> 2. If adding new compatible is not an issue, can I do
> "xiaomi,beryllium-tianma", "xiaomi,beryllium", "qcom,sdm845" - for tianma
> "xiaomi,beryllium-ebbg", "xiaomi,beryllium", "qcom,sdm845" - for ebbg
>

Both options work for me. I understand that boards are quite compatible
and only the panel is different but the safest option (from any 3rd
party users) is (1) above. If anyone has other preference, I am also ok.
If not, then go with (1) above.

Best regards,
Krzysztof
