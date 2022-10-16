Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15909C433FE
	for <phone-devel@archiver.kernel.org>; Sun, 16 Oct 2022 14:53:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiJPOxi (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Sun, 16 Oct 2022 10:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229734AbiJPOxh (ORCPT
        <rfc822;phone-devel@vger.kernel.org>);
        Sun, 16 Oct 2022 10:53:37 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC833F30C
        for <phone-devel@vger.kernel.org>; Sun, 16 Oct 2022 07:53:35 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id a24so6406482qto.10
        for <phone-devel@vger.kernel.org>; Sun, 16 Oct 2022 07:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M617hUvDTpcFldbMirW8IIk1uyeowTMveYy1yVY2fm0=;
        b=oYhVG46jOla5tkhSF0Jlqh1Ynjmnbw+LFwUsB7noqbu1FtN/o3MmL7qYcuQH0uSLrc
         GvnSlCwIAg0klW50RN7piUw2pKm1pRUAjggKPHWSrZ3wr+fQXRHIkzOmywtrkQc3Qi3v
         10n5fzQ+MNMTwNwyimpRkOKhav1ndvI8sGJhxQc5uGCO7WrAF7LLTlSrIgaA+00GQ/yt
         NehaavngrV8ziMgWWXnnSJrB6pEA9mzD5Y4HX6y5AdMQHS8jnpfijk4mp0vD7OLLXVvn
         2IOiQ0rQowYB4v7k4K1cLwpWz+pOM83ZUOvAn0wkjA51hddD7S5pnnEh5DU26EtCPZZk
         WPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M617hUvDTpcFldbMirW8IIk1uyeowTMveYy1yVY2fm0=;
        b=gu8ZIh0mXKyOM5WkwpuqdJfdRkVZBrp3ioAKE6VYXdTtnMtepPs3b81nyYt+p+z8rS
         fortJsmUDFXMxzOEH8ALLbDuBQIh0zlvcgf4LfsuK0GRQUTDeeHLUMgr5n4w4/yA4VCx
         YykF5WzbMO3M8dLR/suNEVOgbE9xMBbD+dtZohKdLJ/Un5HrC0tLkyiuYCDybDX7cVbz
         ykd0Y30uE1pDA36vkpg0Pswi/DV/MAQOv7NNZReYqq978YYcdiWLP1hC0hiRdt0+5UWe
         wG93T9Lk0rV5E11ARPtbrNiwXowG6xjZ3T+z+0wS+NXqnVAB5dL6vo2qw/YYga/Q8emR
         ATtA==
X-Gm-Message-State: ACrzQf1ix5fIEeFOakWS2SB0Tnn4R0CHj4kCAbEVlccc77HT8tcCwuI4
        gIkaAZuALnilFcfD5CWQ73h3oQ==
X-Google-Smtp-Source: AMsMyM7EoF905CSD7P1QLRs54RDbWyurGOEQ+o4lDGC81gASGR8Yp7CprIB3QIAQlpjWkVq0WSEwrQ==
X-Received: by 2002:a05:622a:651:b0:398:5034:9e85 with SMTP id a17-20020a05622a065100b0039850349e85mr5406552qtb.277.1665932014173;
        Sun, 16 Oct 2022 07:53:34 -0700 (PDT)
Received: from ?IPV6:2601:42:0:3450:9b13:d679:7b5b:6921? ([2601:42:0:3450:9b13:d679:7b5b:6921])
        by smtp.gmail.com with ESMTPSA id de4-20020a05620a370400b006e07228ed53sm6890016qkb.18.2022.10.16.07.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Oct 2022 07:53:32 -0700 (PDT)
Message-ID: <bc1aa679-7173-c9a3-c35c-1da8b6c6f1f2@linaro.org>
Date:   Sun, 16 Oct 2022 10:53:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 1/2] dt-bindings: input: document Qualcomm PMI8998
 haptics driver
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh+dt@kernel.org>, Tom Rix <trix@redhat.com>
References: <20221015172915.1436236-1-caleb@connolly.tech>
 <20221015172915.1436236-2-caleb@connolly.tech>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221015172915.1436236-2-caleb@connolly.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 15/10/2022 13:30, Caleb Connolly wrote:
> Add bindings for qcom PMIC PMI8998 haptics driver.
> 
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

