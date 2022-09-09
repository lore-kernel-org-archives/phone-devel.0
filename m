Return-Path: <phone-devel-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDAEFECAAA1
	for <phone-devel@archiver.kernel.org>; Fri,  9 Sep 2022 08:13:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbiIIIN2 (ORCPT <rfc822;phone-devel@archiver.kernel.org>);
        Fri, 9 Sep 2022 04:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231372AbiIIIN0 (ORCPT
        <rfc822;phone-devel@vger.kernel.org>); Fri, 9 Sep 2022 04:13:26 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88FCB1174B7
        for <phone-devel@vger.kernel.org>; Fri,  9 Sep 2022 01:13:24 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f14so441439lfg.5
        for <phone-devel@vger.kernel.org>; Fri, 09 Sep 2022 01:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=S2fum64ByqkOeJl+LO3V1LaGVG9omN46/lj7osptdj4=;
        b=WGdxn4I64th6g1EPMDsoEgyfOQN2uuuDDHA8YIje0WGJdVKSbENbHgKD4X5N3mXAV6
         JcJVCiUyVyH2aibywApaaOfCHOwvnVxo/h2eRLPneeiEQJcvmd8tSXDMZn9XdfRk4Dsk
         6rcTrGRezO2QywnQzU4WKhA+kBA9KouTt5jThrRWjYpYxgEP+jpoX/I2sVG0EMRPIBHP
         GNdUt935U53+e986SQDqdAb5nnr1xt84VYdw/6bFcNJFUpAAs+9YV7Lp4ruePhoidtnx
         UAEm6vIN3zsAHZap6kFQBIJvoKBYOCJz2ysrYCGmYJutP00mix3FxoM3pmiO4qO7HpNZ
         XceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=S2fum64ByqkOeJl+LO3V1LaGVG9omN46/lj7osptdj4=;
        b=AnEbs9bCeeOGVQnc5Yr5Yj+U15rCSfgJpIM4ypBl7XovQ8mLgFmS5HIqzEn2hzdGyI
         96kyMTQZZ4cxqZoGv3Dktw+vZi3j7x07RDjQnJmoz7ZkQ30xHS8bDKgQcEmrSqZWNpf/
         qvhuGlGwHmMgxCU+K+O74CGPXQGCDJqIBme9ueJrtYPdUUnOh2NTZKHKn5/CfTgc06Hm
         9HLAekfWCcHMTrgNjbZDAdu5oNbod04M9KUqZqmD6orMlSWxc7v1wopwZa4SyIx20+0y
         3jHAmtSHXpMN7fcaJpkBy4NoUczeORyksaXsbk8QRupeKxVRDZumS5kHL806Y7OPwW9g
         ywtw==
X-Gm-Message-State: ACgBeo0VBIiTR9opR1YAhUox4DAbCa3IcKyXv1PM5n4UDVawprJKBKxE
        WK/uerE7Rmard5XexhG/HfW4qg==
X-Google-Smtp-Source: AA6agR44SozBclTc6GLHAKXHxkjnOVy5XY214P2T5ZXYza2eZE8wISfmmRLMYgXu5N0qeK628rQHug==
X-Received: by 2002:a05:6512:3403:b0:48c:9727:50b0 with SMTP id i3-20020a056512340300b0048c972750b0mr3780115lfr.309.1662711202905;
        Fri, 09 Sep 2022 01:13:22 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m18-20020a195212000000b00492d270db5esm168834lfb.242.2022.09.09.01.13.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 01:13:22 -0700 (PDT)
Message-ID: <1e0505c4-d98f-03bf-468e-43226d20cc77@linaro.org>
Date:   Fri, 9 Sep 2022 10:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 9/9] arm64: dts: qcom: sm4250: Add support for
 oneplus-billie2
Content-Language: en-US
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-kernel@vger.kernel.org
References: <20220903174150.3566935-1-iskren.chernev@gmail.com>
 <20220903174150.3566935-10-iskren.chernev@gmail.com>
 <e655cddd-677b-f277-667f-48107671db2a@linaro.org>
 <843b8280-5e71-c008-0ca2-4d289ca6e7da@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <843b8280-5e71-c008-0ca2-4d289ca6e7da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <phone-devel.vger.kernel.org>
X-Mailing-List: phone-devel@vger.kernel.org

On 08/09/2022 19:52, Iskren Chernev wrote:
> 
> 
> On 9/6/22 11:33, Krzysztof Kozlowski wrote:
>> On 03/09/2022 19:41, Iskren Chernev wrote:
>>> Remaining issues from make dtbs_check:
>>> - rpm-requests: it doesn't like the pm6125-regulators subnode. Every other
>>>   DTS I checked is written in this way.
>>
>> Yes, I sent patches for it, already merged, so please rebase on linux-next.
>>
>> https://lore.kernel.org/all/20220828084341.112146-1-krzysztof.kozlowski@linaro.org/
>>
>> Please rebase and test with
>> Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> 
> It looks like this patch covers SPMI regulators. In most devices RPM/H (i.e
> indirect) regulators are used, so this doesn't fix it for me.

Indeed, but I got good news! The SMD/RPM was fixed here:
https://lore.kernel.org/all/20220901093243.134288-1-krzysztof.kozlowski@linaro.org/

Although anyway you Cc old addresses here, so you need to rebase on next
and use get_maintainers.pl.

Bjorn,
Can we get the schemas merged?

Best regards,
Krzysztof
